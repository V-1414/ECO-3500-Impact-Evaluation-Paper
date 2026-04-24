capture log close
clear

cd "/Users/vidhi/college baby/sem 5/Dev/End term paper/Do"

log using Dev_Paper_Log.log, replace

use "ASER_Panel_Analysis_Ready.dta", clear 
//This is the final compiled and cleaned dataset that we have used


*****************************************************
******* SETUP SCRIPT - ALREADY RAN AND SAVED ********
*****************************************************

/*

*****************************************************
* Creating Dummies for different types of treatment *
*****************************************************

****************** Dummies for Phase I ******************
capture drop phase_i
gen phase_i = 0

foreach dist in  "Nicobars" "Ysr" "Dibang Valley" "Kamrup Metropolitan" "Vaishali" "Chandigarh" "Raigarh" "Dadra & Nagar Haveli" "Daman" "North Goa" "Surat" "Mahesana" "Gandhinagar" "Ahmadabad" "Rajkot" "Mahendragarh" "Jhajjar" "Rewari" "Sonipat" "Ambala" "Kurukshetra" "Rohtak" "Karnal" "Yamunanagar" "Kaithal" "Bhiwani" "Panipat" "Una" "Jammu" "Pulwama" "Kathua" "Budgam" "Anantnag" "Dhanbad" "Bijapur" "Thrissur" "Lakshadweep" "Morena" "Gwalior" "Bhind" "Datia" "Bid" "Jalgaon" "Ahmadnagar" "Buldana" "Aurangabad" "Washim" "Kolhapur" "Osmanabad" "Sangli" "Jalna" "Senapati" "Ribhoi" "Saiha" "Longleng" "South West" "North West" "East" "West" "North" "Nayagarh" "Yanam" "Tarn Taran" "Gurdaspur" "Amritsar" "Muktsar" "Mansa" "Patiala" "Sangrur" "Sahibzada Ajit Singh Nagar" "Fatehgarh Sahib" "Barnala" "Firozpur" "Jhunjhunun" "Sikar" "Karauli" "Ganganagar" "Dhaulpur" "Jaipur" "Dausa" "Alwar" "Bharatpur" "Sawai Madhopur" "North District" "Cuddalore" "Hyderabad" "South Tripura" "Baghpat" "Gautam Buddha Nagar" "Ghaziabad" "Meerut" "Bulandshahr" "Agra" "Muzaffarnagar" "Mahamaya Nagar" "Jhansi" "Mathura" "Pithoragarh" "Champawat" "Kolkata" {

    replace phase_i = 1 if district_name == "`dist'"
}


****************** Dummies for Phase II ******************
capture drop phase_ii
gen phase_ii = 0
    
foreach dist in "Anand" "Amreli" "Patan" "Bhavnagar" "Gurugram" "Jind" "Faridabad" "Hisar" "Fatehabad" "Sirsa" "Panchkula" "Palwal" "Kangra" "Hamirpur" "Samba" "Baramulla" "Ganderbal" "Rajouri" "Srinagar" "Shupiyan" "Kupwara" "Kulgam" "Udhampur" "Bandipore" "Rewa" "Tikamgarh" "Hingoli" "Solapur" "Pune" "Parbhani" "Nashik" "Latur" "North East" "South" "Faridkot" "Bathinda" "Ludhiana" "Moga" "Rupnagar" "Hoshiarpur" "Kapurthala" "Jalandhar" "Shahid Bhagat Singh Nagar" "Jaisalmer" "Hanumangarh" "Jodhpur" "Tonk" "Etawah" "Aligarh" "Etah" "Firozabad" "Jalaun" "Bijnor" "Mainpuri" "Hamirpur" "Saharanpur" "Farrukhabad" "Mahoba" "Hardwar" "Dehradun" "Chamoli" {
	replace phase_ii = 1 if district_name == "`dist'"
}


****************** Dummies for Multisectoral Intervention ******************
capture drop multisect
gen multisect = 0

foreach dist in "Anantapuramu" "Chittoor" "Prakasam" "Krishna" "Kurnool" "Sri Potti Sriramulu Nellore" "Guntur" "West Siang" "Upper Siang" "Lower Dibang Valley" "Kurung Kumey" "East Kameng" "Patna" "Muzaffarpur" "Bhojpur" "Begusarai" "Lakhisarai" "Samastipur" "Saran" "Khagaria" "Rohtas" "Nalanda" "Purba Champaran" "Madhubani" "Bhagalpur" "Sheikhpura" "Banka" "Nawada" "Bijapur" "Diu" "Surendranagar" "Kheda" "Vadodara" "Banaskantha" "Porbandar" "Sabarkantha" "Jamnagar" "Junagadh" "Kachchh" "Valsad" "Panch Mahals" "Narmada" "Dohad" "Nuh" "Solan" "Bilaspur" "Mandi" "Shimla" "Sirmaur" "Poonch" "Reasi" "Kishtwar" "Ramban" "Doda" "Leh" "Hazaribagh" "Giridih" "Bokaro" "Kodarma" "Ramgarh" "Ranchi" "Purbi Singhbhum" "Palamu" "Saraikela Kharsawan" "Deoghar" "Jamtara" "Bagalkot" "Haveri" "Gadag" "Dakshina Kannada" "Shivpuri" "Sheopur" "Chhatarpur" "Indore" "Satna" "Guna" "Narsimhapur" "Sehore" "Sidhi" "Panna" "Dewas" "Hoshangabad" "Rajgarh" "Shajapur" "Bhopal" "Ashoknagar" "Singrauli" "Jabalpur" "Burhanpur" "Sagar" "Vidisha" "Mandsaur" "Neemuch" "Dhar" "Damoh" "Ujjain" "Khandwa" "Raisen" "Khargone" "Ratlam" "Katni" "Jhabua" "Umaria" "Barwani" "Anuppur" "Seoni" "Satara" "Dhule" "Nanded" "Akola" "Mumbai Suburban" "Mumbai City" "Wardha" "Sindhudurg" "Yavatmal" "Thane" "Nagpur" "Raigarh" "Amravati" "Ratnagiri" "Nandurbar" "Tamenglong" "Chandel" "Ukhrul" "Bishnupur" "Thoubal" "Imphal East" "Churachandpur" "Serchhip" "Mon" "Phek" "Tuensang" "Peren" "Mokokchung" "Wokha" "New Delhi" "Central" "Dhenkanal" "Anugul" "Ganjam" "Cuttack" "Khordha" "Debagarh" "Sundargarh" "Sambalpur" "Kendrapara" "Jajapur" "Jharsuguda" "Bhadrak" "Baleshwar" "Kalahandi" "Bundi" "Jalor" "Sirohi" "Nagaur" "Pali" "Kota" "Ajmer" "Churu" "Rajsamand" "Barmer" "Bikaner" "Jhalawar" "Chittaurgarh" "Baran" "Dungarpur" "Banswara" "Udaipur" "Bhilwara" "Pratapgarh" "Ariyalur" "Dharmapuri" "Namakkal" "Salem" "Perambalur" "Viluppuram" "Tiruvannamalai" "Thiruvallur" "Tiruchirappalli" "Chennai" "Warangal Urban" "Nalgonda" "Mahbubnagar" "Rangareddy" "Adilabad" "Karimnagar" "Nizamabad" "Kanpur Nagar" "Varanasi" "Prayagraj" "Kasganj" "Auraiya" "Kanpur Dehat" "Kannauj" "Budaun" "Hardoi" "Ballia" "Mirzapur" "Banda" "Bhadohi" "Shahjahanpur" "Amroha" "Bareilly" "Chitrakoot" "Fatehpur" "Ghazipur" "Gorakhpur" "Chandauli" "Pilibhit" "Lucknow" "Moradabad" "Lalitpur" "Pratapgarh" "Jaunpur" "Azamgarh" "Unnao" "Lakhimpur Kheri" "Sultanpur" "Kaushambi" "Sonbhadra" "Deoria" "Gonda" "Mau" "Rae Bareli" "Shrawasti" "Kushinagar" "Basti" "Sitapur" "Maharajganj" "Ayodhya" "Ambedkar Nagar" "Bara Banki" "Bahraich" "Siddharthnagar" "Tehri Garhwal" "Udham Singh Nagar" "Nainital" "Bageshwar" "Garhwal" "Rudraprayag" "Uttarkashi" "Almora" "Bankura" "Koch Bihar" {
	replace multisect = 1 if district_name == "`dist'"
}

****************** Dummies for Media and Advocacy Intervention ******************

capture drop med_adv
gen med_adv = 0

foreach dist in "South Andaman" "North & Middle Andaman" "Srikakulam" "Vizianagaram" "Visakhapatnam" "West Godavari" "East Godavari" "Tirap" "Lower Subansiri" "Lohit" "Upper Subansiri" "West Kameng" "Papum Pare" "Changlang" "Tawang" "East Siang" "Anjaw" "Dhemaji" "Cachar" "Kokrajhar" "Hailakandi" "Morigaon" "Karbi Anglong" "Lakhimpur" "Sivasagar" "Tinsukia" "Barpeta" "Dibrugarh" "Goalpara" "Golaghat" "Nagaon" "Jorhat" "Sonitpur" "Baksa" "Dima Hasao" "Nalbari" "Kamrup" "Chirang" "Dhubri" "Darrang" "Bongaigaon" "Karimganj" "Udalguri" "Jehanabad" "Munger" "Sheohar" "Madhepura" "Sitamarhi" "Darbhanga" "Saharsa" "Buxar" "Siwan" "Arwal" "Kaimur" "Aurangabad" "Supaul" "Pashchim Champaran" "Purnia" "Gopalganj" "Jamui" "Araria" "Gaya" "Katihar" "Kishanganj" "Janjgir Champa" "Bilaspur" "Surguja" "Durg" "Korba" "Koriya" "Raipur" "Mahasamund" "Dhamtari" "Uttar Bastar Kanker" "Jashpur" "Kabeerdham" "Rajnandgaon" "Narayanpur" "Bastar" "Dakshin Bastar Dantewada" "South Goa" "Bharuch" "Navsari" "Tapi" "The Dangs" "Chamba" "Kullu" "Kinnaur" "Lahul & Spiti" "Kargil" "Godda" "Sahibganj" "Garhwa" "Gumla" "Khunti" "Dumka" "Chatra" "Latehar" "Simdega" "Lohardaga" "Pakur" "Pashchimi Singhbhum" "Belagavi" "Mandya" "Bidar" "Kalaburagi" "Dharwad" "Bengaluru Urban" "Chitradurga" "Davanagere" "Raichur" "Bengaluru Rural" "Yadgir" "Chamarajanagar" "Chikkaballapura" "Uttara Kannada" "Koppal" "Udupi" "Tumakuru" "Ballari" "Shivamogga" "Mysuru" "Kolar" "Ramanagara" "Chikkamagaluru" "Hassan" "Kodagu" "Alappuzha" "Ernakulam" "Kasaragod" "Idukki" "Kottayam" "Thiruvananthapuram" "Wayanad" "Malappuram" "Palakkad" "Kozhikode" "Kannur" "Kollam" "Pathanamthitta" "Harda" "Shahdol" "Chhindwara" "Betul" "Balaghat" "Dindori" "Mandla" "Alirajpur" "Bhandara" "Chandrapur" "Gondiya" "Gadchiroli" "Imphal West" "East Khasi Hills" "West Khasi Hills" "South Garo Hills" "Jaintia Hills" "West Garo Hills" "East Garo Hills" "Lunglei" "Lawngtlai" "Champhai" "Mamit" "Aizawl" "Kolasib" "Zunheboto" "Kiphire" "Dimapur" "Kohima" "Jagatsinghapur" "Puri" "Subarnapur" "Balangir" "Bargarh" "Mayurbhanj" "Kandhamal" "Rayagada" "Kendujhar" "Gajapati" "Baudh" "Koraput" "Nuapada" "Malkangiri" "Nabarangapur" "Karaikal" "Puducherry" "Mahe" "South District" "East District" "West District" "Krishnagiri" "Madurai" "Dindigul" "Theni" "Karur" "Vellore" "Tiruppur" "Erode" "Virudhunagar" "Coimbatore" "Thanjavur" "Thiruvarur" "Nagapattinam" "Kancheepuram" "Sivaganga" "Pudukkottai" "Tirunelveli" "Ramanathapuram" "Thoothukkudi" "Kanniyakumari" "The Nilgiris" "Medak" "Khammam" "West Tripura" "Dhalai" "North Tripura" "Rampur" "Sant Kabir Nagar" "Balrampur" "Purba Medinipur" "Maldah" "Barddhaman" "Hugli" "Uttar Dinajpur" "Puruliya" "Darjiling" "Jalpaiguri" "North Twenty Four Parganas" "Dakshin Dinajpur" "Birbhum" "Nadia" "Haora" "South Twenty Four Parganas" "Paschim Medinipur" "Murshidabad" {
	
	replace med_adv = 1 if district_name == "`dist'"
}

****************** Dummy for Overall Intervention ******************
capture drop B3P
gen B3P = 0

replace B3P = 1 if phase_i == 1 | phase_ii == 1 | multisect == 1 | med_adv == 1

***********post for Phase I and II ***********
gen post_1 = (year >= 2015)

***********post for Pan India Expansion ***********
gen post_2 = (year >= 2018)

//checking number of districts without any intervention
codebook district_name if B3P == 0

*/


****************************************
* Generating Other Necessary Variables *
****************************************
capture drop dropout_class5
gen dropout_class5 = oos_dropout_class == 5 if oos_dropout == 1


capture drop dropout_class8
gen dropout_class8 = oos_dropout_class == 8 if oos_dropout == 1

* numeric ID for each unique district name
egen district_id = group(district_name)


********************
* Defining Controls
********************
* Child Controls
gen takes_tuition = (tuition == 1)
gen private_school = (school_type == 2)

* Parental Controls
gen mom_edu = (mother_gone_to_school == 1)
gen dad_edu = (father_gone_to_school == 1)

* Wealth Controls
gen pucca_house = (hh_type == 1)
gen has_tv = (hh_tv == 1)
gen has_elec = (hh_electricity_conn == 1)

* Village Controls
gen has_road = (vlg_pucca_road == 1)
gen has_prim_school = (vlg_govt_primary_school_1_5 ==1)
gen has_mid_school = (vlg_govt_middle_school_1_8 ==1)
gen has_sec_school = (vlg_govt_secondary_school_1_10 == 1)


global child_controls  "takes_tuition private_school"
global parent_controls "mom_edu dad_edu"
global wealth_controls "pucca_house has_tv has_elec"
global village_controls "has_road has_prim_school has_mid_school has_sec_school"

global all_controls "$child_controls $parent_controls $wealth_controls $village_controls"


**********************
* Summary Statistics *
**********************

* summary stats for test scores by class
preserve
keep if child_gender == 2

foreach c in 1 2 3 {
    di "----------------------------------------"
    di "Summary Statistics for Class `c'"
    di "----------------------------------------"

    summarize read_code math_code if school_class == `c'
}
restore

* summary stats for dropout distribution

preserve
keep if child_gender == 2

di "----------------------------------------"
di "Distribution of Dropout Classes (as %)"
di "----------------------------------------"
tab oos_dropout_class if oos_dropout == 1

restore



* Summarizing treatment by district level
preserve
keep district_id district_name phase_i phase_ii multisect med_adv B3P
duplicates drop
summarize phase_i phase_ii multisect med_adv B3P
restore

* Summarizing controls for girls at HH level
summarize $all_controls if child_gender == 2


**********************************
* DiD with Two-Way Fixed Effects *
**********************************

****************** Reading Skills ******************

* Loop through classes 1, 2, and 3
foreach c of numlist 1 2 3 {
	
    * Display a message in the output window to track progress
    display as result "--------------------------------------"
    display as result "Running regression for School Class: `c'"
    display as result "--------------------------------------"

    * Run the regression using the local macro `c' for the class	
	reghdfe read_code phase_i##post_1 phase_ii##post_1 $all_controls ///
        if child_gender == 2 & school_class == `c', ///
        absorb(year district_id) cluster(district_id)
    
    * Store the results for later table generation (naming them class_3, class_2, etc.)
    estimates store class_`c'
}


****************** Math Skills ******************
foreach c of numlist 1 2 3 {
	
    * Display a message in the output window to track progress
    display as result "--------------------------------------"
    display as result "Running regression for School Class: `c'"
    display as result "--------------------------------------"

    * Run the regression using the local macro `c' for the class
    reghdfe math_code phase_i##post_1 phase_ii##post_1 $all_controls ///
        if child_gender == 2 & school_class == `c', ///
        absorb(year district_id) cluster(district_id)
    
    * Store the results for later table generation (naming them class_3, class_2, etc.)
    estimates store class_`c'
}


****************** Class Dropout ******************

* class at which dropped out of school

reghdfe dropout_class5 phase_i##post_1 phase_ii##post_1 $all_controls ///
        if child_gender == 2 & oos_dropout == 1, ///
        absorb(year district_id) cluster(district_id)

reghdfe dropout_class8 phase_i##post_1 phase_ii##post_1 $all_controls ///
        if child_gender == 2 & oos_dropout == 1, ///
        absorb(year district_id) cluster(district_id)

log close
