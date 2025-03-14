--[[
 * Copyright (C) Rotorflight Project
 *
 * License GPLv3: https://www.gnu.org/licenses/gpl-3.0.en.html
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * Note. Some icons have been sourced from https://www.flaticon.com/
]] --

local fr = {
    title_voltage = "TENSION",
    title_fuel = "CARBURANT",
    title_mah = "MAH",
    title_rpm = "TR/MIN",
    title_current = "COURANT",
    title_tempMCU = "T.PROC.",
    title_tempESC = "T.ESC",
    title_time = "MINUTERIE",
    title_governor = "GOUVERNEUR",
    title_fm = "MODE DE VOL",
    title_rssi = "SIGNAL FAIBLE",

    warn_missing_sensors = "CAPTEURS REQUIS MANQUANTS",

    txt_triggers = "Declencheurs",
    txt_idleupswitch = "Interrupteur Idle Up",
    txt_delaybeforeactive = "Delai avant activation",
    txt_timerconfiguration  = "Configuration de la minuterie",
    txt_playalarmat = "Jouer l'alarme a",
    txt_battery_configuration = "Configuration de la batterie",
    txt_cells = "Cellules",
    txt_max_cell_voltage    = "Tension maximale de la cellule",
    txt_min_cell_voltage    = "Tension minimale de la cellule",
    txt_warn_cell_voltage   = "Tension d'avertissement de la cellule",
    txt_low_fuel_percentage = "Pourcentage de carburant faible",
    txt_play_alerton = "Jouer l'alerte sur",
    txt_low_voltage = "Tension faible",
    txt_low_fuel = "Carburant faible",
    txt_low_fuel_voltage = "Carburant faible & Tension faible",
    txt_disabled = "Desactive",
    txt_interval = "Intervalle",
    txt_vibrate = "Vibrer",
    txt_switch_announcements    = "Annonces de commutation",
    txt_idlespeedlow = "Vitesse de ralenti basse",
    txt_idlespeedmedium = "Vitesse de ralenti moyenne",
    txt_idlespeedhigh = "Vitesse de ralenti elevee",
    txt_rateslow = "Taux bas",
    txt_ratesmedium = "Taux moyen",
    txt_rateshigh = "Taux eleve",
    txt_rescueoff = "Sauvetage desactive",
    txt_rescueon = "Sauvetage active",
    txt_bblon = "Logs active",
    txt_bbloff = "Logs desactive",
    txt_telemetry_announcements = "Annonces de telemetrie",
    txt_voltage = "Tension",
    txt_rpm = "TR/MIN",
    txt_current = "Courant",
    txt_fuel = "Carburant",
    txt_lq = "Signal Faible",
    txt_esc_temperature = "Temperature ESC",
    txt_mcu_temperature = "Temperature Micro Processeur",
    txt_timer = "Minuterie",
    txt_governor_announcements = "Annonces du gouverneur",
    txt_customise_display    = "Personnaliser l'affichage",
    txt_box1 = "Boite 1",
    txt_box2 = "Boite 2",
    txt_box3 = "Boite 3",
    txt_box4 = "Boite 4",
    txt_box5 = "Boite 5",
    txt_box6 = "Boite 6",
    txt_display_title = "Titre de l'affichage",
    txt_display_maxmin = "Afficher Max/Min",
    txt_usecolours = "Utiliser des couleurs pour indiquer le statut",
    txt_customsensors = "Capteurs personnalises",
    txt_customsensor_1 = "Capteur personnalise #1",
    txt_customsensor_2 = "Capteur personnalise #2",
    txt_advanced = "Avance",
    txt_governor    = "Gouverneur",
    txt_tempconversion = "Conversion de temperature",
    txt_esc = "ESC",
    txt_disable = "Desactiver",
    txt_mcu = "Processeur",
    txt_sensitivity = "Sensibilite",
    txt_hight = "Eleve",
    txt_low = "Bas",
    txt_medium = "Moyen",
    txt_rfgovernor = "Gouverneur Rotorflight",
    txt_extgovernor = "Gouverneur externe",
    txt_sagcompensation = "Compensation de l'affaissement",
    txt_gimbalmonitoring = "Surveillance des sticks",
    txt_stickcutoff = "Coupure du manche",
    txt_alertonrpmdiff = "Alerte sur difference de TR/MIN",
    txt_alertifdifflt = "Alerte si la difference est < que",
    txt_announcement_interval = "Intervalle d'annonce",
    txt_calcfuel_local  = "Calculer le carburant localement",
    txt_warnsensors = "Avertir si capteurs manquants",
    txt_na = "N/A",
    txt_norepeat = "Pas de repetition",
    txt_please_enable_bgtask    = "Veuillez activer la tache de fond",
    txt_unknown = "INCONNU",
    txt_displaysize_invalid = "TAILLE D'AFFICHAGE INVALIDE",
    txt_initialising    = "INITIALISATION",
    txt_max = "max",
    txt_min = "min",

    layoutOptions = {
            TIMER = "MINUTERIE",
            VOLTAGE = "TENSION",
            FUEL = "CARBURANT",
            CURRENT = "COURANT",
            MAH = "MAH",
            RPM = "TR/MIN",
            LQ = "SIGNALFAIBLE",
            TESC = "T.ESC",
            TMCU = "T.PROC.",
            IMAGE = "IMAGE",
            GOVERNOR = "GOUVERNEUR",
            IMAGE_GOVERNOR = "IMAGE, GOUVERNEUR",
            LQ_TIMER = "SIGNALFAIBLE, MINUTERIE",
            TESC_TMCU = "T.ESC, T.PROC.",
            VOLTAGE_FUEL = "TENSION, CARBURANT",
            VOLTAGE_CURRENT = "TENSION, COURANT",
            VOLTAGE_MAH = "TENSION, MAH",
            LQ_TIMER_TESC_TMCU = "SIGNALFAIBLE, MINUTERIE, T.ESC, T.PROC",
            MAX_CURRENT = "COURANT MAX",
            LQ_GOVERNOR = "SIGNALFAIBLE, GOUVERNEUR",
            CRAFT_NAME = "NOM DE L'APPAREIL",
            CUSTOMSENSOR_1 = "CAPTEUR PERSONNALISE #1",
            CUSTOMSENSOR_2 = "CAPTEUR PERSONNALISE #2",
            CUSTOMSENSOR_1_2 = "CAPTEUR PERSONNALISE #1, #2",
    },
}

return fr