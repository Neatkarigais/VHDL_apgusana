# VHDL apgūšana
Repozitārijs VHDL apgūšanai ar komandām un pašiem kodiem

## Kas ir VHDL?

VHDL ir valoda, ko izmanto dažādu digitālo signālu sintezēšanai uz FPGA bāzes. Tā nav programmējamā valoda, bet gan vienkārši rīks, ar kā palīdzību var veidot shēmas. Kā arī VHDL tiek izmantots ASIC izveidei.

## Kā izveidot jaunu Quartus failu?

1. No sākuma tiek izveidots jauns projekts, kuram tiek izvēlēta lokācija un nosaukums, faila nosaukums sakrīt ar _main_ faila nosaukumu.
2. Tad ir iespēja izvēlēties failus projekta pievienošanai, taču tas ir opcionāli.
3. Pēc tam vajag izvēlēties konkrēto FPGA pēc nosaukums. Šajā gadījumā tas ir **SCSXFC6D6F31C6**.
4. Pie _EDA Tools settings_ var izvēlēties opcijas signāla vizualizācijai, ja process netiek veikts uz FPGA.
5. Beigās ir pieejams apkopojums ar visu informāciju.

Kad projekts ir izveidots, tad nepieciešams pievienot/izveidot jaunus VHDL failus. To var izdarīt, pievienojot failus caur _Project->Add/remove the files in project_ vai izveidojot jaunu failu caur _New->VHDL file_.

## Kādi ir VHDL atslēgas vārdi?

1. Komentēšanu var iespējot ar _--_;
2. Bibliotēkas var iespējot ar vārdu _library_;
3. Pakotnes izmantošanai no bibliotēkas var iespējot ar vārdu _use_;
4. _Entity_ ļauj definēt ieejas/izejas portus; _Architecture_ ir tur, kur viss dizains aiziet;
5. _Generic_ ir vispārējā jeb _general_ daļa visā dizainā;
6. _Port_ definē izejas/ieejas;
7. _Downto_ definē apgabalu;
8. _begin_ un _end_ sāk un beidz konkrēto procesu;
9. _map_ ļauj mappot ieejas/izejas portus dizainā;
10. _<=_ ir tas pats, kas _=_.

## Kādas ir VHDL bibliotēkas?

1. **std_logic_1164.vhdl** - ļauj izmantot loģiskās operācijas, ļauj definēt loģiskos mainīgos, kā arī ļauj izmantot funkciju _rising edge_ un _falling edge_;
2. **math_real.vhdl** - ļauj izmantot matemātiskās operācijas un konstantes, kā arī _int_ un _real_ datu tipus;
3. **numeric_std.vhdl** - ļauj izmantot "lielāks vai vienāds", "mazāks vai vienāds", utt. Datu tipi ir _unsigned_ vai _signed_.

## VHDL entity un arhitektūras uzbūve

_Entity_ izmanto ieejas un izejas signālu definēšanai, bet pašā _architecture_ tiek veidota visa shēma, kurā izmanto definētos ieejas un izejas portus.

![image](https://github.com/Neatkarigais/VHDL_apgusana/assets/136509322/4fd93a6f-a5e1-4a92-94bb-7ab27e11e8ce)

## VHDL _generic_ izmantošana

Ļauj vispārināt shēmai ieejas vai izejas signālu.

![image](https://github.com/Neatkarigais/VHDL_apgusana/assets/136509322/fe16e451-45d7-4660-a502-1cd3757c2661)

## VHDL datu tipi

1. **std_logic** - reprezentē vienu bitu. Tam var tikt piešķirti sekojoši lielumi: 'X' ir nezināms, '0' ir loģiskā 0, '1' ir loģiskais '1' un 'Z' ir liela impedance (tri-stāvokļu buferis);
2. **std_logic_vector** - tas pats, kas _std_logic_, bet tas ir vesela kopne;

![image](https://github.com/Neatkarigais/VHDL_apgusana/assets/136509322/6cbcd2ec-0dd2-42aa-b25b-a9930e9297df)

Attēlā ir redzami sekojoši procesi: sig_A ir vienāds ar 0, sig_B ir vienāds ar 1, sig_A tiek nomainīta sekojoši no 1 uz 0 un uz sig_B vērtību. sig_C ir vienāds ar 000000, sig_D visi biti tiek pārveidoti uz 111111, sig_C tiek nomainītas vertības uz 111111, pēc kā sig_C 3.loceklis kļūst vienāds ar sig_D 1.locekli.

3. **unsigned** - reprezentē pozitīvus skaitļus tikai. Var izmantot saskaitīšanas, atņemšanas un salīdzināšanas operācijās;
4. **signed** - reprezentē gan pozitīvos, gan negatīvos skaitļus, izmantojot 'Two bit's complement'. Var izmantot saskaitīšanas, atņemšanas un salīdzināšanas operācijās;

![image](https://github.com/Neatkarigais/VHDL_apgusana/assets/136509322/d11f22c8-b58b-4846-b6bf-20efaa5b9726)

Attēlā ir redzami sekojoši procesi: sig_E tiek piešķirta vērtība 0, sig_F tiek piešķirta vērtība 0010, kas ir decimālais 2, sig_E paliek vērtība 0, sig_E tiek pieskaitīts decimālais 1, sig_G ir vienāds ar 0, sig_H tiek piešķirta vērtība 1011, kas ir decimālais -5 pēc _Two complement_ operācijas veikšanas, sig_G kļūst par 0, sig_H ir sig_G mīnuss decimālais 1.

5. **integer** - 32 bitu veselais skaitlis, kuru nav jāliek pēdiņās. Var izmantot saskaitīšanas, atņemšanas un salīdzināšanas operācijās.

![image](https://github.com/Neatkarigais/VHDL_apgusana/assets/136509322/a8382f66-4ffe-49e1-8651-08593b3dff66)

Attēlā ir redzami sekojoši procesi: sig_I ir 8 bitu veselais skaitlis (jo range ir 0 līdz 255), kuram vērtība ir 0, sig_J ir tas pats 8 bitu skaitlis, bet ar vērtību 5, sig_I ir vienāds ar 4, sig_I ir vienāds sig_J plus 5.

