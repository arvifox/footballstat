unit DBConst;

interface

const

// db table name
  // type data directory
  T_Card_Reason =                 'T_Card_Reason';
  T_Card_Type =                   'T_Card_Type';
  T_Condition_Type =              'T_Condition_Type';
  T_Distance_Pass =               'T_Distance_Pass';
  T_Distance_Type =               'T_Distance_Type';
  T_Foul_Type =                   'T_Foul_Type';
  T_Injury_Type =                 'T_Injury_Type';
  T_Match_Events_Type =           'T_Match_Events_Type';
  T_Match_Result =                'T_Match_Result';
  T_Org_Post =                    'T_Org_Post';
  T_Org_Type =                    'T_Org_Type';
  T_Pass_Result =                 'T_Pass_Result';
  T_Penalty_Attack =              'T_Penalty_Attack';
  T_Penalty_Goalkeeper =          'T_Penalty_Goalkeeper';
  T_Place_Type =                  'T_Place_Type';

  T_Position_Classic =            'T_Position_Classic';
    //fields
    T_Position_Classic_id =                            'id';
    T_Position_Classic_classic_position_name =         'classic_position_name';
    T_Position_Classic_classic_position_label =        'classic_position_label';

  T_Position_Play =               'T_Position_Play';
  T_Referee_Match_Type =          'T_Referee_Match_Type';
  T_Shot_Result =                 'T_Shot_Result';

  T_Stage_Group_Name =            'T_Stage_Group_Name';
    // fields
    T_Stage_Group_Name_id =         'id';
    T_Stage_Group_Name_name =       'stage_group_name';

  T_Stage_Name =                  'T_Stage_Name';
    //fields
    T_Stage_Name_id =               'id';
    T_Stage_Name_stage_name =       'stage_name';

  T_Stage_Pattern_Name =          'T_Stage_Pattern_Name';
    // fields
    T_Stage_Pattern_Name_id =                  'id';
    T_Stage_Pattern_Name_stage_pattern_name =  'stage_pattern_name';

  T_Stage_Pattern_Type =          'T_Stage_Pattern_Type';
    //fields
    T_Stage_Pattern_Type_id =          'id';
    T_Stage_Pattern_Type_type_name =   'type_name';
    T_Stage_Pattern_Type_type_code =   'type_code';
    // code
    st_Group_Stage =                   2;
    st_Playoff =                       4;
    st_Pair =                          128;
    st_Contain_Pair =                  256;
    st_Application_Team =              512;
    st_Application_Player =            1024;

  T_Statistics_Data_Numerical =   'T_Statistics_Data_Numerical';
  T_Statistics_Type_Numerical =   'T_Statistics_Type_Numerical';
  T_Substitution_Reason =         'T_Substitution_Reason';

  T_Team_Type =                   'T_Team_Type';
    // field
    T_Team_Type_id =                          'id';
    T_Team_Type_team_type =                   'team_type';

  T_Team_Type_Age =               'T_Team_Type_Age';
    // field
    T_Team_Type_Age_id =                      'id';
    T_Team_Type_Age_team_type_age =           'team_type_age';

  T_Team_Type_General =           'T_Team_Type_General';
    // field
    T_Team_Type_General_id =                  'id';
    T_Team_Type_General_team_type_general =   'team_type_general';

  T_Team_Type_Sex =               'T_Team_Type_Sex';
    // field
    T_Team_Type_Sex_id =                      'id';
    T_Team_Type_Sex_team_type_sex =           'team_type_sex';

  T_Tournament_Officials_Type =   'T_Tournament_Officials_Type';
    // fields
    T_Tournament_Officials_Type_id =     'id';
    T_Tournament_Officials_Type_name =   'officials_type_name';

  T_Tournament_Pattern_Field =    'T_Tournament_Pattern_Field';
    // fileds
    T_Tournament_Pattern_Field_id =           'id';
    T_Tournament_Pattern_Field_field_name =   'field_name';
    T_Tournament_Pattern_Field_field_code =   'field_code';
    // code
    fc_Season_y =              1;
    fc_Season_yy =             2;
    fc_Season_host =           4;

  T_Tournament_Field_Season_y =   'T_Tournament_Field_Season_y';
    //fields
    T_Tournament_Field_Season_y_id =               'id';
    T_Tournament_Field_Season_y_id_tournament =    'id_tournament';
    T_Tournament_Field_Season_y_tournament_year =  'tournament_year';

  T_Tournament_Field_Season_yy =  'T_Tournament_Field_Season_yy';
    //fields
    T_Tournament_Field_Season_yy_id =               'id';
    T_Tournament_Field_Season_yy_id_tournament =    'id_tournament';
    T_Tournament_Field_Season_yy_year_from =        'year_from';
    T_Tournament_Field_Season_yy_year_to =          'year_to';

  T_Tournament_Field_Host_Country =   'T_Tournament_Field_Host_Country';
    //fields
    T_Tournament_Field_Host_Country_id =              'id';
    T_Tournament_Field_Host_Country_id_tournament =   'id_tournament';
    T_Tournament_Field_Host_Country_id_geography =    'id_geography';

  // geography data directory
  T_Geography =                   'T_Geography';
    // fields
    T_Geography_id =                'id';
    T_Geography_name =              'geography_name';
    T_Geography_geography_type =    'geography_type';

  T_Geography_Type =              'T_Geography_Type';
    //fields
    T_Geography_Type_id =           'id';
    T_Geography_Type_name =         'geography_type_name';

  T_Geography_Hierarchy =         'T_Geography_Hierarchy';
    // fields
    T_Geography_Hierarchy_id =          'id';
    T_Geography_Hierarchy_id_parent =   'id_parent';
    T_Geography_Hierarchy_id_child =    'id_child';
    T_Geography_Hierarchy_date_from =   'date_from';

  // organization
  T_Organization =                'T_Organization';
  T_Tournament_Organization =     'T_Tournament_Organization';

  // tournament
  T_Tournament =                  'T_Tournament';
    // fields
    T_Tournament_id =                          'id';
    T_Tournament_tournament_name =             'tournament_name';
    T_Tournament_id_tournament_organization =  'id_tournament_organization';
    T_Tournament_id_tournament_pattern =       'id_tournament_pattern';
    T_Tournament_emblem =                      'emblem';

  T_Tournament_Pattern =           'T_Tournament_Pattern';
    // fields
    T_Tournament_Pattern_id =                             'id';
    T_Tournament_Pattern_tournament_pattern_name =        'tournament_pattern_name';
    T_Tournament_Pattern_pattern_description =            'pattern_description';
    T_Tournament_Pattern_tournament_pattern_field =       'tournament_pattern_field';
    T_Tournament_Pattern_id_team_type =                   'id_team_type';
    T_Tournament_Pattern_id_team_type_general =           'id_team_type_general';
    T_Tournament_Pattern_id_team_type_age =               'id_team_type_age';
    T_Tournament_Pattern_id_team_type_sex =               'id_team_type_sex';

  // stage
  T_Stage_Pattern =               'T_Stage_Pattern';
    // field
    T_Stage_Pattern_id =                     'id';
    T_Stage_Pattern_id_stage_name =          'id_stage_name';
    T_Stage_Pattern_id_stage_pattern_name =  'id_stage_pattern_name';
    T_Stage_Pattern_id_tournament_pattern =  'id_tournament_pattern';
    T_Stage_Pattern_id_parent_stage =        'id_parent_stage';
    T_Stage_Pattern_stage_pattern_type =     'stage_pattern_type';
    T_Stage_Pattern_number =                 'number';
    T_Stage_Pattern_number_of_lap =          'number_of_lap';

  // group
  T_Stage_Group_Pattern =         'T_Stage_Group_Pattern';
    // field
    T_Stage_Group_Pattern_id =                 'id';
    T_Stage_Group_Pattern_id_group_name =      'id_group_name';
    T_Stage_Group_Pattern_id_stage_pattern =   'id_stage_pattern';

  // move
  T_Stage_Pattern_Move_GP =       'T_Stage_Pattern_Move_GP';
    // fields
    T_Stage_Pattern_Move_GP_id =                  'id';
    T_Stage_Pattern_Move_GP_id_group_pattern =    'id_group_pattern';
    T_Stage_Pattern_Move_GP_position =            'pos';
    T_Stage_Pattern_Move_GP_id_pair =             'id_pair';
    T_Stage_Pattern_Move_GP_home =                'home';

  T_Stage_Pattern_Move_PP =       'T_Stage_Pattern_Move_PP';
    // fields
    T_Stage_Pattern_Move_PP_id =                  'id';
    T_Stage_Pattern_Move_PP_id_pair_from =        'id_pair_from';
    T_Stage_Pattern_Move_PP_won =                 'won';
    T_Stage_Pattern_Move_PP_id_pair_to =          'id_pair_to';
    T_Stage_Pattern_Move_PP_home =                'home';

  T_Stage_Playoff =               'T_Stage_Playoff';
    // fields
    T_Stage_Playoff_id =                   'id';
    T_Stage_Playoff_id_stage_pattern =     'id_stage_pattern';
    T_Stage_Playoff_form =                 'form';

  T_Application_Team_T =          'T_Application_Team_Tournament';
    //fields
    T_Application_Team_T_id =                'id';
    T_Application_Team_T_id_tournament =     'id_tournament';
    T_Application_Team_T_id_team =           'id_team';

  T_Application_Team_S =          'T_Application_Team_Stage';
    //fields
    T_Application_Team_S_id =                'id';
    T_Application_Team_S_id_tournament =     'id_tournament';
    T_Application_Team_S_id_stage =          'id_stage';
    T_Application_Team_S_id_team =           'id_team';

  //Matches
  T_Match =                       'T_Match';
    // fields
    T_Match_id =                      'id';
    T_Match_id_home_team =            'id_home_team';
    T_Match_id_guest_team =           'id_guest_team';
    T_Match_goal_home_team =          'goal_home_team';
    T_Match_goal_guest_team =         'goal_guest_team';
    T_Match_id_tournament =           'id_tournament';
    T_Match_id_stage_pattern =        'id_stage_pattern';
    T_Match_match_date =              'match_date';
    T_Match_match_time_begin =        'match_time_begin';
    T_Match_match_number =            'match_number';
    T_Match_id_stadium =              'id_stadium';
    T_Match_tactical_lineup =         'tactical_line-up';
    T_Match_id_match_result =         'id_match_result';
    T_Match_add_time1 =               'add_time1';
    T_Match_add_time2 =               'add_time2';
    T_Match_add_extra_time1 =         'add_extra_time1';
    T_Match_add_extra_time2 =         'add_extra_time2';
    T_Match_aet =                     'aet';
    T_Match_pso =                     'pso';
    T_Match_pso_home_team =           'pso_home_team';
    T_Match_pso_guest_team =          'pso_guest_team';

  // team
  T_Team =                        'T_Team';
    // fields
    T_Team_id =                        'id';
    T_Team_team_name =                 'team_name';
    T_Team_team_name_full =            'team_name_full';
    T_Team_team_name_short =           'team_name_short';
    T_Team_team_nickname =             'team_nickname';
    T_Team_foundation_date =           'foundation_date';
    T_Team_shutdown_date =             'shutdown_date';
    T_Team_id_team_type =              'id_team_type';
    T_Team_id_team_type_general =      'id_team_type_general';
    T_Team_id_team_type_age =          'id_team_type_age';
    T_Team_id_team_type_sex =          'id_team_type_sex';

  // people
  T_People =                      'T_People';
    // fields
    T_People_id =                   'id';
    T_People_first_name =           'first_name';
    T_People_last_name =            'last_name';
    T_People_nick_name =            'nick_name';
    T_People_shirt_name =           'shirt_name';
    T_People_display_name =         'display_name';
    T_People_birthday =             'birthday';
    T_People_id_birth_country =     'id_birth_country';
    T_People_photo =                'photo';
    T_People_right_handed =         'right_handed';
    T_People_height =               'height';
    T_People_id_position_classic =  'id_position_classic';
    T_People_play_position =        'play_position';

  T_People_Citizenship =          'T_People_Citizenship';
    //fields
    T_People_Citizenship_id =            'id';
    T_People_Citizenship_id_man =        'id_man';
    T_People_Citizenship_id_geography =  'id_geography';

implementation

end.
