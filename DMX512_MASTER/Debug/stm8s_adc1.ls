   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  42                     ; 52 void ADC1_DeInit(void)
  42                     ; 53 {
  44                     	switch	.text
  45  0000               _ADC1_DeInit:
  49                     ; 54   ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  51  0000 725f5400      	clr	21504
  52                     ; 55   ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  54  0004 725f5401      	clr	21505
  55                     ; 56   ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  57  0008 725f5402      	clr	21506
  58                     ; 57   ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  60  000c 725f5403      	clr	21507
  61                     ; 58   ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  63  0010 725f5406      	clr	21510
  64                     ; 59   ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  66  0014 725f5407      	clr	21511
  67                     ; 60   ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  69  0018 35ff5408      	mov	21512,#255
  70                     ; 61   ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  72  001c 35035409      	mov	21513,#3
  73                     ; 62   ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  75  0020 725f540a      	clr	21514
  76                     ; 63   ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  78  0024 725f540b      	clr	21515
  79                     ; 64   ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  81  0028 725f540e      	clr	21518
  82                     ; 65   ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  84  002c 725f540f      	clr	21519
  85                     ; 66 }
  88  0030 81            	ret
 539                     ; 88 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 539                     ; 89 {
 540                     	switch	.text
 541  0031               _ADC1_Init:
 543  0031 89            	pushw	x
 544       00000000      OFST:	set	0
 547                     ; 91   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 549                     ; 92   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 551                     ; 93   assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 553                     ; 94   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 555                     ; 95   assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 557                     ; 96   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 559                     ; 97   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 561                     ; 98   assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 563                     ; 103   ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 565  0032 7b08          	ld	a,(OFST+8,sp)
 566  0034 88            	push	a
 567  0035 9f            	ld	a,xl
 568  0036 97            	ld	xl,a
 569  0037 7b02          	ld	a,(OFST+2,sp)
 570  0039 95            	ld	xh,a
 571  003a cd013d        	call	_ADC1_ConversionConfig
 573  003d 84            	pop	a
 574                     ; 105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 576  003e 7b05          	ld	a,(OFST+5,sp)
 577  0040 ad5a          	call	_ADC1_PrescalerConfig
 579                     ; 110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 581  0042 7b07          	ld	a,(OFST+7,sp)
 582  0044 97            	ld	xl,a
 583  0045 7b06          	ld	a,(OFST+6,sp)
 584  0047 95            	ld	xh,a
 585  0048 cd016b        	call	_ADC1_ExternalTriggerConfig
 587                     ; 115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 589  004b 7b0a          	ld	a,(OFST+10,sp)
 590  004d 97            	ld	xl,a
 591  004e 7b09          	ld	a,(OFST+9,sp)
 592  0050 95            	ld	xh,a
 593  0051 ad5c          	call	_ADC1_SchmittTriggerConfig
 595                     ; 118   ADC1->CR1 |= ADC1_CR1_ADON;
 597  0053 72105401      	bset	21505,#0
 598                     ; 119 }
 601  0057 85            	popw	x
 602  0058 81            	ret
 637                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 637                     ; 127 {
 638                     	switch	.text
 639  0059               _ADC1_Cmd:
 643                     ; 129   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 645                     ; 131   if (NewState != DISABLE)
 647  0059 4d            	tnz	a
 648  005a 2706          	jreq	L362
 649                     ; 133     ADC1->CR1 |= ADC1_CR1_ADON;
 651  005c 72105401      	bset	21505,#0
 653  0060 2004          	jra	L562
 654  0062               L362:
 655                     ; 137     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 657  0062 72115401      	bres	21505,#0
 658  0066               L562:
 659                     ; 139 }
 662  0066 81            	ret
 697                     ; 146 void ADC1_ScanModeCmd(FunctionalState NewState)
 697                     ; 147 {
 698                     	switch	.text
 699  0067               _ADC1_ScanModeCmd:
 703                     ; 149   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 705                     ; 151   if (NewState != DISABLE)
 707  0067 4d            	tnz	a
 708  0068 2706          	jreq	L503
 709                     ; 153     ADC1->CR2 |= ADC1_CR2_SCAN;
 711  006a 72125402      	bset	21506,#1
 713  006e 2004          	jra	L703
 714  0070               L503:
 715                     ; 157     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 717  0070 72135402      	bres	21506,#1
 718  0074               L703:
 719                     ; 159 }
 722  0074 81            	ret
 757                     ; 166 void ADC1_DataBufferCmd(FunctionalState NewState)
 757                     ; 167 {
 758                     	switch	.text
 759  0075               _ADC1_DataBufferCmd:
 763                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 765                     ; 171   if (NewState != DISABLE)
 767  0075 4d            	tnz	a
 768  0076 2706          	jreq	L723
 769                     ; 173     ADC1->CR3 |= ADC1_CR3_DBUF;
 771  0078 721e5403      	bset	21507,#7
 773  007c 2004          	jra	L133
 774  007e               L723:
 775                     ; 177     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 777  007e 721f5403      	bres	21507,#7
 778  0082               L133:
 779                     ; 179 }
 782  0082 81            	ret
 938                     ; 190 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 938                     ; 191 {
 939                     	switch	.text
 940  0083               _ADC1_ITConfig:
 942  0083 89            	pushw	x
 943       00000000      OFST:	set	0
 946                     ; 193   assert_param(IS_ADC1_IT_OK(ADC1_IT));
 948                     ; 194   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 950                     ; 196   if (NewState != DISABLE)
 952  0084 0d05          	tnz	(OFST+5,sp)
 953  0086 2709          	jreq	L714
 954                     ; 199     ADC1->CSR |= (uint8_t)ADC1_IT;
 956  0088 9f            	ld	a,xl
 957  0089 ca5400        	or	a,21504
 958  008c c75400        	ld	21504,a
 960  008f 2009          	jra	L124
 961  0091               L714:
 962                     ; 204     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
 964  0091 7b02          	ld	a,(OFST+2,sp)
 965  0093 43            	cpl	a
 966  0094 c45400        	and	a,21504
 967  0097 c75400        	ld	21504,a
 968  009a               L124:
 969                     ; 206 }
 972  009a 85            	popw	x
 973  009b 81            	ret
1009                     ; 214 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1009                     ; 215 {
1010                     	switch	.text
1011  009c               _ADC1_PrescalerConfig:
1013  009c 88            	push	a
1014       00000000      OFST:	set	0
1017                     ; 217   assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1019                     ; 220   ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1021  009d c65401        	ld	a,21505
1022  00a0 a48f          	and	a,#143
1023  00a2 c75401        	ld	21505,a
1024                     ; 222   ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1026  00a5 c65401        	ld	a,21505
1027  00a8 1a01          	or	a,(OFST+1,sp)
1028  00aa c75401        	ld	21505,a
1029                     ; 223 }
1032  00ad 84            	pop	a
1033  00ae 81            	ret
1080                     ; 233 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1080                     ; 234 {
1081                     	switch	.text
1082  00af               _ADC1_SchmittTriggerConfig:
1084  00af 89            	pushw	x
1085       00000000      OFST:	set	0
1088                     ; 236   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1090                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1092                     ; 239   if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1094  00b0 9e            	ld	a,xh
1095  00b1 a1ff          	cp	a,#255
1096  00b3 2620          	jrne	L364
1097                     ; 241     if (NewState != DISABLE)
1099  00b5 9f            	ld	a,xl
1100  00b6 4d            	tnz	a
1101  00b7 270a          	jreq	L564
1102                     ; 243       ADC1->TDRL &= (uint8_t)0x0;
1104  00b9 725f5407      	clr	21511
1105                     ; 244       ADC1->TDRH &= (uint8_t)0x0;
1107  00bd 725f5406      	clr	21510
1109  00c1 2078          	jra	L174
1110  00c3               L564:
1111                     ; 248       ADC1->TDRL |= (uint8_t)0xFF;
1113  00c3 c65407        	ld	a,21511
1114  00c6 aaff          	or	a,#255
1115  00c8 c75407        	ld	21511,a
1116                     ; 249       ADC1->TDRH |= (uint8_t)0xFF;
1118  00cb c65406        	ld	a,21510
1119  00ce aaff          	or	a,#255
1120  00d0 c75406        	ld	21510,a
1121  00d3 2066          	jra	L174
1122  00d5               L364:
1123                     ; 252   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1125  00d5 7b01          	ld	a,(OFST+1,sp)
1126  00d7 a108          	cp	a,#8
1127  00d9 242f          	jruge	L374
1128                     ; 254     if (NewState != DISABLE)
1130  00db 0d02          	tnz	(OFST+2,sp)
1131  00dd 2716          	jreq	L574
1132                     ; 256       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1134  00df 7b01          	ld	a,(OFST+1,sp)
1135  00e1 5f            	clrw	x
1136  00e2 97            	ld	xl,a
1137  00e3 a601          	ld	a,#1
1138  00e5 5d            	tnzw	x
1139  00e6 2704          	jreq	L42
1140  00e8               L62:
1141  00e8 48            	sll	a
1142  00e9 5a            	decw	x
1143  00ea 26fc          	jrne	L62
1144  00ec               L42:
1145  00ec 43            	cpl	a
1146  00ed c45407        	and	a,21511
1147  00f0 c75407        	ld	21511,a
1149  00f3 2046          	jra	L174
1150  00f5               L574:
1151                     ; 260       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1153  00f5 7b01          	ld	a,(OFST+1,sp)
1154  00f7 5f            	clrw	x
1155  00f8 97            	ld	xl,a
1156  00f9 a601          	ld	a,#1
1157  00fb 5d            	tnzw	x
1158  00fc 2704          	jreq	L03
1159  00fe               L23:
1160  00fe 48            	sll	a
1161  00ff 5a            	decw	x
1162  0100 26fc          	jrne	L23
1163  0102               L03:
1164  0102 ca5407        	or	a,21511
1165  0105 c75407        	ld	21511,a
1166  0108 2031          	jra	L174
1167  010a               L374:
1168                     ; 265     if (NewState != DISABLE)
1170  010a 0d02          	tnz	(OFST+2,sp)
1171  010c 2718          	jreq	L305
1172                     ; 267       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1174  010e 7b01          	ld	a,(OFST+1,sp)
1175  0110 a008          	sub	a,#8
1176  0112 5f            	clrw	x
1177  0113 97            	ld	xl,a
1178  0114 a601          	ld	a,#1
1179  0116 5d            	tnzw	x
1180  0117 2704          	jreq	L43
1181  0119               L63:
1182  0119 48            	sll	a
1183  011a 5a            	decw	x
1184  011b 26fc          	jrne	L63
1185  011d               L43:
1186  011d 43            	cpl	a
1187  011e c45406        	and	a,21510
1188  0121 c75406        	ld	21510,a
1190  0124 2015          	jra	L174
1191  0126               L305:
1192                     ; 271       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1194  0126 7b01          	ld	a,(OFST+1,sp)
1195  0128 a008          	sub	a,#8
1196  012a 5f            	clrw	x
1197  012b 97            	ld	xl,a
1198  012c a601          	ld	a,#1
1199  012e 5d            	tnzw	x
1200  012f 2704          	jreq	L04
1201  0131               L24:
1202  0131 48            	sll	a
1203  0132 5a            	decw	x
1204  0133 26fc          	jrne	L24
1205  0135               L04:
1206  0135 ca5406        	or	a,21510
1207  0138 c75406        	ld	21510,a
1208  013b               L174:
1209                     ; 274 }
1212  013b 85            	popw	x
1213  013c 81            	ret
1270                     ; 286 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1270                     ; 287 {
1271                     	switch	.text
1272  013d               _ADC1_ConversionConfig:
1274  013d 89            	pushw	x
1275       00000000      OFST:	set	0
1278                     ; 289   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1280                     ; 290   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1282                     ; 291   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1284                     ; 294   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1286  013e 72175402      	bres	21506,#3
1287                     ; 296   ADC1->CR2 |= (uint8_t)(ADC1_Align);
1289  0142 c65402        	ld	a,21506
1290  0145 1a05          	or	a,(OFST+5,sp)
1291  0147 c75402        	ld	21506,a
1292                     ; 298   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1294  014a 9e            	ld	a,xh
1295  014b a101          	cp	a,#1
1296  014d 2606          	jrne	L535
1297                     ; 301     ADC1->CR1 |= ADC1_CR1_CONT;
1299  014f 72125401      	bset	21505,#1
1301  0153 2004          	jra	L735
1302  0155               L535:
1303                     ; 306     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1305  0155 72135401      	bres	21505,#1
1306  0159               L735:
1307                     ; 310   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1309  0159 c65400        	ld	a,21504
1310  015c a4f0          	and	a,#240
1311  015e c75400        	ld	21504,a
1312                     ; 312   ADC1->CSR |= (uint8_t)(ADC1_Channel);
1314  0161 c65400        	ld	a,21504
1315  0164 1a02          	or	a,(OFST+2,sp)
1316  0166 c75400        	ld	21504,a
1317                     ; 313 }
1320  0169 85            	popw	x
1321  016a 81            	ret
1367                     ; 325 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1367                     ; 326 {
1368                     	switch	.text
1369  016b               _ADC1_ExternalTriggerConfig:
1371  016b 89            	pushw	x
1372       00000000      OFST:	set	0
1375                     ; 328   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1377                     ; 329   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1379                     ; 332   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1381  016c c65402        	ld	a,21506
1382  016f a4cf          	and	a,#207
1383  0171 c75402        	ld	21506,a
1384                     ; 334   if (NewState != DISABLE)
1386  0174 9f            	ld	a,xl
1387  0175 4d            	tnz	a
1388  0176 2706          	jreq	L365
1389                     ; 337     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1391  0178 721c5402      	bset	21506,#6
1393  017c 2004          	jra	L565
1394  017e               L365:
1395                     ; 342     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1397  017e 721d5402      	bres	21506,#6
1398  0182               L565:
1399                     ; 346   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1401  0182 c65402        	ld	a,21506
1402  0185 1a01          	or	a,(OFST+1,sp)
1403  0187 c75402        	ld	21506,a
1404                     ; 347 }
1407  018a 85            	popw	x
1408  018b 81            	ret
1432                     ; 358 void ADC1_StartConversion(void)
1432                     ; 359 {
1433                     	switch	.text
1434  018c               _ADC1_StartConversion:
1438                     ; 360   ADC1->CR1 |= ADC1_CR1_ADON;
1440  018c 72105401      	bset	21505,#0
1441                     ; 361 }
1444  0190 81            	ret
1484                     ; 370 uint16_t ADC1_GetConversionValue(void)
1484                     ; 371 {
1485                     	switch	.text
1486  0191               _ADC1_GetConversionValue:
1488  0191 5205          	subw	sp,#5
1489       00000005      OFST:	set	5
1492                     ; 372   uint16_t temph = 0;
1494                     ; 373   uint8_t templ = 0;
1496                     ; 375   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1498  0193 c65402        	ld	a,21506
1499  0196 a508          	bcp	a,#8
1500  0198 2715          	jreq	L516
1501                     ; 378     templ = ADC1->DRL;
1503  019a c65405        	ld	a,21509
1504  019d 6b03          	ld	(OFST-2,sp),a
1506                     ; 380     temph = ADC1->DRH;
1508  019f c65404        	ld	a,21508
1509  01a2 5f            	clrw	x
1510  01a3 97            	ld	xl,a
1511  01a4 1f04          	ldw	(OFST-1,sp),x
1513                     ; 382     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1515  01a6 1e04          	ldw	x,(OFST-1,sp)
1516  01a8 7b03          	ld	a,(OFST-2,sp)
1517  01aa 02            	rlwa	x,a
1518  01ab 1f04          	ldw	(OFST-1,sp),x
1521  01ad 2021          	jra	L716
1522  01af               L516:
1523                     ; 387     temph = ADC1->DRH;
1525  01af c65404        	ld	a,21508
1526  01b2 5f            	clrw	x
1527  01b3 97            	ld	xl,a
1528  01b4 1f04          	ldw	(OFST-1,sp),x
1530                     ; 389     templ = ADC1->DRL;
1532  01b6 c65405        	ld	a,21509
1533  01b9 6b03          	ld	(OFST-2,sp),a
1535                     ; 391     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1537  01bb 1e04          	ldw	x,(OFST-1,sp)
1538  01bd 4f            	clr	a
1539  01be 02            	rlwa	x,a
1540  01bf 1f01          	ldw	(OFST-4,sp),x
1542  01c1 7b03          	ld	a,(OFST-2,sp)
1543  01c3 97            	ld	xl,a
1544  01c4 a640          	ld	a,#64
1545  01c6 42            	mul	x,a
1546  01c7 01            	rrwa	x,a
1547  01c8 1a02          	or	a,(OFST-3,sp)
1548  01ca 01            	rrwa	x,a
1549  01cb 1a01          	or	a,(OFST-4,sp)
1550  01cd 01            	rrwa	x,a
1551  01ce 1f04          	ldw	(OFST-1,sp),x
1553  01d0               L716:
1554                     ; 394   return ((uint16_t)temph);
1556  01d0 1e04          	ldw	x,(OFST-1,sp)
1559  01d2 5b05          	addw	sp,#5
1560  01d4 81            	ret
1606                     ; 405 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1606                     ; 406 {
1607                     	switch	.text
1608  01d5               _ADC1_AWDChannelConfig:
1610  01d5 89            	pushw	x
1611       00000000      OFST:	set	0
1614                     ; 408   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1616                     ; 409   assert_param(IS_ADC1_CHANNEL_OK(Channel));
1618                     ; 411   if (Channel < (uint8_t)8)
1620  01d6 9e            	ld	a,xh
1621  01d7 a108          	cp	a,#8
1622  01d9 242e          	jruge	L346
1623                     ; 413     if (NewState != DISABLE)
1625  01db 9f            	ld	a,xl
1626  01dc 4d            	tnz	a
1627  01dd 2714          	jreq	L546
1628                     ; 415       ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1630  01df 9e            	ld	a,xh
1631  01e0 5f            	clrw	x
1632  01e1 97            	ld	xl,a
1633  01e2 a601          	ld	a,#1
1634  01e4 5d            	tnzw	x
1635  01e5 2704          	jreq	L65
1636  01e7               L06:
1637  01e7 48            	sll	a
1638  01e8 5a            	decw	x
1639  01e9 26fc          	jrne	L06
1640  01eb               L65:
1641  01eb ca540f        	or	a,21519
1642  01ee c7540f        	ld	21519,a
1644  01f1 2047          	jra	L156
1645  01f3               L546:
1646                     ; 419       ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1648  01f3 7b01          	ld	a,(OFST+1,sp)
1649  01f5 5f            	clrw	x
1650  01f6 97            	ld	xl,a
1651  01f7 a601          	ld	a,#1
1652  01f9 5d            	tnzw	x
1653  01fa 2704          	jreq	L26
1654  01fc               L46:
1655  01fc 48            	sll	a
1656  01fd 5a            	decw	x
1657  01fe 26fc          	jrne	L46
1658  0200               L26:
1659  0200 43            	cpl	a
1660  0201 c4540f        	and	a,21519
1661  0204 c7540f        	ld	21519,a
1662  0207 2031          	jra	L156
1663  0209               L346:
1664                     ; 424     if (NewState != DISABLE)
1666  0209 0d02          	tnz	(OFST+2,sp)
1667  020b 2717          	jreq	L356
1668                     ; 426       ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1670  020d 7b01          	ld	a,(OFST+1,sp)
1671  020f a008          	sub	a,#8
1672  0211 5f            	clrw	x
1673  0212 97            	ld	xl,a
1674  0213 a601          	ld	a,#1
1675  0215 5d            	tnzw	x
1676  0216 2704          	jreq	L66
1677  0218               L07:
1678  0218 48            	sll	a
1679  0219 5a            	decw	x
1680  021a 26fc          	jrne	L07
1681  021c               L66:
1682  021c ca540e        	or	a,21518
1683  021f c7540e        	ld	21518,a
1685  0222 2016          	jra	L156
1686  0224               L356:
1687                     ; 430       ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1689  0224 7b01          	ld	a,(OFST+1,sp)
1690  0226 a008          	sub	a,#8
1691  0228 5f            	clrw	x
1692  0229 97            	ld	xl,a
1693  022a a601          	ld	a,#1
1694  022c 5d            	tnzw	x
1695  022d 2704          	jreq	L27
1696  022f               L47:
1697  022f 48            	sll	a
1698  0230 5a            	decw	x
1699  0231 26fc          	jrne	L47
1700  0233               L27:
1701  0233 43            	cpl	a
1702  0234 c4540e        	and	a,21518
1703  0237 c7540e        	ld	21518,a
1704  023a               L156:
1705                     ; 433 }
1708  023a 85            	popw	x
1709  023b 81            	ret
1742                     ; 441 void ADC1_SetHighThreshold(uint16_t Threshold)
1742                     ; 442 {
1743                     	switch	.text
1744  023c               _ADC1_SetHighThreshold:
1746  023c 89            	pushw	x
1747       00000000      OFST:	set	0
1750                     ; 443   ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
1752  023d 54            	srlw	x
1753  023e 54            	srlw	x
1754  023f 9f            	ld	a,xl
1755  0240 c75408        	ld	21512,a
1756                     ; 444   ADC1->HTRL = (uint8_t)Threshold;
1758  0243 7b02          	ld	a,(OFST+2,sp)
1759  0245 c75409        	ld	21513,a
1760                     ; 445 }
1763  0248 85            	popw	x
1764  0249 81            	ret
1797                     ; 453 void ADC1_SetLowThreshold(uint16_t Threshold)
1797                     ; 454 {
1798                     	switch	.text
1799  024a               _ADC1_SetLowThreshold:
1803                     ; 455   ADC1->LTRL = (uint8_t)Threshold;
1805  024a 9f            	ld	a,xl
1806  024b c7540b        	ld	21515,a
1807                     ; 456   ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
1809  024e 54            	srlw	x
1810  024f 54            	srlw	x
1811  0250 9f            	ld	a,xl
1812  0251 c7540a        	ld	21514,a
1813                     ; 457 }
1816  0254 81            	ret
1863                     ; 466 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
1863                     ; 467 {
1864                     	switch	.text
1865  0255               _ADC1_GetBufferValue:
1867  0255 88            	push	a
1868  0256 5205          	subw	sp,#5
1869       00000005      OFST:	set	5
1872                     ; 468   uint16_t temph = 0;
1874                     ; 469   uint8_t templ = 0;
1876                     ; 472   assert_param(IS_ADC1_BUFFER_OK(Buffer));
1878                     ; 474   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1880  0258 c65402        	ld	a,21506
1881  025b a508          	bcp	a,#8
1882  025d 271f          	jreq	L727
1883                     ; 477     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1885  025f 7b06          	ld	a,(OFST+1,sp)
1886  0261 48            	sll	a
1887  0262 5f            	clrw	x
1888  0263 97            	ld	xl,a
1889  0264 d653e1        	ld	a,(21473,x)
1890  0267 6b03          	ld	(OFST-2,sp),a
1892                     ; 479     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1894  0269 7b06          	ld	a,(OFST+1,sp)
1895  026b 48            	sll	a
1896  026c 5f            	clrw	x
1897  026d 97            	ld	xl,a
1898  026e d653e0        	ld	a,(21472,x)
1899  0271 5f            	clrw	x
1900  0272 97            	ld	xl,a
1901  0273 1f04          	ldw	(OFST-1,sp),x
1903                     ; 481     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1905  0275 1e04          	ldw	x,(OFST-1,sp)
1906  0277 7b03          	ld	a,(OFST-2,sp)
1907  0279 02            	rlwa	x,a
1908  027a 1f04          	ldw	(OFST-1,sp),x
1911  027c 202b          	jra	L137
1912  027e               L727:
1913                     ; 486     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1915  027e 7b06          	ld	a,(OFST+1,sp)
1916  0280 48            	sll	a
1917  0281 5f            	clrw	x
1918  0282 97            	ld	xl,a
1919  0283 d653e0        	ld	a,(21472,x)
1920  0286 5f            	clrw	x
1921  0287 97            	ld	xl,a
1922  0288 1f04          	ldw	(OFST-1,sp),x
1924                     ; 488     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1926  028a 7b06          	ld	a,(OFST+1,sp)
1927  028c 48            	sll	a
1928  028d 5f            	clrw	x
1929  028e 97            	ld	xl,a
1930  028f d653e1        	ld	a,(21473,x)
1931  0292 6b03          	ld	(OFST-2,sp),a
1933                     ; 490     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
1935  0294 1e04          	ldw	x,(OFST-1,sp)
1936  0296 4f            	clr	a
1937  0297 02            	rlwa	x,a
1938  0298 1f01          	ldw	(OFST-4,sp),x
1940  029a 7b03          	ld	a,(OFST-2,sp)
1941  029c 97            	ld	xl,a
1942  029d a640          	ld	a,#64
1943  029f 42            	mul	x,a
1944  02a0 01            	rrwa	x,a
1945  02a1 1a02          	or	a,(OFST-3,sp)
1946  02a3 01            	rrwa	x,a
1947  02a4 1a01          	or	a,(OFST-4,sp)
1948  02a6 01            	rrwa	x,a
1949  02a7 1f04          	ldw	(OFST-1,sp),x
1951  02a9               L137:
1952                     ; 493   return ((uint16_t)temph);
1954  02a9 1e04          	ldw	x,(OFST-1,sp)
1957  02ab 5b06          	addw	sp,#6
1958  02ad 81            	ret
2022                     ; 502 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
2022                     ; 503 {
2023                     	switch	.text
2024  02ae               _ADC1_GetAWDChannelStatus:
2026  02ae 88            	push	a
2027  02af 88            	push	a
2028       00000001      OFST:	set	1
2031                     ; 504   uint8_t status = 0;
2033                     ; 507   assert_param(IS_ADC1_CHANNEL_OK(Channel));
2035                     ; 509   if (Channel < (uint8_t)8)
2037  02b0 a108          	cp	a,#8
2038  02b2 2412          	jruge	L367
2039                     ; 511     status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2041  02b4 5f            	clrw	x
2042  02b5 97            	ld	xl,a
2043  02b6 a601          	ld	a,#1
2044  02b8 5d            	tnzw	x
2045  02b9 2704          	jreq	L601
2046  02bb               L011:
2047  02bb 48            	sll	a
2048  02bc 5a            	decw	x
2049  02bd 26fc          	jrne	L011
2050  02bf               L601:
2051  02bf c4540d        	and	a,21517
2052  02c2 6b01          	ld	(OFST+0,sp),a
2055  02c4 2014          	jra	L567
2056  02c6               L367:
2057                     ; 515     status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2059  02c6 7b02          	ld	a,(OFST+1,sp)
2060  02c8 a008          	sub	a,#8
2061  02ca 5f            	clrw	x
2062  02cb 97            	ld	xl,a
2063  02cc a601          	ld	a,#1
2064  02ce 5d            	tnzw	x
2065  02cf 2704          	jreq	L211
2066  02d1               L411:
2067  02d1 48            	sll	a
2068  02d2 5a            	decw	x
2069  02d3 26fc          	jrne	L411
2070  02d5               L211:
2071  02d5 c4540c        	and	a,21516
2072  02d8 6b01          	ld	(OFST+0,sp),a
2074  02da               L567:
2075                     ; 518   return ((FlagStatus)status);
2077  02da 7b01          	ld	a,(OFST+0,sp)
2080  02dc 85            	popw	x
2081  02dd 81            	ret
2235                     ; 527 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2235                     ; 528 {
2236                     	switch	.text
2237  02de               _ADC1_GetFlagStatus:
2239  02de 88            	push	a
2240  02df 88            	push	a
2241       00000001      OFST:	set	1
2244                     ; 529   uint8_t flagstatus = 0;
2246                     ; 530   uint8_t temp = 0;
2248                     ; 533   assert_param(IS_ADC1_FLAG_OK(Flag));
2250                     ; 535   if ((Flag & 0x0F) == 0x01)
2252  02e0 a40f          	and	a,#15
2253  02e2 a101          	cp	a,#1
2254  02e4 2609          	jrne	L1501
2255                     ; 538     flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2257  02e6 c65403        	ld	a,21507
2258  02e9 a440          	and	a,#64
2259  02eb 6b01          	ld	(OFST+0,sp),a
2262  02ed 2045          	jra	L3501
2263  02ef               L1501:
2264                     ; 540   else if ((Flag & 0xF0) == 0x10)
2266  02ef 7b02          	ld	a,(OFST+1,sp)
2267  02f1 a4f0          	and	a,#240
2268  02f3 a110          	cp	a,#16
2269  02f5 2636          	jrne	L5501
2270                     ; 543     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2272  02f7 7b02          	ld	a,(OFST+1,sp)
2273  02f9 a40f          	and	a,#15
2274  02fb 6b01          	ld	(OFST+0,sp),a
2276                     ; 544     if (temp < 8)
2278  02fd 7b01          	ld	a,(OFST+0,sp)
2279  02ff a108          	cp	a,#8
2280  0301 2414          	jruge	L7501
2281                     ; 546       flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2283  0303 7b01          	ld	a,(OFST+0,sp)
2284  0305 5f            	clrw	x
2285  0306 97            	ld	xl,a
2286  0307 a601          	ld	a,#1
2287  0309 5d            	tnzw	x
2288  030a 2704          	jreq	L021
2289  030c               L221:
2290  030c 48            	sll	a
2291  030d 5a            	decw	x
2292  030e 26fc          	jrne	L221
2293  0310               L021:
2294  0310 c4540d        	and	a,21517
2295  0313 6b01          	ld	(OFST+0,sp),a
2298  0315 201d          	jra	L3501
2299  0317               L7501:
2300                     ; 550       flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2302  0317 7b01          	ld	a,(OFST+0,sp)
2303  0319 a008          	sub	a,#8
2304  031b 5f            	clrw	x
2305  031c 97            	ld	xl,a
2306  031d a601          	ld	a,#1
2307  031f 5d            	tnzw	x
2308  0320 2704          	jreq	L421
2309  0322               L621:
2310  0322 48            	sll	a
2311  0323 5a            	decw	x
2312  0324 26fc          	jrne	L621
2313  0326               L421:
2314  0326 c4540c        	and	a,21516
2315  0329 6b01          	ld	(OFST+0,sp),a
2317  032b 2007          	jra	L3501
2318  032d               L5501:
2319                     ; 555     flagstatus = (uint8_t)(ADC1->CSR & Flag);
2321  032d c65400        	ld	a,21504
2322  0330 1402          	and	a,(OFST+1,sp)
2323  0332 6b01          	ld	(OFST+0,sp),a
2325  0334               L3501:
2326                     ; 557   return ((FlagStatus)flagstatus);
2328  0334 7b01          	ld	a,(OFST+0,sp)
2331  0336 85            	popw	x
2332  0337 81            	ret
2374                     ; 567 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2374                     ; 568 {
2375                     	switch	.text
2376  0338               _ADC1_ClearFlag:
2378  0338 88            	push	a
2379  0339 88            	push	a
2380       00000001      OFST:	set	1
2383                     ; 569   uint8_t temp = 0;
2385                     ; 572   assert_param(IS_ADC1_FLAG_OK(Flag));
2387                     ; 574   if ((Flag & 0x0F) == 0x01)
2389  033a a40f          	and	a,#15
2390  033c a101          	cp	a,#1
2391  033e 2606          	jrne	L5011
2392                     ; 577     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2394  0340 721d5403      	bres	21507,#6
2396  0344 204b          	jra	L7011
2397  0346               L5011:
2398                     ; 579   else if ((Flag & 0xF0) == 0x10)
2400  0346 7b02          	ld	a,(OFST+1,sp)
2401  0348 a4f0          	and	a,#240
2402  034a a110          	cp	a,#16
2403  034c 263a          	jrne	L1111
2404                     ; 582     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2406  034e 7b02          	ld	a,(OFST+1,sp)
2407  0350 a40f          	and	a,#15
2408  0352 6b01          	ld	(OFST+0,sp),a
2410                     ; 583     if (temp < 8)
2412  0354 7b01          	ld	a,(OFST+0,sp)
2413  0356 a108          	cp	a,#8
2414  0358 2416          	jruge	L3111
2415                     ; 585       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2417  035a 7b01          	ld	a,(OFST+0,sp)
2418  035c 5f            	clrw	x
2419  035d 97            	ld	xl,a
2420  035e a601          	ld	a,#1
2421  0360 5d            	tnzw	x
2422  0361 2704          	jreq	L231
2423  0363               L431:
2424  0363 48            	sll	a
2425  0364 5a            	decw	x
2426  0365 26fc          	jrne	L431
2427  0367               L231:
2428  0367 43            	cpl	a
2429  0368 c4540d        	and	a,21517
2430  036b c7540d        	ld	21517,a
2432  036e 2021          	jra	L7011
2433  0370               L3111:
2434                     ; 589       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2436  0370 7b01          	ld	a,(OFST+0,sp)
2437  0372 a008          	sub	a,#8
2438  0374 5f            	clrw	x
2439  0375 97            	ld	xl,a
2440  0376 a601          	ld	a,#1
2441  0378 5d            	tnzw	x
2442  0379 2704          	jreq	L631
2443  037b               L041:
2444  037b 48            	sll	a
2445  037c 5a            	decw	x
2446  037d 26fc          	jrne	L041
2447  037f               L631:
2448  037f 43            	cpl	a
2449  0380 c4540c        	and	a,21516
2450  0383 c7540c        	ld	21516,a
2451  0386 2009          	jra	L7011
2452  0388               L1111:
2453                     ; 594     ADC1->CSR &= (uint8_t) (~Flag);
2455  0388 7b02          	ld	a,(OFST+1,sp)
2456  038a 43            	cpl	a
2457  038b c45400        	and	a,21504
2458  038e c75400        	ld	21504,a
2459  0391               L7011:
2460                     ; 596 }
2463  0391 85            	popw	x
2464  0392 81            	ret
2517                     ; 616 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2517                     ; 617 {
2518                     	switch	.text
2519  0393               _ADC1_GetITStatus:
2521  0393 89            	pushw	x
2522  0394 88            	push	a
2523       00000001      OFST:	set	1
2526                     ; 618   ITStatus itstatus = RESET;
2528                     ; 619   uint8_t temp = 0;
2530                     ; 622   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2532                     ; 624   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2534  0395 01            	rrwa	x,a
2535  0396 a4f0          	and	a,#240
2536  0398 5f            	clrw	x
2537  0399 02            	rlwa	x,a
2538  039a a30010        	cpw	x,#16
2539  039d 2636          	jrne	L5411
2540                     ; 627     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2542  039f 7b03          	ld	a,(OFST+2,sp)
2543  03a1 a40f          	and	a,#15
2544  03a3 6b01          	ld	(OFST+0,sp),a
2546                     ; 628     if (temp < 8)
2548  03a5 7b01          	ld	a,(OFST+0,sp)
2549  03a7 a108          	cp	a,#8
2550  03a9 2414          	jruge	L7411
2551                     ; 630       itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2553  03ab 7b01          	ld	a,(OFST+0,sp)
2554  03ad 5f            	clrw	x
2555  03ae 97            	ld	xl,a
2556  03af a601          	ld	a,#1
2557  03b1 5d            	tnzw	x
2558  03b2 2704          	jreq	L441
2559  03b4               L641:
2560  03b4 48            	sll	a
2561  03b5 5a            	decw	x
2562  03b6 26fc          	jrne	L641
2563  03b8               L441:
2564  03b8 c4540d        	and	a,21517
2565  03bb 6b01          	ld	(OFST+0,sp),a
2568  03bd 201d          	jra	L3511
2569  03bf               L7411:
2570                     ; 634       itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2572  03bf 7b01          	ld	a,(OFST+0,sp)
2573  03c1 a008          	sub	a,#8
2574  03c3 5f            	clrw	x
2575  03c4 97            	ld	xl,a
2576  03c5 a601          	ld	a,#1
2577  03c7 5d            	tnzw	x
2578  03c8 2704          	jreq	L051
2579  03ca               L251:
2580  03ca 48            	sll	a
2581  03cb 5a            	decw	x
2582  03cc 26fc          	jrne	L251
2583  03ce               L051:
2584  03ce c4540c        	and	a,21516
2585  03d1 6b01          	ld	(OFST+0,sp),a
2587  03d3 2007          	jra	L3511
2588  03d5               L5411:
2589                     ; 639     itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
2591  03d5 c65400        	ld	a,21504
2592  03d8 1403          	and	a,(OFST+2,sp)
2593  03da 6b01          	ld	(OFST+0,sp),a
2595  03dc               L3511:
2596                     ; 641   return ((ITStatus)itstatus);
2598  03dc 7b01          	ld	a,(OFST+0,sp)
2601  03de 5b03          	addw	sp,#3
2602  03e0 81            	ret
2645                     ; 662 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2645                     ; 663 {
2646                     	switch	.text
2647  03e1               _ADC1_ClearITPendingBit:
2649  03e1 89            	pushw	x
2650  03e2 88            	push	a
2651       00000001      OFST:	set	1
2654                     ; 664   uint8_t temp = 0;
2656                     ; 667   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2658                     ; 669   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2660  03e3 01            	rrwa	x,a
2661  03e4 a4f0          	and	a,#240
2662  03e6 5f            	clrw	x
2663  03e7 02            	rlwa	x,a
2664  03e8 a30010        	cpw	x,#16
2665  03eb 263a          	jrne	L5711
2666                     ; 672     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2668  03ed 7b03          	ld	a,(OFST+2,sp)
2669  03ef a40f          	and	a,#15
2670  03f1 6b01          	ld	(OFST+0,sp),a
2672                     ; 673     if (temp < 8)
2674  03f3 7b01          	ld	a,(OFST+0,sp)
2675  03f5 a108          	cp	a,#8
2676  03f7 2416          	jruge	L7711
2677                     ; 675       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2679  03f9 7b01          	ld	a,(OFST+0,sp)
2680  03fb 5f            	clrw	x
2681  03fc 97            	ld	xl,a
2682  03fd a601          	ld	a,#1
2683  03ff 5d            	tnzw	x
2684  0400 2704          	jreq	L651
2685  0402               L061:
2686  0402 48            	sll	a
2687  0403 5a            	decw	x
2688  0404 26fc          	jrne	L061
2689  0406               L651:
2690  0406 43            	cpl	a
2691  0407 c4540d        	and	a,21517
2692  040a c7540d        	ld	21517,a
2694  040d 2021          	jra	L3021
2695  040f               L7711:
2696                     ; 679       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2698  040f 7b01          	ld	a,(OFST+0,sp)
2699  0411 a008          	sub	a,#8
2700  0413 5f            	clrw	x
2701  0414 97            	ld	xl,a
2702  0415 a601          	ld	a,#1
2703  0417 5d            	tnzw	x
2704  0418 2704          	jreq	L261
2705  041a               L461:
2706  041a 48            	sll	a
2707  041b 5a            	decw	x
2708  041c 26fc          	jrne	L461
2709  041e               L261:
2710  041e 43            	cpl	a
2711  041f c4540c        	and	a,21516
2712  0422 c7540c        	ld	21516,a
2713  0425 2009          	jra	L3021
2714  0427               L5711:
2715                     ; 684     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
2717  0427 7b03          	ld	a,(OFST+2,sp)
2718  0429 43            	cpl	a
2719  042a c45400        	and	a,21504
2720  042d c75400        	ld	21504,a
2721  0430               L3021:
2722                     ; 686 }
2725  0430 5b03          	addw	sp,#3
2726  0432 81            	ret
2739                     	xdef	_ADC1_ClearITPendingBit
2740                     	xdef	_ADC1_GetITStatus
2741                     	xdef	_ADC1_ClearFlag
2742                     	xdef	_ADC1_GetFlagStatus
2743                     	xdef	_ADC1_GetAWDChannelStatus
2744                     	xdef	_ADC1_GetBufferValue
2745                     	xdef	_ADC1_SetLowThreshold
2746                     	xdef	_ADC1_SetHighThreshold
2747                     	xdef	_ADC1_GetConversionValue
2748                     	xdef	_ADC1_StartConversion
2749                     	xdef	_ADC1_AWDChannelConfig
2750                     	xdef	_ADC1_ExternalTriggerConfig
2751                     	xdef	_ADC1_ConversionConfig
2752                     	xdef	_ADC1_SchmittTriggerConfig
2753                     	xdef	_ADC1_PrescalerConfig
2754                     	xdef	_ADC1_ITConfig
2755                     	xdef	_ADC1_DataBufferCmd
2756                     	xdef	_ADC1_ScanModeCmd
2757                     	xdef	_ADC1_Cmd
2758                     	xdef	_ADC1_Init
2759                     	xdef	_ADC1_DeInit
2778                     	end
