return {
  ["PID_TUNING"] = {
    ["pid_0_D"] = "Force de l'amortissement de tout mouvement sur le systeme, y compris les influences externes. Reduit egalement le depassement.",
    ["pid_0_F"] = "Aide a pousser le terme P en fonction de l'entree du manche. Augmenter rendra la reponse plus vive, mais peut causer un depassement.",
    ["pid_1_O"] = "Utilise pour empecher l'appareil de tanguer lors de l'utilisation d'un collectif eleve.",
    ["pid_2_I"] = "A quel point le systeme maintient sa position.",
    ["pid_0_I"] = "A quel point le systeme maintient sa position.",
    ["pid_2_B"] = "Boost supplementaire sur le feedforward pour rendre l'helico plus reactif aux mouvements rapides du manche.",
    ["pid_1_D"] = "Force de l'amortissement de tout mouvement sur le systeme, y compris les influences externes. Reduit egalement le depassement.",
    ["pid_0_P"] = "A quel point le systeme suit le point de consigne desire.",
    ["pid_0_B"] = "Boost supplementaire sur le feedforward pour rendre l'helico plus reactif aux mouvements rapides du manche.",
    ["pid_1_B"] = "Boost supplementaire sur le feedforward pour rendre l'helico plus reactif aux mouvements rapides du manche.",
    ["pid_1_F"] = "Aide a pousser le terme P en fonction de l'entree du manche. Augmenter rendra la reponse plus vive, mais peut causer un depassement.",
    ["pid_2_D"] = "Force de l'amortissement de tout mouvement sur le systeme, y compris les influences externes. Reduit egalement le depassement.",
    ["pid_1_I"] = "A quel point le systeme maintient sa position.",
    ["pid_2_P"] = "A quel point le systeme suit le point de consigne desire.",
    ["pid_1_P"] = "A quel point le systeme suit le point de consigne desire.",
    ["pid_0_O"] = "Utilise pour empecher l'appareil de rouler lors de l'utilisation d'un collectif eleve.",
    ["pid_2_F"] = "Aide a pousser le terme P en fonction de l'entree du manche. Augmenter rendra la reponse plus vive, mais peut causer un depassement.",
  },
  ["MIXER_CONFIG"] = {
    ["swash_pitch_limit"] = "Quantite maximale de pas de pale combine cyclique et collectif.",
    ["tbl_cw"] = "Sens Horaire",
    ["collective_tilt_correction_neg"] = "Ajuster l'echelle de correction de l'inclinaison du collectif pour un pas collectif negatif.",
    ["swash_phase"] = "Decalage de phase pour les commandes du plateau cyclique.",
    ["tbl_ccw"] = "Sens AntiHoraire",
    ["tail_center_trim"] = "Reglage du rotor de queue pour un lacet nul pour un pas variable, ou une acceleration du moteur de queue pour un lacet nul.",
    ["swash_geo_correction"] = "Ajuster s'il y a trop de collectif negatif ou trop de collectif positif.",
    ["swash_trim_0"] = "Reglage du plateau cyclique pour l'equilibrer lorsque des liens fixes sont utilises.",
    ["swash_trim_1"] = "Reglage du plateau cyclique pour l'equilibrer lorsque des liens fixes sont utilises.",
    ["tail_motor_idle"] = "Signal de gaz minimum envoye au moteur de queue. Doit etre juste assez eleve pour que le moteur ne s'arrete pas.",
    ["swash_trim_2"] = "Reglage du plateau cyclique pour l'equilibrer lorsque des liens fixes sont utilises.",
    ["swash_tta_precomp"] = "Precompensation du mixeur pour un lacet nul.",
    ["collective_tilt_correction_pos"] = "Ajuster l'echelle de correction de l'inclinaison du collectif pour un pas collectif positif.",
  },
  ["GOVERNOR_PROFILE"] = {
    ["governor_p_gain"] = "Gain du terme P de la boucle PID.",
    ["governor_max_throttle"] = "Accelerateur de sortie maximal que le regulateur est autorise a utiliser.",
    ["governor_yaw_ff_weight"] = "Valeur de precompensation en lacet - quantite de lacet melangee dans la precompensation.",
    ["governor_tta_gain"] = "Gain TTA appliquer pour augmenter la vitesse de rotation afin de controler la queue dans le sens negatif (par exemple, une queue motorisee a une vitesse inferieure au ralenti).",
    ["governor_tta_limit"] = "Limite TTA de l'augmentation maximale de la vitesse de rotation par rapport a la vitesse de rotation totale.",
    ["governor_i_gain"] = "Gain du terme I de la boucle PID.",
    ["governor_collective_ff_weight"] = "Valeur de precompensation collective - quantite de collective melangee dans la precompensation.",
    ["governor_min_throttle"] = "Accelerateur de sortie minimal que le regulateur est autorise a utiliser.",
    ["governor_f_gain"] = "Gain de precompensation (feedforward).",
    ["governor_cyclic_ff_weight"] = "Valeur de precompensation cyclique - quantite de cyclique melangee dans la precompensation.",
    ["governor_gain"] = "Gain principal de la boucle PID.",
    ["governor_headspeed"] = "Vitesse de rotation pour le profil actuel.",
    ["governor_d_gain"] = "Gain du terme D de la boucle PID.",
  },
  ["PID_PROFILE"] = {
    ["yaw_inertia_precomp_cutoff"] = "Frequence de coupure. Frequence de coupure du derive en pas de 1/10Hz. Controle la nettete de la precompensation. Une valeur plus elevee est plus nette.",
    ["yaw_cyclic_ff_gain"] = "Feedforward cyclique melange dans le lacet (precomp cyclique-a-lacet).",
    ["error_decay_limit_cyclic"] = "Vitesse maximale de reduction pour l'I-term cyclique.",
    ["tbl_rp"] = "RP",
    ["dterm_cutoff_2"] = "Frequence de coupure du D-term en Hz.",
    ["tbl_off"] = "DESACTIVER",
    ["bterm_cutoff_2"] = "Frequence de coupure du B-term en Hz.",
    ["iterm_relax_cutoff_1"] = "Aide a reduire le rebond apres des mouvements rapides du manche. Peut causer une incoherence dans les petits mouvements du manche si trop bas.",
    ["gyro_cutoff_0"] = "Bande passante globale de la boucle PID en Hz.",
    ["cyclic_cross_coupling_ratio"] = "Quantite de compensation roulis-tangage necessaire, par rapport au tangage-roulis.",
    ["iterm_relax_type"] = "Choisissez les axes dans lesquels cela est actif. RP: Roulis, Tangage. RPY: Roulis, Tangage, Lacet.",
    ["offset_limit_0"] = "Limite stricte pour l'angle de decalage de l'integrale a grande vitesse dans la boucle PID. Le O-term ne depassera jamais ces limites.",
    ["error_decay_time_cyclic"] = "Constante de temps pour reduire l'I-term cyclique. Plus eleve stabilisera le vol stationnaire, plus bas derivera.",
    ["yaw_collective_dynamic_decay"] = "Temps de decroissance pour la precompensation supplementaire du lacet sur l'entree collective.",
    ["tbl_on"] = "ACTIVER",
    ["cyclic_cross_coupling_cutoff"] = "Limite de frequence pour la compensation. Une valeur plus elevee rendra l'action de compensation plus rapide.",
    ["error_limit_0"] = "Limite stricte pour l'erreur d'angle dans la boucle PID. L'erreur absolue et donc l'I-term ne depasseront jamais ces limites.",
    ["error_limit_2"] = "Limite stricte pour l'erreur d'angle dans la boucle PID. L'erreur absolue et donc l'I-term ne depasseront jamais ces limites.",
    ["iterm_relax_cutoff_2"] = "Aide a reduire le rebond apres des mouvements rapides du manche. Peut causer une incoherence dans les petits mouvements du manche si trop bas.",
    ["error_rotation"] = "Fait pivoter les termes d'erreur actuels de roulis et de tangage autour du lacet lorsque l'appareil tourne. Cela est parfois appele compensation de piro.",
    ["dterm_cutoff_1"] = "Frequence de coupure du D-term en Hz.",
    ["pitch_collective_ff_gain"] = "Augmenter pour compenser le mouvement de tangage vers le haut cause par la trainee de la queue lors de la montee.",
    ["yaw_inertia_precomp_gain"] = "Gain scalaire. La force de l'inertie du rotor principal. Une valeur plus elevee signifie qu'une plus grande precompensation est appliquee au controle du lacet.",
    ["yaw_ccw_stop_gain"] = "Gain d'arret (PD) pour la rotation dans le sens antihoraire.",
    ["error_limit_1"] = "Limite stricte pour l'erreur d'angle dans la boucle PID. L'erreur absolue et donc l'I-term ne depasseront jamais ces limites.",
    ["trainer_angle_limit"] = "Limite l'angle maximal auquel l'helicoptere s'inclinera en mode Acro Trainer.",
    ["yaw_precomp_cutoff"] = "Limite de frequence pour toutes les actions de precompensation du lacet.",
    ["offset_limit_1"] = "Limite stricte pour l'angle de decalage de l'integrale a grande vitesse dans la boucle PID. Le O-term ne depassera jamais ces limites.",
    ["angle_level_limit"] = "Limite l'angle maximal auquel l'helicoptere s'inclinera en mode Angle.",
    ["bterm_cutoff_0"] = "Frequence de coupure du B-term en Hz.",
    ["trainer_gain"] = "Determine l'agressivite avec laquelle l'helicoptere s'incline pour revenir a l'angle maximal (si depasse) en mode Acro Trainer.",
    ["error_decay_time_ground"] = "Reduit l'erreur actuelle du controleur lorsque l'appareil n'est pas en vol pour eviter que l'appareil ne bascule.",
    ["gyro_cutoff_1"] = "Bande passante globale de la boucle PID en Hz.",
    ["yaw_cw_stop_gain"] = "Gain d'arret (PD) pour la rotation dans le sens horaire.",
    ["iterm_relax_cutoff_0"] = "Aide a reduire le rebond apres des mouvements rapides du manche. Peut causer une incoherence dans les petits mouvements du manche si trop bas.",
    ["gyro_cutoff_2"] = "Bande passante globale de la boucle PID en Hz.",
    ["yaw_collective_dynamic_gain"] = "Un boost supplementaire de precompensation du lacet sur l'entree collective.",
    ["angle_level_strength"] = "Determine l'agressivite avec laquelle l'helicoptere s'incline pour revenir a l'horizontale en mode Angle.",
    ["dterm_cutoff_0"] = "Frequence de coupure du D-term en Hz.",
    ["tbl_rpy"] = "RPL",
    ["yaw_collective_ff_gain"] = "Feedforward collectif melange dans le lacet (precomp collectif-a-lacet).",
    ["horizon_level_strength"] = "Determine l'agressivite avec laquelle l'helicoptere s'incline pour revenir a l'horizontale en mode Horizon.",
    ["cyclic_cross_coupling_gain"] = "Quantite de compensation appliquee pour le decouplage tangage-roulis.",
    ["bterm_cutoff_1"] = "Frequence de coupure du B-term en Hz.",
  },
  ["ESC_PARAMETERS_YGE"] = {
    ["tbl_reverse"] = "Inverse",
    ["tbl_on"] = "Active",
    ["tbl_modestore"] = "Gouverneur Heli (maintient)",
    ["tbl_alwayson"] = "Toujours Allume",
    ["tbl_modeglider"] = "Planeur Aero",
    ["tbl_medium"] = "Moyen",
    ["tbl_unused"] = "*Inutilise*",
    ["tbl_modeext"] = "Gouverneur Ext Heli",
    ["tbl_modefree"] = "Libre (Attention!)",
    ["tbl_fast"] = "Rapide",
    ["tbl_custom"] = "Personnalise (Defini par PC)",
    ["tbl_autoefficient"] = "Auto Efficace",
    ["tbl_slow"] = "Lent",
    ["tbl_modeheli"] = "Gouverneur Heli",
    ["tbl_cutoff"] = "Coupure",
    ["tbl_off"] = "Desactive",
    ["tbl_slowdown"] = "Ralentir",
    ["tbl_modef3a"] = "Aero F3A",
    ["tbl_autonorm"] = "Auto Normal",
    ["tbl_autoextreme"] = "Auto Extreme",
    ["tbl_auto"] = "Auto",
    ["tbl_autopower"] = "Auto Puissance",
    ["tbl_modeair"] = "Moteur Aero",
    ["tbl_smooth"] = "Doux",
    ["tbl_normal"] = "Normal",
  },
  ["GOVERNOR_CONFIG"] = {
    ["gov_spoolup_min_throttle"] = "Gaz minimum a utiliser pour une montee progressive, en pourcentage. Pour les moteurs electriques, la valeur par defaut est 5%, pour le nitro, elle doit etre reglee pour que l'embrayage commence a s'engager en douceur 10-15%.",
    ["gov_spoolup_time"] = "Temps constant pour l'augmentation progressive, en secondes, mesurant le temps de zero a pleine vitesse de rotation.",
    ["gov_recovery_time"] = "Temps constant pour la recuperation progressive, en secondes, mesurant le temps de zero a pleine vitesse de rotation.",
    ["tbl_govmode_off"] = "DESACTIVER",
    ["gov_startup_time"] = "Temps constant pour le demarrage lent, en secondes, mesurant le temps de zero a pleine vitesse de rotation.",
    ["gov_tracking_time"] = "Temps constant pour les changements de vitesse de rotation, en secondes, mesurant le temps de zero a pleine vitesse de rotation.",
    ["tbl_govmode_standard"] = "STANDARD",
    ["tbl_govmode_mode1"] = "MODE1",
    ["tbl_govmode_mode2"] = "MODE2",
    ["tbl_govmode_passthrough"] = "EN DIRECT",
    ["gov_handover_throttle"] = "Le gouverneur s'active au-dessus de ce %. En dessous, la commande des gaz est transmise directement a l'ESC.",
  },
  ["RC_TUNING"] = {
    ["setpoint_boost_cutoff_4"] = "Seuil de boost pour le point de consigne.",
    ["setpoint_boost_gain_3"] = "Gain de boost pour le point de consigne.",
    ["accel_limit_3"] = "Acceleration maximale de l'appareil en reponse a un mouvement du manche.",
    ["response_time_3"] = "Augmenter ou diminuer le temps de reponse du taux pour lisser les mouvements de l'helico.",
    ["response_time_1"] = "Augmenter ou diminuer le temps de reponse du taux pour lisser les mouvements de l'helico.",
    ["accel_limit_4"] = "Acceleration maximale de l'appareil en reponse a un mouvement du manche.",
    ["yaw_dynamic_ceiling_gain"] = "Le gain maximal applique au plafond dynamique du yaw.",
    ["response_time_2"] = "Augmenter ou diminuer le temps de reponse du taux pour lisser les mouvements de l'helico.",
    ["setpoint_boost_cutoff_1"] = "Seuil de boost pour le point de consigne.",
    ["accel_limit_2"] = "Acceleration maximale de l'appareil en reponse a un mouvement du manche.",
    ["setpoint_boost_cutoff_2"] = "Seuil de boost pour le point de consigne.",
    ["setpoint_boost_gain_1"] = "Gain de boost pour le point de consigne.",
    ["response_time_4"] = "Augmenter ou diminuer le temps de reponse du taux pour lisser les mouvements de l'helico.",
    ["accel_limit_1"] = "Acceleration maximale de l'appareil en reponse a un mouvement du manche.",
    ["setpoint_boost_gain_4"] = "Gain de boost pour le point de consigne.",
    ["yaw_dynamic_deadband_filter"] = "Le filtre maximal applique a la zone morte dynamique du yaw.",
    ["setpoint_boost_cutoff_3"] = "Seuil de boost pour le point de consigne.",
    ["setpoint_boost_gain_2"] = "Gain de boost pour le point de consigne.",
    ["yaw_dynamic_deadband_gain"] = "Le gain maximal applique a la zone morte dynamique du yaw.",
  },
  ["ESC_PARAMETERS_XDFLY"] = {
    ["tbl_pink"] = "Rose",
    ["tbl_white"] = "Blanc",
    ["tbl_on"] = "Active",
    ["tbl_purple"] = "Violet",
    ["tbl_jadegreen"] = "Vert Jade",
    ["tbl_cyan"] = "Cyan",
    ["tbl_medium"] = "Moyen",
    ["tbl_fwgov"] = "Gouverneur Aile Fixe",
    ["tbl_reverse"] = "Inverse",
    ["tbl_green"] = "Vert",
    ["tbl_yellow"] = "Jaune",
    ["tbl_auto"] = "Auto",
    ["tbl_fast"] = "Rapide",
    ["tbl_off"] = "Desactive",
    ["tbl_extgov"] = "Gouverneur Externe",
    ["tbl_slow"] = "Lent",
    ["tbl_escgov"] = "Gouverneur ESC",
    ["tbl_blue"] = "Bleu",
    ["tbl_vslow"] = "Tres Lent",
    ["tbl_ccw"] = " Sens AntiHoraire",
    ["tbl_high"] = "Haut",
    ["tbl_cw"] = "Sens Horaire",
    ["tbl_orange"] = "Orange",
    ["tbl_low"] = "Bas",
    ["tbl_fmfw"] = "Aile Fixe",
    ["tbl_red"] = "Rouge",
    ["tbl_fmheli"] = "Helicoptere",
    ["tbl_normal"] = "Normal",
  },
  ["ACC_TRIM"] = {
    ["roll"] = "Utiliser pour ajuster si l'helico derive dans l'un des modes stabilises (angle, horizon, etc.).",
    ["pitch"] = "Utiliser pour ajuster si l'helico derive dans l'un des modes stabilises (angle, horizon, etc.).",
  },
  ["BATTERY_CONFIG"] = {
    ["vbatwarningcellvoltage"] = "Tension par cellule a laquelle l'alarme de basse tension commencera a sonner.",
    ["vbatmincellvoltage"] = "Tension minimale par cellule avant le declenchement de l'alarme de basse tension.",
    ["vbatmaxcellvoltage"] = "Tension maximale par cellule avant le declenchement de l'alarme de haute tension.",
    ["batteryCellCount"] = "Nombre de cellules dans votre batterie.",
    ["vbatfullcellvoltage"] = "Tension nominale d'une cellule completement chargee.",
    ["batteryCapacity"] = "Capacite de votre batterie en milliamperes-heure.",
  },
  ["ESC_PARAMETERS_FLYROTOR"] = {
    ["timing_angle"] = "Angle de synchronisation pour le moteur",
    ["tbl_automatic"] = "Automatique",
    ["tbl_cw"] = "Sens Horaire",
    ["tbl_alwayson"] = "Toujours Allume",
    ["buzzer_volume"] = "Volume du buzzer",
    ["low_voltage_protection"] = "Tension a laquelle nous reduisons la puissance de 50%",
    ["starting_torque"] = "Couple de demarrage pour le moteur",
    ["throttle_min"] = "Valeur minimale des gaz",
    ["tbl_enabled"] = "Active",
    ["soft_start"] = "Valeur de demarrage progressif",
    ["current_gain"] = "Valeur de gain pour le capteur de courant",
    ["gov_p"] = "Valeur proportionnelle pour le regulateur",
    ["tbl_disabled"] = "Desactive",
    ["gov_i"] = "Valeur integrale pour le regulateur",
    ["temperature_protection"] = "Temperature a laquelle nous reduisons la puissance de 50%",
    ["tbl_ccw"] = "Sens AntiHoraire",
    ["gov_d"] = "Valeur derivee pour le regulateur",
    ["response_speed"] = "Vitesse de reponse pour le moteur",
    ["motor_erpm_max"] = "RPM maximum",
    ["tbl_escgov"] = "Regulateur ESC",
    ["throttle_max"] = "Valeur maximale des gaz",
    ["cell_count"] = "Nombre de cellules dans la batterie",
    ["tbl_extgov"] = "Regulateur Externe",
  },
  ["ESC_PARAMETERS_SCORPION"] = {
    ["tbl_helistore"] = "Gouverneur Heli (maintient)",
    ["tbl_off"] = "Desactive",
    ["tbl_exbus"] = "Jeti Exbus",
    ["tbl_futsbus"] = "Futaba SBUS",
    ["tbl_vbar"] = "VBar",
    ["tbl_ccw"] = "Sens AntiHoraire",
    ["tbl_unsolicited"] = "Non Sollicite",
    ["tbl_vbargov"] = "Gouverneur VBar",
    ["tbl_airplane"] = "Mode Avion",
    ["tbl_on"] = "Active",
    ["tbl_cw"] = "Sens Horaire",
    ["tbl_quad"] = "Mode Quad",
    ["tbl_standard"] = "Standard",
    ["tbl_boat"] = "Mode Bateau",
    ["tbl_heligov"] = "Gouverneur Heli",
    ["tbl_extgov"] = "Gouverneur Externe",
  },
  ["RC_CONFIG"] = {
    ["rc_arm_throttle"] = "Les gaz doivent etre a ou en dessous de cette valeur en microsecondes (us) pour permettre l'armement. Doit etre au moins 10us inferieur au gaz minimum.",
    ["rc_center"] = "Centre du manche en microsecondes (us).",
    ["rc_max_throttle"] = "Gaz maximum (100% de sortie des gaz) attendu de la radio, en microsecondes (us).",
    ["rc_yaw_deadband"] = "Zone morte pour le controle du lacet en microsecondes (us).",
    ["rc_deflection"] = "Deviation du manche par rapport au centre en microsecondes (us).",
    ["rc_deadband"] = "Zone morte pour le controle cyclique en microsecondes (us).",
    ["rc_min_throttle"] = "Gaz minimum (0% de sortie des gaz) attendu de la radio, en microsecondes (us).",
  },
  ["MOTOR_CONFIG"] = {
    ["motor_pole_count_0"] = "Le nombre d'aimants sur la cloche du moteur.",
    ["motor_pwm_protocol"] = "Le protocole utilise pour communiquer avec l'ESC",
    ["main_rotor_gear_ratio_0"] = "Nombre de dents du pignon moteur",
    ["main_rotor_gear_ratio_1"] = "Nombre de dents de la roue principale",
    ["maxthrottle"] = "Cette valeur PWM est envoyee a l'ESC/Servo a plein regime",
    ["motor_pwm_rate"] = "La frequence a laquelle l'ESC envoie des signaux PWM au moteur",
    ["tail_rotor_gear_ratio_1"] = "Nombre de dents de la roue d'autorotation",
    ["mincommand"] = "Cette valeur PWM est envoyee lorsque le moteur est arrete",
    ["tail_rotor_gear_ratio_0"] = "Nombre de dents de la roue de queue",
    ["minthrottle"] = "Cette valeur PWM est envoyee a l'ESC/Servo a bas regime",
  },
  ["ESC_SENSOR_CONFIG"] = {
    ["voltage_correction"] = "Ajuster la correction de tension",
    ["tbl_off"] = "Desactive",
    ["tbl_on"] = "Active",
    ["current_correction"] = "Ajuster la correction de courant",
    ["hw4_current_offset"] = "Ajustement de l'offset de courant Hobbywing v4",
    ["hw4_voltage_gain"] = "Ajustement du gain de tension Hobbywing v4",
    ["current_offset"] = "Ajustement de l'offset du capteur de courant",
    ["update_hz"] = "Taux de mise a jour de la telemetrie ESC",
    ["consumption_correction"] = "Ajuster la correction de consommation",
    ["hw4_current_gain"] = "Ajustement du gain de courant Hobbywing v4",
    ["half_duplex"] = "Mode half-duplex pour la telemetrie ESC",
    ["pin_swap"] = "Inverser les broches TX et RX pour la telemetrie ESC",
  },
  ["RESCUE_PROFILE"] = {
    ["rescue_climb_collective"] = "Valeur collective pour la montee de sauvetage.",
    ["tbl_off"] = "DESACTIVER",
    ["tbl_on"] = "ACTIVER",
    ["rescue_level_gain"] = "Determiner l'agressivite avec laquelle l'helico se met a niveau pendant le sauvetage.",
    ["rescue_climb_time"] = "Duree pendant laquelle le collectif de montee est applique avant de passer au vol stationnaire.",
    ["rescue_flip_gain"] = "Determiner l'agressivite avec laquelle l'helico se retourne pendant le sauvetage inverse.",
    ["rescue_max_setpoint_accel"] = "Limiter la vitesse a laquelle l'helicoptere accelere dans un roulis/tangage. Les helicos plus grands peuvent necessiter une acceleration plus lente.",
    ["rescue_flip_time"] = "Si l'helicoptere est en sauvetage et essaie de se retourner a l'endroit et ne le fait pas dans ce delai, le sauvetage sera annule.",
    ["rescue_pull_up_time"] = "Lorsque le sauvetage est active, l'helicoptere appliquera un collectif de redressement pendant cette periode avant de passer a l'etape de retournement ou de montee.",
    ["rescue_max_setpoint_rate"] = "Limiter le taux de roulis/tangage de sauvetage. Les helicos plus grands peuvent necessiter des taux de rotation plus lents.",
    ["rescue_pull_up_collective"] = "Valeur collective pour la montee de redressement.",
    ["rescue_hover_collective"] = "Valeur collective pour le vol stationnaire.",
    ["tbl_flip"] = "RENVERSEMENT",
    ["rescue_exit_time"] = "Cela limite l'application rapide du collectif negatif si l'helicoptere a roule pendant le sauvetage.",
    ["tbl_noflip"] = "PAS DE RENVERSEMENT",
    ["rescue_flip_mode"] = "Si le sauvetage est active en etant inverse, retourner a l'endroit - ou rester inverse.",
  },
  ["FILTER_CONFIG"] = {
    ["tbl_none"] = "AUCUN",
    ["gyro_lpf2_static_hz"] = "Frequence de coupure du filtre passe-bas en Hz.",
    ["tbl_medium"] = "MOYEN",
    ["gyro_lpf1_static_hz"] = "Frequence de coupure du filtre passe-bas en Hz.",
    ["gyro_lpf1_dyn_max_hz"] = "Filtre dynamique - frequence de coupure maximale en Hz.",
    ["tbl_2nd"] = "2EME",
    ["dyn_notch_max_hz"] = "Frequence maximale a laquelle le notch est applique.",
    ["gyro_soft_notch_cutoff_1"] = "Largeur du filtre notch en Hz.",
    ["rpm_min_hz"] = "Frequence minimale pour le filtre des tours moteurs.",
    ["tbl_1st"] = "1ER",
    ["dyn_notch_q"] = "Facteur de qualite du filtre notch.",
    ["tbl_low"] = "BAS",
    ["tbl_high"] = "HAUT",
    ["tbl_custom"] = "PERSONNALISE",
    ["gyro_lpf1_dyn_min_hz"] = "Filtre dynamique - frequence de coupure minimale en Hz.",
    ["gyro_soft_notch_hz_2"] = "Frequence centrale a laquelle le notch est applique.",
    ["dyn_notch_min_hz"] = "Frequence minimale a laquelle le notch est applique.",
    ["dyn_notch_count"] = "Nombre de filtres notch a appliquer.",
    ["gyro_soft_notch_cutoff_2"] = "Largeur du filtre notch en Hz.",
    ["gyro_soft_notch_hz_1"] = "Frequence centrale a laquelle le notch est applique.",
  },
  ["ESC_PARAMETERS_HW5"] = {
    ["tbl_heliext"] = "Gouverneur Externe Heli",
    ["tbl_reverse"] = "Inverse",
    ["tbl_disabled"] = "Desactive",
    ["tbl_proportional"] = "Proportionnel",
    ["tbl_ccw"] = "Sens AntiHoraire",
    ["tbl_autocalculate"] = "Calcul Auto",
    ["tbl_fixedwing"] = "Aile Fixe",
    ["tbl_hardcutoff"] = "Coupure Dure",
    ["tbl_softcutoff"] = "Coupure Douce",
    ["tbl_helistore"] = "Gouverneur Heli (maintient)",
    ["tbl_cw"] = "Sens Horaire",
    ["tbl_enabled"] = "Active",
    ["tbl_heligov"] = "Gouverneur Heli",
    ["tbl_normal"] = "Normal",
  },
}