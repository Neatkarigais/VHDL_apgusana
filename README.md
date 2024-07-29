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

## When-else izteikumi

Piemērs: signal_name <= expression_1 when condition_1 else expression_2

signal_name <= expression_1 when condition_1 else
               expression_2 when condition_2 else
               condition_3;

## Concurrent vs Sequential izteikumi

Konkurentie iZteikumi ir, piemēram, signal assignment (process, case statement, etc.), kā arī process statement (var rearrangot procesu). Tiem procesu kārtībai nav nozīmes.

Sequential izteikumi ir: if(infer priority) un case(equal priority). Šiem jābūt procesos. Tie ir tie, kuros procesu izpilde ir nozīmīga.

# VHDL simulācija

## Shift reģistra dizains

![image](https://github.com/Neatkarigais/VHDL_apgusana/assets/136509322/e82175d1-b236-4beb-a1e4-a1dfb5780307)

Skatīt Shift_reg.vhd pilno kodu.

## Shift reģistra testbench kods

![image](https://github.com/Neatkarigais/VHDL_apgusana/assets/136509322/486f302c-77da-4f0b-83a2-1b2dfba06395)

Skatīt test_Shift_reg.vhd kodu.

## Shift reģistra TCL fails

Skatīt Shift_reg.tcl kodu.

## ModelSim palaišana

Jāpalaiž ModelSim. Jaizvēlas _File/Change directory..._ un jāizvēlas lokācija, kur ir VHDL un TESTBENCH faili. Pēc kā spiež _File/New/Library_ un uzklikšķina uz _a new library and a logical maping to it_. Kad tas ir izdarīts, nepieciešams kompilēt failu caur _Compile/Compile.._, kur vajag ieķeksēt abus failus. Ja ar abiem failiem viss ir labi, tad tālāk nepieciešams tos simulēt caur _Simulate/Start simulation.._. Tālāk jāpievieno signāli no faila caur _Add wave_, pēc kā var palaist _Run_.

## ModelSim palaišana caur TCL

Šim nolūkam nepieciešams ir jāizvēlas directory, kur visi faili ir, pēc kā jāspiež _Tools/Tcl/Execute Macro..._. Tādējādi viss process ir automatizēts.

# VHDL koda implementācija uz DE10 Standard

## LED un pogu programmas kods

![image](https://github.com/user-attachments/assets/fa2a0c00-a5a1-45b0-9e2d-e1ad8742cbe9)

## Pinu pievienošana

Lai pievienotu pinus, nepieciešams ieiet _Assignments/Pin planner_, kur var ieraudzīt kopējo Altera pinu izvietojumu karti. Lai pievienotu attiecīgos pinus, nepieciešams sekot līdzi DE10-Standard instrukcijai.

![image](https://github.com/user-attachments/assets/57f35fda-182f-46d1-85fb-983251d66fe4)

## Programmējamā faila izveide

Vispirms nepieciešams veikt kopējo kompilēšanu. Kad ir veiksmīgi noritējusi kompilācija, tiks izveidots .sof fails, kuru nepieciešams ielādēt iekš FPGA.

![image](https://github.com/user-attachments/assets/380e18d7-443b-4793-8da0-b95daec4cb57)

## Reāla FPGA ieprogrammēšana

![image](https://github.com/user-attachments/assets/c407498f-1f03-453a-89a6-56135fbb7e9b)

No sākuma nepieciešams atrast USB-Blaster iekārtas ieprogrammēšanai. Ja nav USB-Blaster, nepieciešams ielādēt. Tad nepieciešams Auto detectot procesoru, kuram piešķiram pirmo izvēlēto modeli. Tad šo pašu procesoru pārregulējam uz iepriekš ieprogrammēto .sof failu. Tad var uzspiest _Start_, pēc kā FPGA tiek ieprogrammēts.

# VHDL dizaina koncepti

## Signāli un konstantes

Konstante - konstants skaitlis, kas netiks mainīts procesa laikā. Signāls - iekšējais shēmas signāls.

![image](https://github.com/user-attachments/assets/b479c08b-6e6b-4813-a16e-f97db3421888)

## Process

Vienība, kas ļauj veicināt procesu ar kādu noteicošo argumentu.

![image](https://github.com/user-attachments/assets/514937f5-f0bb-4913-8eb5-5a9cbba0f0e0)

## IF apgalvojums

Process norisinās, ja izteiktais apgalvojums ir patiess. Ja nav, tad norisinās cits apgalvojums.

![image](https://github.com/user-attachments/assets/56123ca9-b40f-447d-9c38-2ed0c3b036c2)

## IF apgalvojumu prioritātes piešķiršana

Tas apgalvojums, kas atrodas hierarhijas augšā, tas tiek prioritizēts, tas ir, citi apgalvojumi nestrādās, ja augšējais būs spēkā esošs.

![image](https://github.com/user-attachments/assets/e219079c-3ed2-4844-accc-d360ddc19da3)

![image](https://github.com/user-attachments/assets/53574270-01a0-4eb5-9c07-5439263f9669)

# Blinky LED projekts
## Darbības apraksts

_Blinky LED_ projekta darbība ir sekojoša: divas lielās komponentes, kuras ir _counter_ un _LED_. Pie katra takts signāla kāpošās frontes tiek pieskaitīts 1, taču, ja _reset_ ir aktīvs vai _counter_ ir sasniedzis MAX_VALUE, tad _counter_ ir sasniedzis 0. Katru reizi, kad _counter_ ir sasniedzis MAX_VALUE, LED mainās uz pretējo stāvokli.
Projektā mirdzēšanas gaitu nosaka divas frekvences (takts signāla frekvence un mirdzēšanas frekvence). Parametri tiek rēķināti šādi:

MAX_VALUE = CLK_RATE/LED_RATE; - cik daudz takts signāla taktis vajag vienam stāvoklim;
BIT_DEPTH = ceil(log2c(real(MAX_VALUE)); - MAX_VALUE skaitītāja reģistra lielums;
count_reg : in std_logic_vector(BIT_DEPTH - 1) := (others => '0');

## Programmas kods

![image](https://github.com/user-attachments/assets/ea2dd802-76ad-4ef6-bb1f-3e005c66e9e3)

## Rezultāts

LED tiek mirdzēti ar 2 Hz frekvenci. Kad tiek turēta poga, process apstājās.






