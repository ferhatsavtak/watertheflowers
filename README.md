# Toprak Nem Sensörü ile Akıllı Sulama
Toprak nem sensörü ile topraktan aldığımız bilgiyi mikrodenetleyicimize aktarıp lcd ekranımıza yazdıracağımız bir kart tasarlıyoruz. Bizim mikrodenetleyicimiz 12 bit ADC ye sahip olduğu için sensörden alacağımız analog değerler de 0-4095 arası değerler olcaktır. Bu değerlerle orantılı olarak topraktaki nem oranını %20 aralıklarla bize bildirip, lcd ekranına yazıp ve ayrıca 5 adet ledi nem oranına göre sırasıyla yakıp söndürecektir. Toprak susuz kaldığında kırmızı led yanacak ve matlab ekranıda çiçeğin suya ihtiyacı var diye uyarı yazısı çıkaracaktır. Ayrıca Matlab GUI tabanıyla sensörümüzden aldığımız anlık bilgiyi de bilgisayar ekranımıza yansıtacağız.
## Projede kullanılan malzemeler
1) Aduc842 ile hazırlanmış mikrodenetleyici
2) Toprak Nem Sensörü
3) 2x16 LCD ekran
4) 5 adet Led

## Toprak Nem Sensörü:
<img src="https://raw.githubusercontent.com/ferhatsavtak/watertheflowers/master/Pictures/1.jpg">
Toprak nem sensörü 3.3V ve 5V gerilimlerinde çalışabilirler. Sensörümüz analog ve dijital çıkışlara sahiptir.
Sensörün Çalışması: Şekilde de görüldüğü gibi sensörümüz iki kısımdan oluşuyor. Birinci kısım toprağa sapladığımız kısım ve iki iletken plakadan oluşur. Toprak nemini bu iki plaka arasındaki elektirik iletimine bağlı olarak anlıyoruz. İkinci kısım ise birinci kısımdan gelen verileri yorumlamamıza yardımcı olan kısımdır.

## 2x16 Lcd Ekran:
<img src="https://raw.githubusercontent.com/ferhatsavtak/watertheflowers/master/Pictures/2.jpg">

## Proteus Çizimi :
<img src="https://raw.githubusercontent.com/ferhatsavtak/watertheflowers/master/Pictures/3.jpg">

## Baskı Devre Şeması:
<img src="https://raw.githubusercontent.com/ferhatsavtak/watertheflowers/master/Pictures/4.jpg">

## Projenin Bitmiş Hali:
<img src="https://raw.githubusercontent.com/ferhatsavtak/watertheflowers/master/Pictures/5.jpg">

## Matlab Gui Program Görünüşü
<img src="https://raw.githubusercontent.com/ferhatsavtak/watertheflowers/master/Pictures/6.jpg">
<img src="https://raw.githubusercontent.com/ferhatsavtak/watertheflowers/master/Pictures/7.jpg">
<img src="https://raw.githubusercontent.com/ferhatsavtak/watertheflowers/master/Pictures/8.jpg">
