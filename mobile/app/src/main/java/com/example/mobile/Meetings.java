package com.example.mobile;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.mobile.entities.CareerDay;
import com.example.mobile.entities.Employee;
import com.example.mobile.entities.Employer;
import com.example.mobile.entities.Meeting;
import com.example.mobile.entities.Student;
import com.example.mobile.entities.TimeSlot;
import com.example.mobile.entities.User;
import com.example.mobile.managers.FetchManager;
import com.google.gson.Gson;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.concurrent.ExecutionException;

public class Meetings extends Activity {
    private static final String TAG = "debug";
    Context ctx;
    String idrolevalue, idvalue, emailvalue, pwvalue, prenomvalue, nomvalue;
    ArrayList<Meeting> meetings;
    ArrayList<User> users;
    ArrayList<CareerDay> careerDays;

    ScrollView svListMeetings;
    TextView tvAlertTextEmptyMeetingsList;
    TextView tvMeetingHours;
    TextView tvMeetingName;
    ImageView imgLogoEnterprise;

    String idMeeting;

    LinearLayout llMeetingContainer;
    Button btn_url;
    Button btn_url_modifier_meeting;

    Gson json;

    String data = null;
    String idUserConnected;

    private Button btnAnnulerMeeting;
    private TextView tvRoomNumber;
    private TextView tvEnterpriseName;
    private TextView tvEntrevueParticipantName;
    private TextView tvNomEtudiant;
    private TextView tvProgramName;
    private CareerDay careerDay;

    Boolean isOpened = false;

    User user;

    Student student;
    Employee employee;

    String environnementTest;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_meetings);
        ctx = this;
        svListMeetings = findViewById(R.id.ll_list_meeting);
        int id = getSharePrefenreceIdUser();
        idUserConnected = String.valueOf(id);
        environnementTest = getSharePrefenreceTestType();
        Log.d(TAG, "onCreate: GET share pref machine de test :" + environnementTest);
        Log.d(TAG, "onCreate: id sharepref receive :" + idUserConnected + "id receive: " + id);
        try {
            new FetchManager("test");
            user = FetchManager.fetchUserById(idUserConnected).get(0);
        } catch (ExecutionException | InterruptedException e) {
            e.printStackTrace();
        }
        Bundle extras = getIntent().getExtras();
        if (extras != null) {
            idrolevalue = extras.getString("idrolekey");
            idvalue = extras.getString("idkey");
            emailvalue = extras.getString("emailkey");
            pwvalue = extras.getString("pwkey");
            nomvalue = extras.getString("nomkey");
            prenomvalue = extras.getString("prenomkey");
        }

        if (idUserConnected.equals("0")) {
            //aucun meetings
            Log.d(TAG, "onCreate: aucun meeting inscrit");
        } else {
            //fetch meeting par user id
            try {
                careerDays = FetchManager.fetchCareerDay();
                careerDay = careerDays.get(0);
//                users = FetchManager.fetchUserById(idUserConnected);
                meetings = initMeeting(user);
                afficherMeetingList();
            } catch (ExecutionException | InterruptedException e) {
                e.printStackTrace();
            }


        }
//        Log.d("debug", "onCreate: container contain : asyntask array meeting : " + meetings.get(0).getId() + " meetingSize: " + meetings.size());
    }

    private class DownloadImageTask extends AsyncTask<String, Void, Bitmap> {
        ImageView bmImage;

        public DownloadImageTask(ImageView bmImage) {
            this.bmImage = bmImage;
        }

        protected Bitmap doInBackground(String... urls) {
            String urldisplay = urls[0];
            Bitmap imgToReturn = null;
            try {
                InputStream in = new java.net.URL(urldisplay).openStream();
                imgToReturn = BitmapFactory.decodeStream(in);
            } catch (Exception e) {
                Log.e("Error", e.getMessage());
                e.printStackTrace();
            }
            return imgToReturn;
        }

        protected void onPostExecute(Bitmap result) {
            bmImage.setImageBitmap(result);
        }
    }

    private int getSharePrefenreceIdUser() {
        SharedPreferences sharedPref = getSharedPreferences("User", Context.MODE_PRIVATE);
        int idUser = sharedPref.getInt("idUser", 0);
        Log.d(TAG, "getSharePrefenreceIdUser: id user : " + idUser);
        return idUser;
    }

    private String getSharePrefenreceTestType() {
        SharedPreferences sharedPref = getSharedPreferences("User", Context.MODE_PRIVATE);
        String testType = sharedPref.getString("typeTest", "local");
        Log.d(TAG, "getSharePrefenreceTestType: test type : " + testType);
        return testType;
    }

    private void setImage(Meeting meeting) throws ExecutionException, InterruptedException {
        Bitmap downloadedImg = new DownloadImageTask(imgLogoEnterprise)
            .execute("https://projetfinalheroku.s3.us-east-2.amazonaws.com/" + meeting.getLogo_url()).get();
        Log.d(TAG, "setImage: bitmap receive :" + downloadedImg.toString());
//        Canvas canvas = new Canvas(downloadedImg);
        imgLogoEnterprise.setImageBitmap(downloadedImg);
//        imgLogoEnterprise.draw(canvas);
    }

    private void afficherMeetingList() throws ExecutionException, InterruptedException {
        //AFFICHER MEETING SELON LE ROLE DU USER CONNECTER AVEC UN SWITCH
        //QUI INSTANCIE UN ARRAY DE MEETING SELON LE ROLE DU USER CONNECTER

        int index = 0;
        LinearLayout listMeeting = new LinearLayout(ctx);
        //setting textview text in foreach loop
        for (Meeting meeting : meetings) {
            Log.d(TAG, "afficherMeetingList: id meeting = " + meeting.getId());
            //LL container from activity
            LinearLayout meetingLayoutView = (LinearLayout) LayoutInflater.from(ctx).inflate(R.layout.layout_meeting_view, null);
            meetingLayoutView.setTag(index);
            index++;
            tvMeetingHours = meetingLayoutView.findViewById(R.id.tv_horaire_meeting);
            tvMeetingName = meetingLayoutView.findViewById(R.id.tv_title_meeting);
            imgLogoEnterprise = meetingLayoutView.findViewById(R.id.img_logo_entreprise);
            tvRoomNumber = meetingLayoutView.findViewById(R.id.tv_room_number);
            tvEnterpriseName = meetingLayoutView.findViewById(R.id.tv_nom_entreprise_meeting);
            tvEntrevueParticipantName = meetingLayoutView.findViewById(R.id.tv_entrevue_with_name);
            tvNomEtudiant = meetingLayoutView.findViewById(R.id.tv_nom_etudiant);
            tvProgramName = meetingLayoutView.findViewById(R.id.tv_program_name);
            btn_url_modifier_meeting = meetingLayoutView.findViewById(R.id.btn_url_modifier_meeting);
            btnAnnulerMeeting = meetingLayoutView.findViewById(R.id.btn_annuler);

            tvProgramName.setText(meeting.getProgram());
            tvNomEtudiant.setText(meeting.getStudent_name());
            tvEntrevueParticipantName.setText(meeting.getEmployee_name());
            tvEnterpriseName.setText(meeting.getEnterprise_name());
            tvRoomNumber.setText(String.valueOf(meeting.getRoom()));
            tvMeetingName.setText(meeting.getEnterprise_name());
            tvMeetingHours.setText(meeting.getDate_time());

            if (user.getId_role() != 2) {
                btn_url_modifier_meeting.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View view) {
//                    setSharePrefenceIdMeeting(meeting);
                        String meetingClickString = json.toJson(meeting);
                        Toast.makeText(ctx, meetingClickString, Toast.LENGTH_SHORT).show();
                        Log.d(TAG, "onClick: Meeting click json: " + meetingClickString);
                        Intent intent = new Intent(ctx, MeetingSettings.class);
//                    intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK);
//                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                        intent.putExtra("meetingClicked", meetingClickString);
                        startActivity(intent);
                        finish();
                    }
                });
            } else {
                btn_url_modifier_meeting.setVisibility(View.GONE);
            }
            ArrayList<TimeSlot> allTimeSlot = new ArrayList<>();
            btnAnnulerMeeting.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Log.d(TAG, "onClick: ANNULEERR CLCIKKERR");
                    ArrayList<TimeSlot> timeSlotsStudents = null;
                    ArrayList<TimeSlot> timeSlotsEmployees = null;
                    try {

                        //get etudiant from meeting
                        student = FetchManager.fetchStudents(String.valueOf(meeting.getId_student())).get(0);
                        //get employe from meeting
                        employee = FetchManager.fetchEmployee(String.valueOf(meeting.getId_employee())).get(0);
                        //get timeSlot from student and employee
                        timeSlotsStudents = FetchManager.fetchTimeSlot(String.valueOf(student.getId()));
                        timeSlotsEmployees = FetchManager.fetchTimeSlot(String.valueOf(employee.getId()));
                        //merge array
                        allTimeSlot.addAll(timeSlotsStudents);
                        allTimeSlot.addAll(timeSlotsEmployees);

                        //cancel meeting
                        FetchManager.fetchMeetingCancel(String.valueOf(meeting.getId()));
                    } catch (ExecutionException | InterruptedException e) {
                        e.printStackTrace();
                    }
                    //remove timeslot from indisponible
                    //trouver le timeslot correspondant a celui du meeting.getDate_time
                    int index = 0;
                    for (TimeSlot timeSlot : allTimeSlot) {
                        Log.d(TAG, "onClick: data to compare :" + meeting.getDate_time() + "  " + timeSlot.getTime_slot() + " index : " + index);

                        if (meeting.getDate_time().equals(timeSlot.getTime_slot())) {
                            Log.d(TAG, "onClick: YES find one " + meeting.getDate_time() + "  " + timeSlot.getTime_slot());
//                            allTimeSlot.remove(index);
                            Log.d(TAG, "onClick: TimeSlot to remove : " + timeSlot.getId() + timeSlot.getId_user() + timeSlot.getTime_slot());
                            //delete timeslot from db
                            FetchManager.deleteTimeSlotById(String.valueOf(timeSlot.getId()));
                        }
                        index++;
                    }
                    Toast.makeText(Meetings.this, "meeting annulé !", Toast.LENGTH_LONG).show();
                    //Toast.makeText(Meetings.this, "meeting:"+meeting.getEnterprise_name(), Toast.LENGTH_LONG).show();
                    Intent intent = new Intent(ctx, Dashboard.class);
                    intent.putExtra("idkey", idvalue);
                    intent.putExtra("idrolekey", idrolevalue);
                    intent.putExtra("emailkey", emailvalue);
                    intent.putExtra("pwkey", pwvalue);
                    intent.putExtra("nomkey", nomvalue);
                    intent.putExtra("prenomkey", prenomvalue);
                    startActivity(intent);
                    finish();
                }
            });
            setImage(meeting);

            //list meeting container
            listMeeting.setOrientation(LinearLayout.VERTICAL);
            listMeeting.addView(meetingLayoutView);

            llMeetingContainer = meetingLayoutView.findViewById(R.id.meeting_container);
            final Boolean[] isOpen = {false, true};


            llMeetingContainer.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Log.d("debug", "onClick: meeting container OPEN detail conatiner : " + isOpened);

                    if (user.getId_role() == 2) {
                        btnAnnulerMeeting.setVisibility(View.INVISIBLE);
                    }
                    LinearLayout llDetailMeeting = view.findViewById(R.id.testMeetingDetail);
                    if (isOpened) {
                        llDetailMeeting.setVisibility(LinearLayout.GONE);
                        isOpened = false;
                    } else {
                        llDetailMeeting.setVisibility(LinearLayout.VISIBLE);
                        isOpened = true;
//                        btnAnnulerMeeting.setOnClickListener(new View.OnClickListener() {
//                            @Override
//                            public void onClick(View view) {
//                                ArrayList<TimeSlot> timeSlotsStudents = null;
//                                ArrayList<TimeSlot> timeSlotsEmployees = null;
//                                Calendar calendar = Calendar.getInstance();
//                                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH");
//                                SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("mm");
//                                String dateTimeH = simpleDateFormat.format(calendar.getTime());
//                                String dateTimeM = simpleDateFormat2.format(calendar.getTime());
//
//                                int hourMeeting = 0;
//                                int minMeeting = 0;
//
//                                if (Integer.valueOf(meeting.getDate_time().length()) == 5) {
//                                    hourMeeting = Integer.valueOf(meeting.getDate_time().substring(0, 2));
//                                    minMeeting = Integer.valueOf(meeting.getDate_time().substring(3, 5));
//                                } else if (Integer.valueOf(meeting.getDate_time().length()) == 4) {
//                                    hourMeeting = Integer.valueOf(meeting.getDate_time().substring(0, 1));
//                                    minMeeting = Integer.valueOf(meeting.getDate_time().substring(2, 4));
//                                } else if (Integer.valueOf(meeting.getDate_time().length()) == 3) {
//                                    hourMeeting = Integer.valueOf(meeting.getDate_time().substring(0, 2));
//                                    minMeeting = 0;
//                                } else if (Integer.valueOf(meeting.getDate_time().length()) == 2) {
//                                    hourMeeting = Integer.valueOf(meeting.getDate_time().substring(0, 1));
//                                    minMeeting = 0;
//                                }
//
//                                int hourCurrent = Integer.parseInt(dateTimeH);
//                                int minCurrent = Integer.parseInt(dateTimeM);
//
//
//                                if (hourCurrent > hourMeeting) {
//                                    Toast.makeText(Meetings.this, "impossible d'annuler un meeting passé  !", Toast.LENGTH_LONG).show();
//                                } else if (hourCurrent == hourMeeting && minCurrent > minMeeting) {
//                                    Toast.makeText(Meetings.this, "impossible d'annuler un meeting passé  !", Toast.LENGTH_LONG).show();
//                                } else {
//                                    try {
//
//                                        //get etudiant from meeting
//                                        student = FetchManager.fetchStudents(String.valueOf(meeting.getId_student())).get(0);
//                                        //get employe from meeting
//                                        employee = FetchManager.fetchEmployee(String.valueOf(meeting.getId_employee())).get(0);
//                                        //get timeSlot from student and employee
//                                        timeSlotsStudents = FetchManager.fetchTimeSlot(String.valueOf(student.getId()));
//                                        timeSlotsEmployees = FetchManager.fetchTimeSlot(String.valueOf(employee.getId()));
//                                        //merge array
//                                        ArrayList<TimeSlot> allTimeSlot = new ArrayList<>();
//                                        allTimeSlot.addAll(timeSlotsStudents);
//                                        allTimeSlot.addAll(timeSlotsEmployees);
//
//                                        //cancel meeting
//                                        FetchManager.fetchMeetingCancel(String.valueOf(meeting.getId()));
//                                        //remove timeslot from indisponible
//                                        //trouver le timeslot correspondant a celui du meeting.getDate_time
//                                        int index = 0;
//                                        for (TimeSlot timeSlot : allTimeSlot) {
//                                            Log.d(TAG, "onClick: data to compare :" + meeting.getDate_time() + "  " + timeSlot.getTime_slot() + " index : " + index);
//
//                                            if (meeting.getDate_time().equals(timeSlot.getTime_slot())) {
//                                                Log.d(TAG, "onClick: YES find one " + meeting.getDate_time() + "  " + timeSlot.getTime_slot());
////                                                allTimeSlot.remove(index);
//                                                //delete timeslot from db
//                                                FetchManager.deleteTimeSlotById(String.valueOf(timeSlot.getId()));
//                                            }
//                                            index++;
//                                        }
//
//                                    } catch (ExecutionException | InterruptedException e) {
//                                        e.printStackTrace();
//                                    }
//                                    Toast.makeText(Meetings.this, "meeting annulé !", Toast.LENGTH_LONG).show();
//                                    //Toast.makeText(Meetings.this, "meeting:"+meeting.getEnterprise_name(), Toast.LENGTH_LONG).show();
//                                    Intent intent = new Intent(ctx, Dashboard.class);
//                                    intent.putExtra("idkey", idvalue);
//                                    intent.putExtra("idrolekey", idrolevalue);
//                                    intent.putExtra("emailkey", emailvalue);
//                                    intent.putExtra("pwkey", pwvalue);
//                                    intent.putExtra("nomkey", nomvalue);
//                                    intent.putExtra("prenomkey", prenomvalue);
//                                    startActivity(intent);
//                                    finish();
//                                }
//                            }
//                        });
                    }
//                    llMeetingContainer.invalidate();
                }
            });
        }
        //scrollview meetings container
        svListMeetings.addView(listMeeting);

    }

    private void isUserPresent() throws ExecutionException, InterruptedException {
        Boolean isUserPresent = FetchManager.fetchUserAttendance(idUserConnected, String.valueOf(careerDay.getId()));

        if (!isUserPresent) {
            Log.d(TAG, "isUserPresent: NO");
        } else {
            Log.d(TAG, "isUserPresent: YES");
        }
    }

    private ArrayList<Meeting> initMeeting(User u) throws ExecutionException, InterruptedException {
        json = new Gson();
        tvAlertTextEmptyMeetingsList = findViewById(R.id.tv_avertissement_meetings);

        Log.d(TAG, "initMeeting: User role: " + u.getId_role());
        ArrayList<Meeting> arrayToReturn = new ArrayList<>();
        switch (u.getId_role()) {
            case 1: //admin
                arrayToReturn = FetchManager.fetchAllMeetingByCareerDay(String.valueOf(careerDay.getId()));
                break;
            case 2: //Student
            case 3: // Employee
                arrayToReturn = FetchManager.fetchAllMeetingsByUserIdAndActiveCareerDayId(idUserConnected, String.valueOf(careerDay.getId()));
                Log.d(TAG, "initMeeting: ARRAY RETURN : " + arrayToReturn.get(0).getId());
                //verification if user Student is register
                //isUserPresent();
                break;
            case 4: //Employer
                Log.d("debugApp", "user id: " + idUserConnected);
                ArrayList<Employer> employees = FetchManager.fetchEmployer(idUserConnected);
                Log.d("debugApp", "Enterprise id: " + employees.get(0).getIdEntreprise());
                arrayToReturn = FetchManager.fetchAllMeetingsByEnterpriseId(employees.get(0).getIdEntreprise(), String.valueOf(careerDay.getId()));
                break;
            default:
                throw new IllegalStateException("Unexpected value: " + u.getId_role());
        }
        if (arrayToReturn.isEmpty()) {
            Log.d(TAG, "initMeeting: list de meeting vide");
            tvAlertTextEmptyMeetingsList.setVisibility(View.VISIBLE);
        }
        return arrayToReturn;
    }
}