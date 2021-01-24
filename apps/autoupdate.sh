#!/bin/bash
tempo1=$seconds
cd
echo "                   'o:::::::::::::::::::::lc                                   "
echo "                   lc                     .O                                   "
echo "                   lc   ;cccl'   'll;:ll' .O                                   "
echo "                   lc  dMMMMMk   oMMOXMMl .O                                   "
echo "      cXMNd        lc  dMMMMMx   cKKdOKKc .O :d:::::::oo                       "
echo "      OMMMN.       lc   dXKXK:   cXXx0XXc .O o:       'k  .,,,.                "
echo "       ;l:.        lc                     .O o:       'k .0...0.               "
echo "  ,OOOOOOOkxo;.    cx,,,,,,,,,,,,,,,,,,,,,ck o: .''.  'k .O . O.               "
echo "  cMMxccccldKMWd    .........x;''x.........  o:       'k .O   O.               "
echo "  cMM,       ;XMO      od.  ;xxddxl          ,o:::::::lc  l:::c                "
echo "  cMM, :d:    :MM;    lx.                                                      "
echo "  cMM, kMk    'MMc .xOxxOk' .K0kxxOx.  lOkxk0k. 'XOkxOKd  ;XkkxOKd  .oOkxkO:   "
echo "  cMM, kMk    :MM;.WK'...0W..WN'   0N..l; ..dMl ,M0   oMc :Mx   kM: 0W:...dMl  "
echo "  cMM, kMk   'XMO ;MKdddddd..W0    xM'.kKOkdkMl ,Mx   cMl :Mc   dMc.NNdddddd:  "
echo "  cMM, kMKco0MWx  .KX,  .OO..WWl  ;NO xMd  .kMo ,Mx   cMl :Mc   dMc dWl. .oK,  "
echo "  ;00. o000kd:.     cxOOkl. .WNdkOx:  .lkkkd:xl .k:   ,k, 'k,   :k,  ,dOOOd'   "
echo "                            .WX                                                "
echo "           .                 c:   .     ''                  .                  "
echo "       l  .,.;:',,';. .;;.;,.d:'  ;..,.:d;'' ,,';.:,. .;..d,:' ': '.'.:,       "
echo "       o..  dc:'kc:d:ckc:lc .o,   l,ko:ll.d:lx  Ocd;lcldd.d.'cocx:olld::       "
echo "       ...  .'..:cco..,:...  ..   .  . ., .. .  ' . ... . .  .'.:.. ..'        "
echo "            .lc;.                                                              "
echo ""
echo ""
echo ""
echo ""
echo "                              autoupdate.sh 4.3.1                              "
echo "                 © 2020-2021 iDépanne – L'expert informatique                  "
echo "                            https://fb.me/idepanne/                            "
echo ""
echo ""
echo ""
echo "-------------------------------------------------------------------------------"
echo "                         Test de la connexion Internet                         "
echo "-------------------------------------------------------------------------------"
echo ""
var=$(ping -c 3 raw.githubusercontent.com)
        echo "$var"
        echo ""
        echo ""
        if [[ "$var" =~ "0% packet loss" ]]; then
                echo "Connexion Internet: OK"
                echo ""
                echo ""
                echo "-------------------------------------------------------------------------------"
                echo "                     Mise à jour du module infos_system.sh                     "
                echo "-------------------------------------------------------------------------------"
                echo ""
                echo "wget -O - https://raw.githubusercontent.com/idepanne/pi-hole_hosts_project/master/apps/infos_system.sh > infos_system_new.sh"
                wget -O - https://raw.githubusercontent.com/idepanne/pi-hole_hosts_project/master/apps/infos_system.sh > infos_system_new.sh
                echo ""
                echo "sudo mv infos_system.sh infos_system_old.sh"
                sudo mv infos_system.sh infos_system_old.sh
                echo "sudo mv infos_system_new.sh infos_system.sh"
                sudo mv infos_system_new.sh infos_system.sh
                echo "sudo chmod +x infos_system.sh"
                sudo chmod +x infos_system.sh
                echo ""
                echo ""
                echo "-------------------------------------------------------------------------------"
                echo "                    Mise à jour du module autoupdate_conf.sh                   "
                echo "-------------------------------------------------------------------------------"
                echo ""
                echo "wget -O - https://raw.githubusercontent.com/idepanne/pi-hole_hosts_project/master/apps/autoupdate_conf.sh > autoupdate_conf_new.sh"
                wget -O - https://raw.githubusercontent.com/idepanne/pi-hole_hosts_project/master/apps/autoupdate_conf.sh > autoupdate_conf_new.sh
                echo ""
                echo "sudo mv autoupdate_conf.sh autoupdate_conf_old.sh"
                sudo mv autoupdate_conf.sh autoupdate_conf_old.sh
                echo "sudo mv autoupdate_conf_new.sh autoupdate_conf.sh"
                sudo mv autoupdate_conf_new.sh autoupdate_conf.sh
                echo "sudo chmod +x autoupdate_conf.sh"
                sudo chmod +x autoupdate_conf.sh
                echo ""
                # ./infos_system.sh
        else
                echo "Connexion Internet: Echec"
                echo ""
                echo ""
                echo "*** Abandon des mises à jour - Nouvelle tentative dans 24h ***"
                echo ""
                echo ""
                echo "-------------------------------------------------------------------------------"
                echo "                             Mise à jour du crontab                            "
                echo "-------------------------------------------------------------------------------"
                echo ""
                echo "Ancien crontab :"
                crontab -l
                echo ""
                crontab <<<"0 3 * * * /home/pi/autoupdate.sh > /home/pi/log/`date --date="+1day" +"%Y%m%d"`_autoupdate.log 2>&1"
                sudo /etc/init.d/cron restart
                echo ""
                echo "Nouveau crontab :"
                crontab -l
                echo ""
        fi
                tempo2=$seconds
                echo $tempo1 secondes
                echo $tempo2 secondes
                echo ""
                echo "Durée d'exécution du programme: $(($tempo1+$tempo2)) secondes"
