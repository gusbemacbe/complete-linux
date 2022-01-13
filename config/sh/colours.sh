#!/bin/bash

nc='\033[0m'
fg='\033[38;2'
bg='48;2'
i='\033[3'
m='m'
n='1'

# Derivado da página de Universo do site League of Legends
# https://universe.leagueoflegends.com/pt_BR/

cor01='250;247;241' # @ #faf7f1
cor02='211;199;170' # @ #d3c7aa
cor03='133;133;105' # @ #858569
cor04='124;108;72'  # @ #7c6c48
cor05='100;83;57'   # @ #645339
cor06='67;52;31'    # @ #43341f
cor07='52;43;32'    # @ #342b20
cor08='17;17;20'    # @ #111114
cor09='11;11;11'    # @ #0b0b0b
cor10='16;18;23'    # @ #101217
cor11='20;24;29'    # @ #14181d
cor12='205;190;145' # @ #cdbe91
cor13='156;126;68'  # @ #9c7e44
cor14='147;115;65'  # @ #937341
cor15='114;82;38'   # @ #725226
cor16='15;161;166'  # @ #0fa1a6
cor17='7;120;142'   # @ #07788e

italico()
{
  printf "${i}${m}$@${nc}\n";
}

piltover()
{
  printf "${fg};${cor02};${n}${m}$@${nc}\n";
}

piltover_2()
{
  printf "${fg};${cor13};${n}${m}$@${nc}\n";
}

piltover_3()
{
  printf "${fg};${cor01};${m}$@${nc}\n";
}

shurima()
{
  printf "${fg};${cor12};${bg};${cor15};${n}${m}$@${nc}\n";
}

zaun()
{
  printf "${fg};${cor16};${bg};${cor11};${n}${m}$@${nc}\n";
}

# chameleon -c 1 -f "'{0:d};{1:d};{2:d}' # rgb({0:d}, {1:d}, {2:d}) #{0:02x}{1:02x}{2:02x}"
# chameleon -c 2 -f "cor='{0:d};{1:d};{2:d}'    # rgb({0:d}, {1:d}, {2:d})     @ #{0:02x}{1:02x}{2:02x}"
# chameleon -c 2 -f "cor='{0:d};{1:d};{2:d}'    @ #{0:02x}{1:02x}{2:02x}"

# echo -en "$(piltover 'Vivo em Piltover.') E tu?\n"
# echo -en "$(shurima 'Vivo na Cidade de Shurima.') Tudo bem?\n"
# echo -en "$(zaun 'Ide foder-vos, pilto e shurimo!') Deixai-nos! $(italico 'Qapla‘')\n"

# echo -e "Advanced"
# echo -e "Terminal \e[110:2:1:2:1mTerminal\e[m"
# echo -e "Emulator \e[93;110:2m★★★★★★\e[110:1:2m★\e[110:2:2m☆\e[110:2m☆\e[m"


