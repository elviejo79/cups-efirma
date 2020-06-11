#! /bin/bash -x

make check
sudo make install
make inst_check
sudo lpadmin -p timbrado.digital -E -v efirma:/sample -D 'firma digital' -L 'www.timbrado.digital' -m efirma.ppd
sudo lpadmin -p timbrado.digital -E -omailx_MAILRC=Custom.mailrc.gmail
sudo cupsenable --release timbrado.digital
# lpr -P timbrado.digital /home/agarciafdz/demo.pdf -oMailSubject=my_subject -oSignator4=agarciafdz+Testigo2@gmail.com -oSignator3=agarciafdz+Testigo@gmail.com -oSignator1=agarciafdz+autor@gmail.com -oSignator2=agarciafdz@jag.ac
lpr -P timbrado.digital /home/agarciafdz/demo.pdf -oMailSubject=agarciafdz+subject@gmail.com -oMailFrom=agarciafdz@gmail.com -oMailTo=agarciafdz@jag.ac
lpstat -p timbrado.digital
sleep 5
lpstat -p timbrado.digital
