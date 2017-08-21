-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: demo_da
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `act_evt_log`
--

DROP TABLE IF EXISTS `act_evt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) DEFAULT NULL,
  `TASK_ID_` varchar(64) DEFAULT NULL,
  `TIME_STAMP_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_ID_` varchar(255) DEFAULT NULL,
  `DATA_` text,
  `LOCK_OWNER_` varchar(255) DEFAULT NULL,
  `LOCK_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `IS_PROCESSED_` bit(1) DEFAULT b'0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_evt_log`
--

LOCK TABLES `act_evt_log` WRITE;
/*!40000 ALTER TABLE `act_evt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_bytearray`
--

DROP TABLE IF EXISTS `act_ge_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) DEFAULT NULL,
  `BYTES_` blob,
  `GENERATED_` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
INSERT INTO `act_ge_bytearray` VALUES ('257502',1,'BOOK_REPORT___userdynamic-model.bpmn','257501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"com.da\">\n  <process id=\"BOOK_REPORT___user\" name=\"BOOK_REPORT___user\" isExecutable=\"true\">\n    <startEvent id=\"start\"></startEvent>\n    <subProcess id=\"DYNAMIC_SUB_PROCESSTest_subprocess\" name=\"Dynamic Document SubprocessTest_subprocess\">\n      <startEvent id=\"dynamic_sub_process_start_eventTest_subprocess\" name=\"Start Dynamic SubProcessTest_subprocess\"></startEvent>\n      <endEvent id=\"dynamic_sub_process_end_eventTest_subprocess\" name=\"End Dynamic SubProcessTest_subprocess\"></endEvent>\n      <endEvent id=\"rejectedErrorEndEventTest_subprocess\" name=\"ErrorEndTest_subprocess\">\n        <errorEventDefinition errorRef=\"ERROR_DOC_REJECTEDTest_subprocess\"></errorEventDefinition>\n      </endEvent>\n      <sequenceFlow id=\"sequenceFlow-ea257e9f-d41b-482f-99c9-e397a1d50bde\" sourceRef=\"dynamic_sub_process_start_eventTest_subprocess\" targetRef=\"dynamic_sub_process_end_eventTest_subprocess\"></sequenceFlow>\n    </subProcess>\n    <sequenceFlow id=\"sequenceFlow-45caa81b-764d-4144-85c2-1bb4ed9351a6\" sourceRef=\"start\" targetRef=\"DYNAMIC_SUB_PROCESSTest_subprocess\"></sequenceFlow>\n    <boundaryEvent id=\"REJECTED_ERROR_BOUNDARY_EVENT\" name=\"Rejected Error Event\" attachedToRef=\"DYNAMIC_SUB_PROCESSTest_subprocess\">\n      <errorEventDefinition errorRef=\"ERROR_DOC_REJECTEDTest_subprocess\"></errorEventDefinition>\n    </boundaryEvent>\n    <sequenceFlow id=\"sequenceFlow-f6022e87-aa7e-40ec-88f5-ec958956384e\" name=\"Rejected\" sourceRef=\"REJECTED_ERROR_BOUNDARY_EVENT\" targetRef=\"start\"></sequenceFlow>\n    <endEvent id=\"end\"></endEvent>\n    <sequenceFlow id=\"sequenceFlow-632f626b-3b34-4c7b-a586-31674db75ec9\" sourceRef=\"DYNAMIC_SUB_PROCESSTest_subprocess\" targetRef=\"end\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_BOOK_REPORT___user\">\n    <bpmndi:BPMNPlane bpmnElement=\"BOOK_REPORT___user\" id=\"BPMNPlane_BOOK_REPORT___user\">\n      <bpmndi:BPMNShape bpmnElement=\"rejectedErrorEndEventTest_subprocess\" id=\"BPMNShape_rejectedErrorEndEventTest_subprocess\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"110.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"dynamic_sub_process_start_eventTest_subprocess\" id=\"BPMNShape_dynamic_sub_process_start_eventTest_subprocess\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"20.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"dynamic_sub_process_end_eventTest_subprocess\" id=\"BPMNShape_dynamic_sub_process_end_eventTest_subprocess\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"180.0\" y=\"20.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"DYNAMIC_SUB_PROCESSTest_subprocess\" id=\"BPMNShape_DYNAMIC_SUB_PROCESSTest_subprocess\" isExpanded=\"true\">\n        <omgdc:Bounds height=\"160.0\" width=\"150.0\" x=\"80.0\" y=\"0.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"0.0\" y=\"65.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"280.0\" y=\"65.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"REJECTED_ERROR_BOUNDARY_EVENT\" id=\"BPMNShape_REJECTED_ERROR_BOUNDARY_EVENT\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"185.0\" y=\"145.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-ea257e9f-d41b-482f-99c9-e397a1d50bde\" id=\"BPMNEdge_sequenceFlow-ea257e9f-d41b-482f-99c9-e397a1d50bde\">\n        <omgdi:waypoint x=\"130.0\" y=\"35.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"35.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"35.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"180.0\" y=\"35.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-632f626b-3b34-4c7b-a586-31674db75ec9\" id=\"BPMNEdge_sequenceFlow-632f626b-3b34-4c7b-a586-31674db75ec9\">\n        <omgdi:waypoint x=\"230.0\" y=\"80.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"280.0\" y=\"80.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-f6022e87-aa7e-40ec-88f5-ec958956384e\" id=\"BPMNEdge_sequenceFlow-f6022e87-aa7e-40ec-88f5-ec958956384e\">\n        <omgdi:waypoint x=\"200.0\" y=\"175.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"200.0\" y=\"185.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"15.0\" y=\"185.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"15.0\" y=\"120.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"15.0\" y=\"95.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-45caa81b-764d-4144-85c2-1bb4ed9351a6\" id=\"BPMNEdge_sequenceFlow-45caa81b-764d-4144-85c2-1bb4ed9351a6\">\n        <omgdi:waypoint x=\"30.0\" y=\"80.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"42.0\" y=\"80.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"42.0\" y=\"80.00000000000001\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"80.0\" y=\"80.00000000000001\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>','\0'),('257503',1,'BOOK_REPORT___userdynamic-model.BOOK_REPORT___user.png','257501','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0@\0\0\0\√\0\0\0Û\√\»h\0\0ãIDATx\⁄\ÌùylT◊Ω«ëJT™&j˚O©Q•QC\‘VMï4BOiE´ˆ\ÈEAzïÚx¡6\∆ÿ±¡¨¶v0\r˚jÉ°1´\Ÿ!,\∆`\∆\∆`∂â\√N\Ãjá\Õ5ª∆òÛ\Ó˜0gz\Ê˙é=\„Y<\À˜#]yñ;w\Ê^\œ˘\Ã\Ôlø”≠ÒòSßN˝WJJ\ \Â∑\ﬂ~ª≈∏+∏q\Î\Ãˆ\⁄kØ5˛Úóø\\m\‹~ô•äç¸ûı\È\”Gîññä¶¶&Aàª¥¥¥às\ÁŒâè?˛¯˘+Øºrâ$A¡ê!CÆB~Ñxãø˛ıØ˜åØ\÷Lñ.†⁄ã»èoQUUı\»¯j]f\È\"¡\0´Ω\ƒ\Î\’a[ª !Å/@Bº\rH(@B\n\Ï¶\rwx\ÂïW\ƒ»ë#eU\'\0\nô\€˚\“9xBqq±\Ë›ª∑\Âsgœû¸\„\≈˜øˇ}ÒÉ¸@|¡\‚‘©S^ø¶ 	+Çååy{\Ïÿ±¡ïı9∏*´∑\ﬁzK>w˛¸y9<∑˛ÛüSÄÑx*¿\Ê\Êf{ÅBd°\n\Z¿_\‹\Ô’´ó˝5ê\Ã¯CÒ”ü˛T¨Zµ\ Ω¸\ÍWø/ΩÙíxı\’W\≈˙ı\Î\ﬁ\Á\›wﬂï\œ!Rõ>}:∆ó\…h˚nﬁºπ\Õg∫s\Áé¯Ûüˇ,_Ûˆ\€oã”ßOª|\‡Ò\„\«\"99YFKxü!CÜ\ÿ;áú\€,˝æ;\ÁQ__/\‚\‚\‚\Ï\—Zﬂæ}\≈›ªwécæÜ\ÿWèh\Õ\‡8x¸\Í’´J\Œ\Ís\'&&\ c¸\Ówø≥<H\¬VÄ\Í>\nˆ÷≠[\Â\Ì…ì\'\À\«\'Nú(Ô£ê™\◊\ÏŸ≥G\\ºxQ\ﬁ˛\…O~\"˜É¸PM´≠≠ïèˇ\ËG?rxü›ªwã[∑n\Ÿ\Ô\Ô‹πSTWW;CˇL}Ùëº\r9\·\Ôo˚[ó\œ@~∏èÛ¡{\·6$\ÿﬁ±]â+\Á/\Ô#R´™™í∑?¸Cá\„X]\√ˆ¢µ˘Û\Á\À\Á \Õ\‘\‘T˚î´ü{ﬂæ}r\√mg\’l\nêÑΩ\0[[[1Jº˛˙\ÎÚÒ7\ﬁxCPaô_ÛΩ\Ô}OﬁÜ∆è/\ﬁˇ}\À\ËNa*\"\Í\Ã9\ËØ\«˘`\√m<\÷ﬁ±]˝l\›7Gs˙{∑w\r;™Æ¢\ÕrÖ±§\Ë\ÍÁ∂∫ °\0µ\Í#¢8Ä™\Ó/\\∏P˛=ztá\rUI\‹ﬁøó\–|™ ®|à√ü\ƒ˚zÚ\ŒPQv{RmOÄ∏6 °\0m˚™Í≠™ˆ¢Ω\në™±xU5WΩj†˜TÄ™öä®«ï*∞˘T5TØ£\Í\ÿﬁ±\—ß\Œ7//Ø\”\Ámo6P\◊=∏ΩNEvh´4\ÀS˝¿†ô°¢¢B\ﬁF«à´ü\Ìì\Í\«	\Á\ﬂﬁµ∑1HBRÄ\›lCHTîß@#>ûCgÅ+Ö~≈äRÇ			^ ™\‘\ËxÅàÛõ\ﬂ»Ç\Ô\Œ9†\rˇ¯L\ÿ ?\’	\‚\Ï\ÿË∏ÅÙ!\·Xù=èáJ´¥ˇ°„•£◊≠[∑N67†J¨:T¥\Èhˆa0xùU™Û∆ïœç6Qú/dè6K\nêÑµ\0ùÅ\»Ωòh(WÑPÄ$,àHQ™Wj(! 	B\nê\nêPÄ\ƒú8qBLõ6M:T0@DDDà˛˝˚\À\r˜SRRƒî)S\ƒ\·√á)@BMÄ7n\‹õ6m≥g\œ√Ü\rìΩ\»(ºÇ\¬;i\“$±|˘rq\Ì\⁄5\⁄\Œ∆ì\'O\‰XK\\#%;W6sü\Î\Í\Í(@B∫RÄ\È\È\Èbƒàr(LIIâ∏}˚∂}\»	˛b\\aYYôXªv≠>|∏™±zıÍ∞ñﬂé;DTTî[\‚3oëëë\"77ó$\ƒ\ﬂƒÑ˙3fà1c\∆Hπ={ˆ\Ã\Â◊ñóóãq\„\∆…ππïïïaı\·\«BØ\‚bCƒúôô)äää\‰ˆ\”@pÕ≤≤≤\‰¯B≥1\∆Q\ÌO\n\–\« \Í¯\‰ìO\‰Ñ~w\ƒg=\Z4(l¢AL\◊8p†Éºpqû>}\Í\“1pΩÛÛÛ\Â\ÎÙ„†ô¡óUb\nêPÄ«éì«•Kóºr<\ÃJ@aF˚`®G~f˘°I†≥ë\"C¥πö%\…RÄÑÙQ\‰˘©\‹v\ﬁ\«√¥µï+WÜ¨\0Q\Ì\’eÖ\Ë\Ÿ \Z\‘\€\’|g\nêPÄ^nÛC§\Ê≠\»\œ*åââ±úÛ\nzõü∑\‰ßKPó´/:F(@\÷Dä,o\\´mÇ°Vı\’#4T{}Å^FÔ∞∑\€)@∂D#=z{]m®˜ÙáRU\„¸Ù_ı÷¢MP\Ôô3gH(@oÄq~\Í\‚ê\Î.î¢@}ê3~H|â^F\‘\È\Õ\nêÑ•\01\√\r\Îûwq¬Ö-6\‰=<x`ª˚`zõ>\Œ\œ\◊4˛GÉ∂øß7ß\ÕQÄ$,à∂•\Ï\Ïlø\ ”ºº]ÖÛ6J2°3\—`nØ\⁄Éú˝f\„®˜\ƒ\‹a\nêPÄÄπΩò\ﬁ\ÊO9%%%Ö\0’Ü\»\À\"±Åz\ﬁ_\◊3FÙqÅ °\0=\0â\rjjj¸*,˙Éû\Ã`†*\"iÅz\‹_\◊c*\’{¢˝ë$††\ÌJ%6x?\‡`†\Í˜}=W\◊|\Ì\‘F\n\–√ÇàÇ	∂≠´ÆH(@àççı{\ÿ\ÿ\ÿ¥ Æñ\‚\ƒ}ˆ#@BÇPÄh\»˜w \ﬁ/\ÿ\⁄\0uÒ)\ÿHHêp\Í‘©~\Ô>r\‰H\–Ù£çCÖ¨≥òê  \∆\0˙{ \∆\0˙8@´à\œ\∆r !A,@¨\·ÅH∆ü3APuÙô Æ¿ô Ñπ\0AZZö\ﬂ\Ê#\·*áÜ\nà9òê \‡ñ-[\‰BF˛à!øP\ ≥l\Ÿ2øeÉAª)≥¡\n\–†\Z\Ï\Î|ÄhkÑ\0}ï÷Ω+`>@BB@Ähì√ädæ\ ˝\Õ7\ﬂ»Çä°ë\Ë’óõ\n\nòö_\n¨Y≥FV≥ºΩ&ñÅƒòµpZ\ƒ[íÇ¸∞î\0\◊!\ƒ\«T\√,∞Äë∑\"AD~ê\ﬂgü}&BT\Î!\'Û™pùùe\„lU8_µ1RÄÑ¥Åu|1Te◊Æ]uå \‚CµR\r A}p¥æ.∞´\◊˚!\Í\”;<∏.0!~†jD$òúú\Ïvª]aa°lODáG(∂˘u$AsuXç\Ã\ \ •••r⁄úä\‰\È°…°≤≤R˛PòDW\’^_\œ5¶\0	hANNé!d6o\ﬁ<QTT$n›∫eØ\⁄!±\n4\∆˜ah\"G\Ïã\¬JΩΩù\È\—{á;≥!zˆEáH(@7¡∫¡Û\ÁœóU1s¡FAEï\rÖ\ﬁ\"ÉU\„ÙÖì\\\Ÿp}q-}Y\Â•\0	H¸\"d\ÃF°ûEFeu¡\À\‰…ì\ÂÙ∂Æàú)@Bí∞Ö$ °\0	°\0	HH(@B(@BB\nê\nêPÄÑPÄÑ$Ñ$ ! °\0	°\0	HH(@B(@Bëëë\ÔÙ\Ô\ﬂjDD\ƒ&\„\Ô9c{lKN\—dªø\Õ\ÿ\“˚ı\Î◊´+Jxè\ \  §µk\◊~5k÷¨˙a√Üµ °§-s\∆Û\‰\‰\‰\Ê	&\\õ={ˆzc{ã$Ñ\Ï\√!=°\r5§w≈ùÙd\∆k\Œ\Z?\È€∑\Ô\À>\ﬂ_|±.==ΩYuëT≥§§D.™£p™∫X\»k.>¸˘»ë#´(@B(@+\È˝è±U{í†\÷\ÿn\Z[oü|@CtÒ3f\Ã¯˜ò1c§\‹\‹Yã¢ºº\\å7\ÓYRR\“y\√\“oRÄÑPÄ*\Í3§µ⁄ê\ﬂ3Ûôôô2\√9,Ûp\nñ0¿\“\"\Ã¡qΩUöª\ÔﬁΩª\0k!`anO\·¡\‚3\∆nÒhê•ïPÄ.–ªw\ÔÓÜ¨é[-RıÙ\ÈSóÆ|îüüoµV\À6è´ƒê\ﬂ—£GOa\—o-\√X]]ç€òêê0Ñ$$<hã¸éõó)\Ì\Ï\‚RVÀîBÇêlß?$\"?\»\œ\€q\„xF¯\ÿ{£)@B\¬OÄ®ˆ\Í≤B\Ì\“ \Z4≠âì\”\È6?Ñïﬁä¸¨\"¡òòò:CÇ=)@B\¬GÄ∂ègﬁñü.AS$\ÿ\€\›\‹c˙Ù\È\Õ\ﬁ˛`fˆ\Ì\€\◊h\ÿ˙HHxU_Ω∑\’^_`™\ﬂt´=p\ÁŒù\–\€\ÎjC§\'§§§‘ÜXUò•ïPÄN¿8?Ω\√\√W £M\–\‘1í\ÊrÙáq~\Í\‚***öC,\ndi%†Û\ÍØ}ê3z{}â©*¸≠K\"ò·ÅéOÜª∏K|||≠Ò_\\æ±}@\n∞s\Â\√6Ω\Õ>\Œ\œ\◊5L8l\‡¡˙åëéß\Õaz[vv∂_ˇπ.,w9D\Ì∫^+yÒè\Ó\‡B≤¥í∞†+\Âs{\’~\‰\Ï0[Mã\”;<\Ã\Ì\≈Ù6R\\\\åF\—=¡÷∂˝N~ÒXZI\ÿ\n∞ΩÚaKl ü˜óc0cD\ÿ\·â ±AMMç_ˇπµµµw\—Sdˇ`˚/û\È\Õ\“J(@ãÚa\À\‚\"˜óc0\ÊX˚<\Á]È¶∂\'6x?§π	\∆∞˛ãg˝YZ	hQ>å≠Y\›˜U\ÔØ∑®≠…•\È\n<\Ã0HX>:ﬁ∫\Í\⁄u(¿\ÿ\ÿ\ÿ\Á˛é\0kÉ8,5\"ø>Z;K+ahQ>¥§¶Å¶¶¶6˚ª\rŒù;É∞\r\–,>∂\n∞ùÚaK\\\Z\ÿmÄì&M∫\Ï\Ô^‡ººº\‹ \Í>Ò∑vU≤¥íp†\”ÚΩ¿s\Á\Œ\Õˆ˜8¿)S¶\ÏÇqÄ\Œ\">\nêPÄ.îcüâ?p\‚ƒâø:th´gÇ4EFF^\rÙô ú\nG(@\œËäô 			\œ›ö	Fç\Zu\≈_sÅç\Í\Ôz\„\√vXZ	\ÿN§\–sÅ¡†AÉ˙é=∫\≈Q`ùÒ´pÜ\Ÿ`	\Ze=¡_\Ÿ`íííZ\›\Œ£0^\\\È\Î|ÄhoDÙ\ÁQ\⁄j\nêPÄAÉ-˛∑ù\–™æéå|ï∫≤≤r∑Ò5\ÃMH¯\–\Êñ\ﬁ\∆÷¢ïõõ\Î\’kUPP\‡YFhEtttî	>Òˆö ∑n\›:nT}ØsMB\¬OÄ6	:¨	\‚-	B~111\œ<^Dèåº	\"ÚÉ¸˙ı\Î7Æ[h\¬\“J(¿∞\Õ\…1Ø\n\◊\ŸYh\ŒVÖÛ\ ˙¿Ü¨˙\—`˝Æ]ª\Z<\Ë©õ?>¨_clq\›BñVB∫(A}p¥æ.∞´û¡~à˙L\ﬁY\ÿ\‹&hDnáç7™=s\ÊL£;r>x\‡&C†\Ë˛.¡6?\nêPÄûEÇ´ı6A5N0++Kîññ\ is™∑ëö‰åö§\‰l¯\Ëπ\≈4ºØD~ND¯°ÒwgÕöUu¸¯Ò\Î∑oﬂÆQ°+`n\Ô°CáˆNù:uøQÖæÒ!\Í±\ﬁ^\nêPÄ\ﬁ\Ì˘\÷\√,37;\›\·—â∂¡◊åhnBM\€Wπæöld\∆ﬁÑ\–\nêPÄ>\"c[5Ó≤õ\‚É“ºZ\Â\ÌÑ¡!<&QH(@\ﬂ˙\‰=\ÃF°-ãLì`ùG\‡e<7\”€∫\‹9¯™èU\ﬂ)@B(¿∞¡\‡N=HN°™C\“\‚PÄÑPÄ\· ¿=V\Ÿ`√∏-ê•ïPÄ\·\Z˝i\À\·˝ç$Ñe\Óoßk˙Hv\—_ò∑≤¥\n0L\€˛⁄¥RÄÑPÄ\·\"E˛ì(@BRÄ ! HBRÄ ! H˙Ä\'Nài”¶â°Cáä`¶Ω3\n˜SRR∞\0Ω8|¯0mB\n0¯à$ë.\—\—\—n\ÂMÉ322D]]\ÕB\n0¯∏c\«\ÂIÚH\ÈıπHÜñ\Õ\ﬁ±§@\Ëõ7x≥ˆë0\◊’®o¯ëb¯Ç˝vë≈èú\—\ÊX\ÿ\Œ\\˙ŒûBººº\\¶èèèo#\¬\‘\‘T±hK©W,\Œ/m\ŸQöã§\0Éô\›7E\Œ\ÏΩﬂï{;\\üW%\Êl<\ÂV!hnn±üåüL]Â∞à\Ã”ßO≈ç\Ôâ%\€\À\⁄=ë\…\œœóØ\”%8|\—AØVâq~∑ú¶π(@\n0òô∏∂≤\Ê∂S,,˜≥ëG[gÌÆ©L\ﬂvÌ±∫ù2wüò±ˆÑå¿FfàùÖ/ñ≠{\‹$F.9\"fo<)\∆-ˇJLZy\\\‰ï|€∂j{\Ï≤ïyDå^zTc›ÅØ\Â\„\◊n\ﬁCg}!Ü-\»É\«-ññTã≈ÄΩ\≈W\≈—≥7^»≤\Âô\ÿ|¯ºH3é3eeë¯˙\€˚ˆ˝û™cå\Ë,-„êà:\ﬁ!jÑdù±lg˘ãÛ2\Œ\Áu\Â\ÊC˘9\’\Á\∆y+p~ìç˜\≈˛\ÀwWÿ£Bºˆ≥ú\◊gu\Óπ6\◊f¨qm¨ÆHRÄ˛Ø˛v∑™Z\‚π\ÀBLùu´\„˝∑~;j\\∂Xµ\Ôúhmm\'øπ#6\»=˘≠îŒÖ\Î˜\ÂsV\«Yª\ \Â~µü\»\„\Ã\€Ù¢jö˙è\rb`\Í$≠%M˙ß\»ﬁºøM!˘,ßƒê…ø_\È´Kbß!•\÷\÷\Á\‚n\›1uUë}?ˇ—ìfQÛ†A¸}iÅàI\"Ü¸c£Ω:\Ï|\∆;˜ƒπk˜\‰ym?z\—.Ωœø¨ô;\Œ\ \€Ú¸yU\\π\'.í\ƒmé_Q(\Ó˛\Îâ|N=Æ_D\≈V◊è§\0)@?\” \ƒ\ﬂ\'ÆØ∫mı‹äbëø\È≤\ÿjæ=b\…a\—\‘\‹\"ø¥ıÜdT!GÙ§\"û\√e7dtdÑ±\0\»\0ë:<PEçààîíöπÚ†¨\Ó\Í|gs\Ó¶ˇT©ˇûıïÉ\\”ñ˛ß=\Ó⁄ùâmG.\ 6B∞x˝aõ2\÷^v\÷1RtÓñòµ\·§¸L }M±<ò∂∫\»˛8\Œo\⁄\Í\‚6\◊\0Q\·°\“jyª••\’.}˝\⁄\‡1´\ÎGRÄ†üô≥˜~Ÿéb£\’sì\◊U\›RUc˝ˆ\≈2rA_π∑RV˜¿TCx™ ã®.\'\Ôk\À/˙Ñä¬äõva,π,{{á-< ¢\„ìE÷™M2Zz˛¸π\√\ÎQ‘°\”\◊\≈\Ó›ª_\ÁÛB˘ôAè74=ï\«\”\rëm⁄¥…°w\ÿ\‹!BCÙ¶\ƒı\ÈÚc\‚X˘MqÙ\Ãu˘ò˙\‹8øI\Ÿ\«\Â\ÌE[Oã¨+±GΩ8o\‹\Œ¯‚åò∑π¥Õµ¡>V◊è§\0)@?3zYa≥πööñU\‘(#Ωå£≠\∆˜Ú\«\Ê\€¸o¢ïqDÓãÇè(†=KE6™}\œ\·∏6A4Õ∂˝F\Zè/X∞\Ë\≈B\—C\'Q`ûX∂\„åC§ßòmDfØ›í†/\\∏ \Œ^˛NJë_¶!õ[w\À˝N_®??.\ÂóoDc®\"£çpmn•C\«»ú9séèH\’Q|VT”ï\‹\‘y\‚πf\Ì¸ñ\Ó<+üˇ\œcRöà\ngÆ/1>œãc†Ω\œ~û⁄µ˘Ú¯\À\ÎGRÄ`\–4z}ê3z{\€≥<∞ﬂ®Q£dooGò£HÙ´˜B\‘\Ÿ^áàª\Ã5™Ûh\Î# H∫¶∑)!\≈\≈\≈…°.\ÌÅY!j\n\⁄\r;¢®®®Mıx\ƒ\‚CF§ô/7w\∆\'v\"\\Fs H∫\Êˆ*fff∂ª/\⁄\’0FP\Ìè»±¶¶\∆\È˛bÕö5m_±bÖ˝ò;L(@Bvâ\0ë\ÿ@…®§§§\›}/]∫d^îJ§ßß[\Ó˚\·CëòòhyL\ÃQ\«@B\n∞Kà§JF\ÌEs`˚ˆ\Ì`\‘v\Ïÿ±6ë\"\";\Ï[__\ﬂ\Ê8ò6ßGëÑ$`óPô>\„√äIì&µ \Ó\Z4H<~¸ÿæ\ﬂ∆ç/<ß••Ysáıc\nêPÄ].@E}C≥Xº≠Lc˘™¸≈∏ª∫˙G\"i\‚2\Ÿq1l\ﬁ^áA\Õ	is\ƒ\»%á\‰–óK§Òÿ®å\√Ú1óq\Â}	H(@ø\nPè\ËTà\ÈdÆ?ê\"DØ-X∂Âòúåô\"1Éí\r	\ÓqHr9`†¯Ú¿1l~Æ˝±cE\'\ÂT8Hê H(¿†h\ƒ73à\ÊÙA’à\’\ÎbGà§	K\Â@j%T<∂Ò\‡\◊ˆ©pl§\0	Ω¿  ª\À[∫©\·˜ã\ËÅIrøÕõ7ã˘Û\ÁK\Ÿ\…\Ès\∆\„—±2\Í{˝\Ââ1\„ß:LÖc/0H(¿Ä\‡å3⁄åDBLo√¥2Ta\"•UÍºΩrs\∆ˆ2QqæZ\Œ\‰@ˆT{!øA£g\…\„\‡1§¡RS\·8ê$`@\n–ïô yyyÚ˘\ÿ\ÿXá°2´WØ∂É\ÌÙi\ÎD•ò>7x`˚~\\@â$`ó	@l\Ì\Õû;wÆ|\Ó»ë#èc\ËfÜX\rçq6§∆ósÅ	HRÄn≥l\Ÿ2ªîê≠Eó\"6DÜòl≈ó_~\ŸF~c«éu:˛/))\…i6B\n\–\ÔÑÙ\’ﬂê_QUU%;*\Z\Z\Z,_ã*Ûê!C\ÏQ ˛\Ê\‰\‰X\Ó\€Q>@B\n\–\Ô\»–¨Gr*c3z|!¡ˆ@\∆˝µgŒúi≥OAAÅ\ÂÒ	H(¿. 1bDI°ì§#êÛo¸¯Òˆ∞±±±ç¸bbbñ\»$ °\0JÄËêÄút	¢ßmwÅ\—\ÿ\"\‘\€¸ÙjØ\Z˜\◊—úcB\n\–\ÔT\‘G\Î\Îwîz¡Çb√Ü\rr?D}zááí\€˝(@B¨\0ï\Õ\’a5N0++Kîññ\ ÒÄ*íC§á\ÈmGè≥f\Õj≥ ∫™ˆ2Ú£\0	\‘;FÙ\ﬁ\·\Œl\Ë\ÌeáH(¿††\Z\"É1Ä˙\¬IÆl\'\∆˘±\ K\n0h®É\Ãœò;å6B=ãå\ \ÍÇ6æ…ì\'\À\Èmú\·A\n0§H(@BRÄÑ$ H(@BRÄ§ì\\ΩzUR‹æ}[∂©¢çI%0êú$ Rîïïâ\È”ßÀé£ı\Î◊∑y^ç≠ºq\„Ü˝±\Í\Íjôµª£\È HíÄf…í%n\À\”c™!ñ\'Ö)@\nê$AÉ∑f\¬`Z\"≤jw¥ê=HRÄ$ ÿ≥gè\Â˙\'---2Kv||ºx\ÔΩ˜Dè=îàDœû=EBBÇ|˚\È<zÙà Hí¿U]ÃÖFõû:8\ﬁ|ÛMÒ˚\ﬂˇﬁæ⁄û º\·a\Œ5ñ#\Ë’´ó\‹\œYáà∑\"K\nê§\0âWÅÙ\–—°wf@rò9Éoˇ˛˝r\Êæ\◊H@aµ(@¯\Î_ˇZ\Óß\Á[ƒ±:˝¯ HíÄC[taı\È\”G¸\Â/˜\Ó›ìèaÆµJªu\ÎVß\«¡\"Tx\ÌG}‰ê£rD«àßΩ\√ HüÇ\»ÚÉ\Ã@kk´lˇ\√\¬Tã-í\œ\Î\¬4É\Â>˛¯c)KÙ£\ LRÄ 	P-’£2¥\·°⁄´\"?5¥\ﬂi¨´Ç\Ã9ê\·¥i\”\‰2f>|(\Â¿iTáı6A¨\€RYYIRÄ \Èz0\√CUTõ:5–ëÅ6?ù\Ì€∑\ÀuT\Í\Î\Î\Ì\’Y´5ò)Båj_\Ïá\„ô{á)@\n0,\Ë\ :§káΩdgg;¥”ΩÛ\Œ;mˆC˙∞O?˝\‘~ë\√%E∞e\À)\∆1c\∆\ÿC\Ô∞Y®ù\≈iHoºÒ\∆cO\€{àoQ3=»°òûû\ﬁf¯\n2fc¯Àï+W\‰:*\‡\ÊÕõ2°\Ï“•K\Â}Tm’∫\ÀX§JÅ!2•^\Â\Ó\Ï\‹·≤≤≤\”\∆W\Î2\rC<={ˆ\\˛\·á∂P3ÅÀ∂m\€≤acêsaa°\√>\'OûîR√º\‡a√Ü\…E§\‘H\œ\·5h˜SπOù:e=~—¶®π\—#Dw¿W_}ı∞Ò’öI\√PÄ¡¿\ÀU¯\√\ÓQFù7€Åào\ËﬁΩ{õfã\œ?ˇ\\8PFãà∞°™\–v®¶\¬>ôôôÚy\’{¨\⁄ıˆ`Yd‹©ˆ\"Ú≥\…\Ô<æW,Z`\–H\–ÿ¶⁄æ∏Ç[`m\Ê%´é+D}j¸™Æ®Ú\‚˛É\‰Û\ÁŒùì\œ\À\Í3\“cYu\\\Ë\ÿ á;™Ωs)?\nêØQPP@cé\0ë\»@≠ßÇ1|\ÿ˜˛˝˚2Ç√ò@≠mNFÉx|\Ì⁄µ\Ê\ŒAÄFıπ\÷8^Ø>HHóíúú‹¨gk1∑\Ê\Â\ÂI˘\≈\∆\∆:duA$à™Æû\Ó\nc¸∞\Ô\È”ßhnºs\Á\ŒEcøsº˙ !]ä\’]-//w\⁄å\\´Ò~\ËAßV\ﬂ\”;T Es\“s/°Cáˆ\Z\«\‹∆´O“•Ãú9sù>$Eà\Í.:60\ÿ\nû={V\ﬁG\Z-}¨†≥qÄÜL\'Ù\Î◊ØØ>HHóíöö˙˛\ÊÕõõÙˆ:5\‰¸˘Û2CLCCÉ•\0!\»Q£Fâ¥¥4bLNNé\√>3A^?Êïß\0		!M‘••\Ê£3=º\ÌÅˆ=|◊ë ëA\œ\ncûlê\Œ+NH\ÏÅ_s6§≥\“\«Û9sÒ}\«l5@\ZRbô≤¡\‘\«=—ìWù$$`0$∂kxX\Â\‘gä8K®ÄŒè	&8\‰\ƒkı!5ã/\Œ2\ Ei\ÔﬁΩªÛäSÄÑ}˚ˆ}3>>æ±Ωå\–\Õ)ﬁ∞aÉCFh]~WÆ\\˘\¬x\Ïû%æ√´Mp\ƒ\ƒ\ƒÙ<xpìy7µ&zá1D\„\ÕkÇ`8Ãü˛Ù\'gkÇ\‰\'$$1\ DØ2HH¿_]]Ω\Õb>Æå\Ó0NÉ•1c§õmö\Z§áq~à-\Ê{#-ßØQÄÑÜ¥˙444\‹˜`˝é∫Eãe3\Í£\0		\÷*Ò‘§§§\⁄\‚\‚\‚&g´¿Y\–t\‡¿Å-\—\——•F(dõHH\–mlE±±±Æ]ª∂\…_êU	\—¯[{˝˙ıK\∆\ﬂ\∆›∏\‹\‹\‹_\ﬂ˝à¸\ÿ\€K*\"\Ï\◊C˚~ﬂ¥eâi1∂\ÀQQQØÒ*\nê;NøÑ\ﬂq\¬/!¸é~9\·wú\ÀAø\„Ñ_B¯\'¸r\¬\Ô8·óÉ~\«	øÑ;NÇ˚\À¡ç[®o,\ÈÑB!ÑB!ÑB!ÑB!ÑB!ÑBÜˇJ˙˙dBë2\0\0\0\0IENDÆB`Ç',''),('257506',1,'BOOK_REPORT___Admindynamic-model.bpmn','257505','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"com.da\">\n  <process id=\"BOOK_REPORT___Admin\" name=\"BOOK_REPORT___Admin\" isExecutable=\"true\">\n    <startEvent id=\"start\"></startEvent>\n    <subProcess id=\"DYNAMIC_SUB_PROCESSHalhj\" name=\"Dynamic Document SubprocessHalhj\">\n      <startEvent id=\"dynamic_sub_process_start_eventHalhj\" name=\"Start Dynamic SubProcessHalhj\"></startEvent>\n      <endEvent id=\"dynamic_sub_process_end_eventHalhj\" name=\"End Dynamic SubProcessHalhj\"></endEvent>\n      <endEvent id=\"rejectedErrorEndEventHalhj\" name=\"ErrorEndHalhj\">\n        <errorEventDefinition errorRef=\"ERROR_DOC_REJECTEDHalhj\"></errorEventDefinition>\n      </endEvent>\n      <sequenceFlow id=\"sequenceFlow-3aa19022-07b0-40a1-81fa-9629a6abe7eb\" sourceRef=\"dynamic_sub_process_start_eventHalhj\" targetRef=\"dynamic_sub_process_end_eventHalhj\"></sequenceFlow>\n    </subProcess>\n    <sequenceFlow id=\"sequenceFlow-e7da7b8b-fb91-436f-8a7a-c7673c75720b\" sourceRef=\"start\" targetRef=\"DYNAMIC_SUB_PROCESSHalhj\"></sequenceFlow>\n    <boundaryEvent id=\"REJECTED_ERROR_BOUNDARY_EVENT\" name=\"Rejected Error Event\" attachedToRef=\"DYNAMIC_SUB_PROCESSHalhj\">\n      <errorEventDefinition errorRef=\"ERROR_DOC_REJECTEDHalhj\"></errorEventDefinition>\n    </boundaryEvent>\n    <sequenceFlow id=\"sequenceFlow-a5c9ac5c-e60a-4d86-b8f2-94e6fd979340\" name=\"Rejected\" sourceRef=\"REJECTED_ERROR_BOUNDARY_EVENT\" targetRef=\"start\"></sequenceFlow>\n    <endEvent id=\"end\"></endEvent>\n    <sequenceFlow id=\"sequenceFlow-11a0bef7-fbe7-43ca-a8aa-bf39a4c36314\" sourceRef=\"DYNAMIC_SUB_PROCESSHalhj\" targetRef=\"end\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_BOOK_REPORT___Admin\">\n    <bpmndi:BPMNPlane bpmnElement=\"BOOK_REPORT___Admin\" id=\"BPMNPlane_BOOK_REPORT___Admin\">\n      <bpmndi:BPMNShape bpmnElement=\"rejectedErrorEndEventHalhj\" id=\"BPMNShape_rejectedErrorEndEventHalhj\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"110.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"dynamic_sub_process_end_eventHalhj\" id=\"BPMNShape_dynamic_sub_process_end_eventHalhj\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"180.0\" y=\"20.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"dynamic_sub_process_start_eventHalhj\" id=\"BPMNShape_dynamic_sub_process_start_eventHalhj\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"20.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"0.0\" y=\"65.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"DYNAMIC_SUB_PROCESSHalhj\" id=\"BPMNShape_DYNAMIC_SUB_PROCESSHalhj\" isExpanded=\"true\">\n        <omgdc:Bounds height=\"160.0\" width=\"150.0\" x=\"80.0\" y=\"0.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"280.0\" y=\"65.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"REJECTED_ERROR_BOUNDARY_EVENT\" id=\"BPMNShape_REJECTED_ERROR_BOUNDARY_EVENT\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"185.0\" y=\"145.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-3aa19022-07b0-40a1-81fa-9629a6abe7eb\" id=\"BPMNEdge_sequenceFlow-3aa19022-07b0-40a1-81fa-9629a6abe7eb\">\n        <omgdi:waypoint x=\"130.0\" y=\"35.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"35.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"35.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"180.0\" y=\"35.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-e7da7b8b-fb91-436f-8a7a-c7673c75720b\" id=\"BPMNEdge_sequenceFlow-e7da7b8b-fb91-436f-8a7a-c7673c75720b\">\n        <omgdi:waypoint x=\"30.0\" y=\"80.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"42.0\" y=\"80.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"42.0\" y=\"80.00000000000001\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"80.0\" y=\"80.00000000000001\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-11a0bef7-fbe7-43ca-a8aa-bf39a4c36314\" id=\"BPMNEdge_sequenceFlow-11a0bef7-fbe7-43ca-a8aa-bf39a4c36314\">\n        <omgdi:waypoint x=\"230.0\" y=\"80.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"280.0\" y=\"80.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-a5c9ac5c-e60a-4d86-b8f2-94e6fd979340\" id=\"BPMNEdge_sequenceFlow-a5c9ac5c-e60a-4d86-b8f2-94e6fd979340\">\n        <omgdi:waypoint x=\"200.0\" y=\"175.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"200.0\" y=\"185.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"15.0\" y=\"185.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"15.0\" y=\"120.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"15.0\" y=\"95.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>','\0'),('257507',1,'BOOK_REPORT___Admindynamic-model.BOOK_REPORT___Admin.png','257505','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0@\0\0\0\√\0\0\0Û\√\»h\0\0IDATx\⁄\ÌùyPTWæ«≠öLç©Ij\ﬁ¸3ï?RS©Ljbjfjí\ R÷´d ôö©z©¯\«T\ÂY\ PD Æ\‹≈â[\\â\ËÉàªâ\∆Q\\–® *\¬\√]É\¬h10àx\ﬁ˝˚Ù;}πΩ@/ÙÚ˝T›¢ó€∑ª/˜|˙w\Œ\Ô,Ø©®®¯˜\‘\‘\‘+ØºÚJóqWp\„÷ó\Ì˘\Áüoˇ\Ìoõo\‹~Ü•äÑå¸\r:TTVVäééAHo\È\Í\Íµµµ\‚˝˜\ﬂ¸\Ï≥\œ^¶IHêññv\rÚ#\ƒW¸\Ìoªg\\ZX∫H–Éj/\"?B|E]]\›}\„“∫\¬\“EBV{âœ´√∂vABÇ_ÄÑ¯\Z\nêPÄÑ$$8@\Î\Ó\Ï≥œäâ\' ™N≤^\ÔL\ﬂ¡\ \ \ ƒê!C,ü;{ˆ¨¯”ü˛$~ˆ≥üâßü~Zº˝ˆ€¢¢¢\¬\Á\Áî$%@∞r\ÂJy{ î)°ïÑÙwTV/ø¸≤|\Ó¬Ö≤{\nnˇ˙◊ø¶\0	ÒVÄùùùˆÖ\»B4Äø∏?x`˚k ôüˇ¸\Á\‚Wø˙ï¯¸Û\œ\Ì\—\À\Ô~˜;Ò”ü˛T<˜\‹sb\„∆ç\ÔÛ˙\ÎØ\À\Á©Õõ7˝\Àd4É}∑n\›\⁄\„3›πsG¸\Â/ëØy\ÂïWDUUï\«\ﬂ¥µµâîî-\·}\“\“\“\Ï\…!g\«6\ÀBøﬂõ\Ô\—\⁄\⁄*Féiè÷Ü\r&\ÓﬁΩ\ÎpÛ9ƒæzDk\«¡\„◊Æ]s+9´œùîî$èÒ\⁄kØYÉ$+@u{˚ˆ\ÌÚˆ\ÏŸ≥\Â\„3gŒî˜QH\’kˆ\Ï\Ÿ#.]∫$oˇÚóøî˚A~®¶555\…\«Òã_8º\œ\Ó›ª\≈\Ì€∑\Ì˜w\Ì\⁄%\Í\Î\Îé°¶˜\ﬁ{OﬁÜú˜è¸£\«\ﬂ@~∏è\ÔÉ˜\¬mH\–’±=â\'\ﬂ#!!A\ﬁG§VWW\'oø˚\Óª«±:áÆ¢µ•Kó\ \Á \ÕÙÙt˚îßü{\ÔﬁΩr\√mg\’l\nêDº\0ªªª1Jº\¬ÚÒ_|QPaô_Ûìü¸DﬁÜ¶Oü.\ﬁz\Î-\Àÿõ\¬\nTD‘óÔ†ø\ﬂn\„1W\«ˆÙ≥πªoé\ÊÙ˜vu\›UW\—\ÊπBÇ\ÿRÙÙs[ù\nêPÄZıQ@\’˜ó/_.ˇNû<\ŸmACU∑˜\Ì\€\◊/4Ue\‘>\ƒH\‚}Ωyg®(€ïT]	\ÁÜ$†m_UΩU\’^¥W!íB5è£™\Êi°W\rÙ\ﬁ\nPUSıxR6U\r’´¿®:∫:6\⁄\„\‘˜-..\ÓÛ˜àççµ7®ÛÅÆª◊©\»mïfy™43ú;wN\ﬁFb\ƒ\”œçˆIı\„Ñ\Ô\Ô\Í\‹[âò$a)¿∂.$*\ S†\œ!Y\‡I°_≥fçî`bb¢Oà*5/Ò˛Y{ÛêA\√?>6\»O%AúâHé\’\◊\Ô\—\‹\‹,¨0hˇC\‚\≈\›\Î6l\ÿ õP%V	m8öΩûG≤J%o<˘\‹h\≈˜Ö\Ï\—fIíà†3y ãâÜrï( Ñ$!@Dà2PΩR]Y°\0IDê\nêPÄÑPÄÑ$Å\‡\‰…ìb\Ó‹πb\Ïÿ±\‚É>QQQbƒàr\√˝\‘\‘T1g\Œq¯a\nêê`\‡Õõ7≈ñ-[ƒ¢Eãƒ∏q\„dÖ]BPxgÕö%VØ^-Æ_øN\€\Ÿ¯Ò\«e_Kú#%;O6cü[ZZ(@B˙SÄ˚˜\Ô\Ÿ\Ÿ\Ÿb¬Ñ	≤+Lyyπhhh∞w9¡_Ù+<}˙¥(((\„«èó]5ÚÛÛ#Z~;w\Ó111ΩüyãééEEE !Å \‘œü?_dffJπ=zÙ\»\„\◊VWWã©Sß ±π555ı\·\«BØ\‚bCƒúìì#JKK\Âˆ\”@p\ŒrsseˇB≥\—\«Q\ÌO\n\–\œ \Í¯\√\ÂÄ˛ﬁà\œ*z=zt\ƒDÉÆ7j\‘(y\·<\‚<<|¯–£c\‡|<xPæN?ö¸Y%¶\0	hp\Ï\ÿ1q\\æ|\Ÿ\'\«√®f¥Ü{\‰gñö˙\Zπ!2Dõ´YÇê,H(@?E~êüö\€\ŒW\‡x∂∂n›∫∞ ™Ω∫¨=˚DÉz[¢\Z\ÔL\n\–\«m~à\‘|˘YEÇqqqñc~\√!·°∑˘˘J~∫uπ˙#1Bíà ¶\»Úu¡µä0\—&nU_=BCµ\◊\Ë\’adá}\›Híà \Z\Èë\Ìı¥°\ﬁêß™0˙˘\È	ek\—&®\'F/^L\n\–†ü∫∫\ÃuNQ†\ﬁ\…?$˛DØ\n#\ÍÙeBÑ$)@å@√∫7\›]zxÒ\‚≈†\Ê=<p\‡Ä\À}0ºM\Ô\Á\Á\Ô\Zˇ£1c\∆\ÿ\ﬂ”ó\√\Ê(@ëD\€R^^^@\ÂÇa^æÆ\¬˘\Z%à–ôh0∂W\ÌáNŒÅ\0£q\‘{b\Ï0H(@/¿\ÿ^o$àúíììCBÄjC\‰eé1±Åz>P\Á#FÙ~Å °\0Ω\0466T.XÙô\ÃP†*b\“ıx†\Œ!˙T™˜D˚#H(@/@€ïö\ÿ P\‡˝PÄCQÄzD®\ﬂ˜˜X]ÛπSH(@/z0\n&‘∂˛:w °\0Ω >>>\‡`{{{\»FÄ8_Xä]PÙ\—å\0		A¢!?\–mÄxøPk\‘≈ß` !!.¿¨¨¨ÄgÅè92Y`¥ë¢´êUßcfÅ		q¢`†˚¢`∞˜¥ä¯\Ã`\¬Xˆ$$Ñà5<\…r$™é¡>\ƒ8Ñê \»\»\»\ÿX`L∏äâC\√DäLHp€∂mr!£@DÅê_8\Õ≥j’™Ä\ÕÉvS\ŒC(@?Äj∞ø\ÁD[#\ËØi\›˚\ŒHHmrXë\Ã_3Bü?^\‹pú\ZΩ˙s\∆Êíí\ŒMà?÷Ø_/´Yæ^\À@¢\œZ$≠	\‚+IA~XJÄkÇ\‚g™nX¿\»Wë \"?\»Ô£è>\·™ıêìyU∏æé≤q∂*úø\⁄)@B\⁄¿:æ\Ë™Ú\’W_yïAƒáj/§\Z	@Çz\Áh}]`O\œ#ˆC‘ß\'<∏.0!†jD$òíí\“\Îvª\„«è\ÀˆD$<¬±\Õœù\Õ\’a\’O077WTVV\ as*íC§á&áöö\Z˘Ca^]U{˝=÷ò$†ÖÖÖRÑê\Ÿ\«,JKK\≈\Ì€∑\ÌU;LlÄç˛}ËöÅ\»˚¢0áS∂∑/â=;‹ó\r—≥? °\0{	\÷\r^∫t©¨äô6\n*™l`8åe¨\Zß/ú\‰…ÜÛãs\È\œ*/H(@0!c\Ï0\⁄ıYd‘¨.¯aô={∂\ﬁ\÷ë3H(@±PÄÑ$ ! °\0	°\0	HH(@B(@BB\nê\nêPÄÑPÄÑ$Ñ$ ! °\0	°\0	HH(¿` ::˙\’#FdEEEm1˛\÷\Z[õmrä\€˝∆ñ=|¯¡˝Q\¬\÷\‘\‘$|ªp\·\¬\÷q\„\∆uaBI\€\ÃèSRR:gÃòq}—¢Eç\Ìe\nê\n\–ÜC\ZBkH\Ôjo¶\'3^s\÷¯˚\·∞a√ûÒª¯æ¸Ú\À\r\Ÿ\Ÿ\Ÿ]òUìjñóó\ÀEu\‘új],\‰ç5∆èˇx\‚ƒâıIIIâ !†ÜÙ˛\√\ÿÍΩô†\÷\ÿn\€ø|@Ct	Û\Á\œˇWff¶î[o÷¢®ÆÆSßN}îúú|¡∞ÙK !†ä˙i\ÂÚ{d^¢ \'\'G\Œpé\0ÀºDúÇ%∞¥ÉÖq\\_ï\Êßv\Ô\ﬁ]Çµ∞0∑7ã`Ò\„∑áy4\»\“J(@2d\»SÜ¨NX-Rı\·Cè\Œ|t\‡A´µZvx]%Ü¸é=ZÅE_|µc}}=>l{bbb\ZHHd\n\–˘ù0/S\⁄\◊≈•¨ñ)Ö!\Ÿ>HD~êüØ\‚\∆Òå(∞\Õ{c)@B\"OÄ®ˆ\Í≤B\Ì\“ \Z4≠âS\ÿ\Á6?Ñïæä¸¨\"¡∏∏∏CÇÉ(@B\"GÄ∂Ñ\«#_\ÀOó†)\“\€<pﬁºyùæ˛`fˆ\Ó\›\€n\ÿ˙$HHdU_=€ãjØ?0Uáoı™=p◊Æ]õê\Ìı¥!\“RSSõ¬¨*\Ã\“J(@\'†üüû◊ÇÚh4%F2<é˛\–\œ]]¡πs\Á:\√,\ndi%†ÛÍØΩì3≤Ω˛\ƒT˛Œ£ÑFx Ò\·Mwóﬁíêê\–d|¿Ç¸w\–\ÿﬁ¶\0	ÿ∑Úa\ﬁf\Ô\Á\Á\Ô\Z&6f\Ã}ƒà˚asﬁñóó\–\ÓÚ\ÂÀ´=Q˚/k%O\"˛\—nN$K+â8zR>0∂W\ÌáNŒÅ\0£’¥(0\€\Ì¡\ÿ^o$eeeh\›\nˇ`m\€\Á\‰è•ïD¨\0]ï\€\ƒÚ˘@9#FÙ~Ånø&6hll\Ë?∑©©\È.25!ˆ∂ˇ\‚ô˛\—,≠Ñ¥(∂Y\\\‰\„År˙kü\ÁÇ\'ij˚\ƒÅ\ÔáinBÒ¨ˇ\‚\ŸBñVBZîc\ÎT˜˝ï˝u\‚µuxÙE˙/gÅöç$,\Ó∑˛:wnˇ8\–`{{{SGÄïF\‰7TK±≥¥FÄ\ÂCõ\‘4x#¿ÙÙÙ\Œ@∑ﬁπs\ÁR∂ö\≈\«6@B∫(∂âKÉª\rp÷¨YWù....\n°,…®®®øª\ËT\…\“J\"YÄN\ÀGHdÅó,Yí\Ë~Äs\Ê\Ã\Ÿ˝\0ùE| °\0=(\∆>3Éæ\‡Ãô33v\Ï\ÿ\Ó\0éÈàééæ\Ï#A8éPÄ\ﬁ\—#A˜j$ò4i\“\’@ç6™øçw|@¯¿\“J(@ëbPè£Gè6yÚ\‰Æ\0DÅ-∆Ø\¬\ŒCHd\–(ÎâÅö\r&99πª◊≥¡(å\◊¯{>@¥7\"˙Ûj\⁄j\nêPÄ!Ém*¸\ÔÇz>@[®˙0Ú◊å\–555ªç˜h\‰å–ÑDé\0mnbl]JPEEE>=W%%%\ﬁ\Õ≠àççç1\"¡}Ω&\»\Ì€∑OU\ﬂ\\Ñê\»†MÇkÇ¯JÇê_\\\\\‹#Ø\◊Q\ƒ\ƒ\ƒ$`#_EÇà¸ ø\·√áOû∞¥\n\–\r∂ë!Ö\ÊU\·˙:\n\ÕŸ™p>Yÿê\’#\Zl˝Í´ØxëiY∫t)¨\ﬂhl#Ñ/,≠ÑÙPÇz\Áh}]`O=É˝ıôæY\ÿ\‹&hDnáç7j:s\ÊL{o\‰|\‡¿Å-Ü@ë˛>Üm~ °\0ΩãÛı6A\’O077WTVV\ as*[åHMrFMRvr6|Ù\ÿb^°O\"?\'\"¸Oà\–xÉª.¨;q\‚ƒçÜÜÜF∫bbå\Ì=t\Ë\–7YYY˚å*ÙuàQ_òe{)@B˙61Úùó≥\Ã\‹\Ís¬£mÉ\œ\—\‹Ñö∂Æ\Ê˙\Í∞}ê=\Ë{F#<(@B˙πãåm’∏+Ω¸ì\·\”*o\·ââÚ(@B˙\◊\'o`\Ï0\⁄m≥\»th\÷^\∆s0º≠ﬂùÉ°\ÍXıù$Ñå\Ó\“\Á£\0	°\0#)Tu\»\‡`Z\nê\n0∏\«j6\ÿndi%`§F\⁄rxß\0	°\0\√YÄ˚\\§¶ORÄÑPÄ˝Ex[ K+°\0#¥\ÌØG[ H)R\‰?â$ HBRÄ ! HBRÄ†8yÚ§ò;wÆ;v¨¯\‡É\–”ûå\¬˝\‘\‘T,@/>LõPÄÑ}bí\»\ÂÀóã\ÿ\ÿ\ÿ^Õõ!Æ\\πR¥¥¥\–, °\0COÄ;w\Ó111\ﬁL)¢££}æ\"°\0)@\n\–Œ≠¶˚b¬ß%õ∑QﬂÑ	Dl|¢\„q?9$rrrDii©hhh\Ë1Öxuuµúb<!!¡®GãÒ\Àˆ\ŸEò>aä\»¯\Ïà\√˚\\ºÒΩ\»Xu\‘\È\Á¿˛\ÿG›æ|´π\«˜vızBRÄ ¿ç\≈ubÒ\Ê\nüÇ\Œ\ŒN1j\‘()≠ÑÒsE\“ÙïˆEd>|\Ë\—1∞à\Ã\Ê]áD˙?\n\Ìƒ±“≤Ú™\ƒ˘Eµb≈é”ñ\«\Ë\ÓÓ∂ã\\øM(@\nê8\\∏≥÷ù\≈\Â\ﬂı∏†[\⁄:\ƒ\ƒOèàEõOâ)´èj∑øÛNJ©L\\Y\"v≤Èùª\Õb‹≤˝Rziˇ\ÿ,>\Ã˙\\¨\Ã\€fèÙg.ˇS\Ã\Õ/ñë\ŸQq¢\Ê∂|¸˛èùbŸ∂*1c\Ìq±Û\€\ÀbG\…˚2Ç8V¸á2Q…™\œ}¨˙ñ¯l\◊Y{î˘Òñ\ \'\Ôq\Èüb\Í\Ícˆ\€¯\ÏSçœç}¶≠yÚx÷∫R±ß\Ï\Z\ÕERÄë*@YUÅãN}\'2ç*\"™ë˙mDãüÔ≠ïØ=u˛éî;}±H[∞]ƒéJñ“ö¥\“˙∏+\Î≈í-¢≠˝°¯\÷ÿÆcW\Ïëh\’\≈&y{\√˛:)Jπˇ¡É≤˙lı9Ò@[Gß8dWΩ\«N„òê¥∫=i\Âq\Ó\Í=q˚\Óëıyô˝{wuu\”\\ ©<|˙¶òmDBV¨\⁄U-´ô\Ê\€GGgóº\›jDm\—!·ëò±D$L\Ã~≤ÄÙˆ\"±no≠\Âq78/N_z\"∫/çHOâÇ}Ù®\€.¿õˇº/o_∫\Ÿ,\‰vHé\‰\Ï5¢\»R)MÇC;ﬂÇç\ÂÚ5KIˇè˝ˆ⁄Ø\œ\…\€\Ÿ\Î\ÀƒÅäz˘Ωg\Zë&°\0)¿ ™åJfPETUc˝6à\»\—”∫ojåH´Tf{S\Ê¨3™©ô¢††@Fu•µ∑-è;\Ôøàk\rO\⁄ÚÚå\◊_±%\'Pµn¸·Å∏\—\‘*e¯¯Òc˘8éUV\€`ØcKöû#Ú˜>©˙65ˇ(jØ\ﬂìré\»\Í.ò≠}^˝ˆ\Â~+Æ\Z\Ô∑b{ï\”\ÔM(@\n0B8˘≥£=™ï*3äˆ=\ÈÈ∑ø>qUF\\\ÿ˜\ ≈íeü<\…\‘~¸çHIMìm~h\ﬂ3U\Á{˜\ÓâÒ+ä\≈˘Û‰±¶Ø9fè˙BÇkvüìUdéıømˇí\Ÿb$T^c\ÌÛ.ómí8ˆ¨º2\ÌTüWãRı\€\ÿ\’_|\«M˜i-\nêåÙ$à∑Ëùúë\ÌuFy\»ˆ¡Iìd∂\◊*\nT†=PΩ¢NïÒ\»Q\"í/Ñ§\0)@Ø¿6%§ë#G∫\Ì\ÍÇQ!j\⁄\r›Å>É\Ê.2c∆å±øgoá\Õ!rEõ!í:Ñ§\0)@Ø¿\ÿ^{b\"\'\«mÙ•˙bC\‰\ÿ\ÿ\ÿ\Ëtˇs\ÁŒâı\Î\◊˜x|Õö5ˆc`\Ï0°\0	\ÿ/\ƒ\ƒJF\Â\Â\Â.˜Ω|˘≤yQ*ëùùmπoss≥HJJ≤<&Få®c†_ °\0	\ÿ/ƒ§JFÆ¢9\≈_8\Ã\0£∂c«éıà\Ÿa\ﬂ\÷\÷\÷\«¡∞9=ä$ °\0˚EÄ∫\»\Ã#>\ÃÃö5´á\0qÙ\Ë—¢≠≠Õæ\ﬂ\ÊÕõ\Âsñ\«A6X?°\0	\ÿ\Ôt\‰h˝)	Æ^Ω˙IWò”ß\Ì˚\Â\Á\Á{˝æÑ$†\ﬂ®K\ÕUx\Í\‘)á)Æ∞ôExÙ\ËQá$IEE#@\nêPÄ°\ﬂ∏v\ÌZªÙ¨\"Aıò˛WØ≥\rê$`\»fÅı˝∂n\›*ñ.]\Í≤Júôô\ÈÙX\ÃSÄÑ\nŒü?\ﬂm?@DÜjüi”¶\…\Œ\Ãx\Ã\Ÿl\— \∆;É˝\0)@BÖ\0=	R\\\\,üèèèw®&#\…\·,\n¨™™≤|?oGÇ\nê$>Ω!6WcÅó,Y\"ü;r\‰à\√\„h\„C\“√™kå≥Ñä∑cÅ	Hü^¯´V≠≤K	≥µ\ËÚBƒÜ\»cÄ≠¯˙\ÎØ{\»o î)N≥ø\…\…\…ˆ}/^L\ÎPÄÑ\Ï_Bxz{û\ﬁ~WWW\'<∞|-™\Ãiii\Ÿ\ﬂ\¬\¬B\À}ı˘\0ëQÊíô °\0˚]Ä\0KWÍëúZ\ _H\–òÒE\Ìô3gz\ÏSRRby|B\n∞\ﬂ∞¶YRHí∏s˛Mü>\›∂∑∑˜ê_\\\\\‹ˇ/ëôûN\€PÄÑ.\"!9\ÈD¶mw\Ó∏xÒ¢\‹\"\‘\€¸ÙjØ\Í˜\Án\Ã1°\0	p*	ÍùûUb\Ÿaw3@/[∂Ll⁄¥IÓá®OOx(˘±›è$`\–\nPI\–\\V˝sssEee•\Ï®\"9DzﬁÜ±¿.¥Ø˚°oà,˘QÄÑz\Íâg£=<›ê\Ìe¬É$`\»	PuëA@}\·$O6à˝¸X\Â•\0	≤\‘¡\Ã\œ;å6B}5´\⁄¯fœû-á∑qÑH(¿∞ °\0	H\nêPÄ °\0	Hí>r\Ì\⁄5\Ÿ}H\—\–\– \€T\—∆äI%–ëú$ V`Ò®yÛ\Ê\…\ƒ\—∆ç{<Ø˙Vﬁºy\”˛X}}Ωúµ\€]át\nê§\0IPÛÈßüˆZfXòC\r±<)dHRÄ 	|5\√1´∂ªÖ\Ï)@\nê$A¡û={,\◊?\È\ÍÍí≥d\'$$à7\ﬁxC8PâH\Z4H$&&\ Á±ü\Œ˝˚˜RÄ 	~P\’\≈Xh¥\È\È ¡Ò\“K/â7\ﬂ|”æ⁄ûöy\¬√òk,G0x`πü≥ÑàØ\"K\nê§\0âOÅÙê\Ë–ìêF\Œ \¬€∑oü9É\Î\ZPX-J˛˛˜øó˚\ÈÛ-\‚Xxù~|\nê§\0I–ÄÆ-∫∞Ü*˛˙◊øä{˜\Ó\…\«0\÷ZMª}˚vß\«¡\"Tx\Ì{\ÔΩ\Á0G#\‰àƒà∑\Ÿa\nê§\0â_A\‰˘Af†ªª[∂ˇaa™+V\»\Áuaö¡r\Ôøˇæî•≤√®2SÄ HÇTKı®mx®ˆ™\»Oum¡5çuU0sd8w\Ó\\πÃÄô\Ê\Êfëîî$;N£:¨∑	b›ñöö\Z\nê§\0IˇÉË™¢\⁄Ùê\‘@\"m~:_|ÒÖ\\G•µµ\’^ùµZÉë\"ƒ®ˆ\≈~8û9;LRÄ!@O\÷\È ˝\€\Ì%//œ°ù\Ó\’W_\Ì±¶õ6mö˝>\"?<Ü\Ó/Jä`€∂mRåôôôˆ«ê6µØ\"m°\0)¿ê\‡\≈_lÛ∂Ωá¯5\“CÅ9≥≥≥{t_¡å\Ÿ\Ë˛rı\ÍUπé\n∏uÎñúPˆ≥\œ>ì˜QµU\Î.cë*∫\»@îzïªØcáOü>]e\\ZWh\n0\Ë4h\–\Íw\ﬂ}∑ãö	^v\Ï\ÿ\·06:9?~\‹aüSßNI©a\\∏q\„\‰\"R™ã§à\Á\Z¥˚©π+**\ÏØ«è \⁄ı.7zÑÿõ\0π\Áû;l\\Zh\n0x∆†\ÓùwﬁπgD-æl\"˛·©ßû\Í\—l±v\ÌZ1j\‘(-\"\¬√Ü™.@€°Zò\n˚\‰\‰\‰\»\ÁUˆXµ+\Í\Ì¡8>fë\ÈMµëüM~p]±hQÄ!#AcÀ≤]∏Ç[pm\Ê%´\ƒ¢>\’ˇUWTyqˇá~ê\œ\◊\÷\÷\ \Á\ \ \ dı\”cY%.tl\Â£7™ΩK(?\nêüQRRÚÉ\ﬁ\∆b\"µû\n˙a\ﬂ\Ôøˇ^Fp\Ë®µ\Õ\…hèò#8\Z\’\Á&\„x<˚ !˝JJJJß>[ãπ\r∞∏∏X\ />>\ﬁaVDÇ®\Í\Í\”]°èˆ≠™™r†π\rŒù;óå˝jyˆ)@B˙#™ªV]]\Ì4åÆU?$AêÙ¿\Í{zBR4Oz`\Œ:t\Ë\„ò;xˆ)@B˙ïl–ª§\Ë˝\0Q\›EbcÄ≠P\—\·Ÿ≥g\Â}L£•˜t\÷–ê\Èå\·√á\ÂŸß\0	\ÈW\“\”\”\ﬂ⁄∫uká\ﬁ^ßFÇ\\∏pA\ŒÛ\‡¡KBêì&M2\"Dò\¬\¬Bá},FÇ\‡Ω˛çgû$$(0Ñ4Sóñ\Zåd2ºÆ@˚ÆuLêÄøòAü\∆<\ÿ õgú$$ò8	_Ûl0ò\ŒJ\Ô\œ\Áå˝\≈ıé\—\"™É4\">Lâeö\r¶\≈8Ó°®®®A<\Î !AÉ!±ıX\√\√j>@}§à≥	ê¸ò1cÜ\√|Äx≠ﬁ•\ÊìO>\…5\ E\Âê!Cû\‚ß\0		\ZÜ\rˆRBBBª´°›ç)ﬁ¥iì√å–∫¸Æ^Ω˙•Ò\ÿ=#J|ïgõ$$Ëàãã>fÃòÛ*njMdá\—E˝\ÕkÇ†;Ãüˇ¸ggkÇLLLL3\ \ƒHûe\nêê†%&&&°ææ~á\≈x\\›°ü :Kc\ƒ\»\0\€05H˝¸%Zå˜∆¥0æF:\“\Z˙\‡¡É\ÔΩXø£e≈äyå˙(@BBµJúïúú\‹TVV\÷\·l8:ˆ\Ôﬂø-66∂\“(\«\Ÿ\ÊG≤DEE\≈\Z[i||¸◊Ø_ﬂà\…_0™¢Ò∑\È∆çóçøkåª#ãää~c\\˚\'˘1\€K.\"4r\‰»Å\⁄ı}\À6KLó±]âââyûgâPÄÑ\◊8!º8Øq¬ãÉ^\„Ñ!º\∆	/Bxç^Ñ\Z\'º8\·5Nxq\¬kú\‚ Ñ\◊8	ÌãÉ∑p\ﬂX\“	!ÑB!ÑB!ÑB!ÑB!ÑB!Ñ\rˇ.*ï\≈zP~r\0\0\0\0IENDÆB`Ç','');
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_property`
--

DROP TABLE IF EXISTS `act_ge_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) NOT NULL,
  `VALUE_` varchar(300) DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_property`
--

LOCK TABLES `act_ge_property` WRITE;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` VALUES ('next.dbid','260001',105),('schema.history','create(5.17.0.2)',1),('schema.version','5.18.0.0',1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_actinst`
--

DROP TABLE IF EXISTS `act_hi_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) NOT NULL,
  `PROC_DEF_ID_` varchar(64) NOT NULL,
  `PROC_INST_ID_` varchar(64) NOT NULL,
  `EXECUTION_ID_` varchar(64) NOT NULL,
  `ACT_ID_` varchar(255) NOT NULL,
  `TASK_ID_` varchar(64) DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) DEFAULT NULL,
  `ACT_NAME_` varchar(255) DEFAULT NULL,
  `ACT_TYPE_` varchar(255) NOT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `START_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `END_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_actinst`
--

LOCK TABLES `act_hi_actinst` WRITE;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_attachment`
--

DROP TABLE IF EXISTS `act_hi_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `TASK_ID_` varchar(64) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) DEFAULT NULL,
  `URL_` varchar(4000) DEFAULT NULL,
  `CONTENT_ID_` varchar(64) DEFAULT NULL,
  `TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_attachment`
--

LOCK TABLES `act_hi_attachment` WRITE;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_comment`
--

DROP TABLE IF EXISTS `act_hi_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) NOT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_ID_` varchar(255) DEFAULT NULL,
  `TASK_ID_` varchar(64) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) DEFAULT NULL,
  `ACTION_` varchar(255) DEFAULT NULL,
  `MESSAGE_` varchar(4000) DEFAULT NULL,
  `FULL_MSG_` text,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_comment`
--

LOCK TABLES `act_hi_comment` WRITE;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
INSERT INTO `act_hi_comment` VALUES ('190017','event','2017-08-12 11:15:47','santosh','190009',NULL,'AddUserLink','santosh_|_assignee',NULL),('190048','event','2017-08-12 11:15:52','santosh','190015',NULL,'AddUserLink','santosh_|_assignee',NULL),('195021','event','2017-08-12 14:59:28','santosh','195013',NULL,'AddUserLink','santosh_|_assignee',NULL),('195052','event','2017-08-12 14:59:29','santosh','195019',NULL,'AddUserLink','santosh_|_assignee',NULL),('195077','event','2017-08-12 15:01:24','arun','195045',NULL,'AddUserLink','arun_|_assignee',NULL),('195078','comment','2017-08-12 15:01:24','arun','195045','195005','AddComment','approved','approved'),('197535','event','2017-08-12 15:54:43','santosh','197527',NULL,'AddUserLink','santosh_|_assignee',NULL),('197566','event','2017-08-12 15:54:44','santosh','197533',NULL,'AddUserLink','santosh_|_assignee',NULL),('197591','event','2017-08-12 15:57:50','arun','197583',NULL,'AddUserLink','arun_|_assignee',NULL),('197592','comment','2017-08-12 15:57:50','arun','197583','197519','AddComment','APPROVED','APPROVED'),('197601','event','2017-08-12 16:03:38','gaurav','197597',NULL,'AddUserLink','gaurav_|_assignee',NULL),('197602','comment','2017-08-12 16:03:39','gaurav','197597','197519','AddComment','approved','approved'),('200002','event','2017-08-13 11:35:48','arun','197559',NULL,'AddUserLink','arun_|_assignee',NULL),('200003','comment','2017-08-13 11:35:48','arun','197559','197519','AddComment','tes','tes'),('200021','event','2017-08-13 11:36:11','arun','197564',NULL,'AddUserLink','arun_|_assignee',NULL),('200022','comment','2017-08-13 11:36:11','arun','197564','197519','AddComment','asd','asd'),('200040','event','2017-08-13 11:36:22','arun','197588',NULL,'AddUserLink','arun_|_assignee',NULL),('200041','comment','2017-08-13 11:36:22','arun','197588','197519','AddComment','sadsad','sadsad'),('200049','event','2017-08-13 11:36:30','arun','200018',NULL,'AddUserLink','arun_|_assignee',NULL),('200050','comment','2017-08-13 11:36:30','arun','200018','197519','AddComment','asdasd','asdasd'),('200058','event','2017-08-13 11:36:37','arun','200013',NULL,'AddUserLink','arun_|_assignee',NULL),('200059','comment','2017-08-13 11:36:37','arun','200013','197519','AddComment','asdasd','asdasd'),('200067','event','2017-08-13 11:36:42','arun','200037',NULL,'AddUserLink','arun_|_assignee',NULL),('200068','comment','2017-08-13 11:36:42','arun','200037','197519','AddComment','asdas','asdas'),('200076','event','2017-08-13 11:36:47','arun','200032',NULL,'AddUserLink','arun_|_assignee',NULL),('200077','comment','2017-08-13 11:36:47','arun','200032','197519','AddComment','asdsad','asdsad'),('202517','event','2017-08-13 12:02:50','santosh','202509',NULL,'AddUserLink','santosh_|_assignee',NULL),('202548','event','2017-08-13 12:02:51','santosh','202515',NULL,'AddUserLink','santosh_|_assignee',NULL),('202596','event','2017-08-13 12:33:02','santosh','202584',NULL,'AddUserLink','santosh_|_assignee',NULL),('202631','event','2017-08-13 12:33:03','santosh','202592',NULL,'AddUserLink','santosh_|_assignee',NULL),('202683','event','2017-08-13 12:36:50','santosh','202671',NULL,'AddUserLink','santosh_|_assignee',NULL),('202718','event','2017-08-13 12:36:51','santosh','202679',NULL,'AddUserLink','santosh_|_assignee',NULL),('222515','event','2017-08-14 08:16:30','santosh','222511',NULL,'AddUserLink','santosh_|_assignee',NULL),('222539','event','2017-08-14 08:17:37','arun','222534',NULL,'AddUserLink','arun_|_assignee',NULL),('222540','comment','2017-08-14 08:17:37','arun','222534','222505','AddComment','approved','approved'),('225015','event','2017-08-14 08:30:15','santosh','225011',NULL,'AddUserLink','santosh_|_assignee',NULL),('225055','event','2017-08-14 08:53:33','santosh','225052',NULL,'AddUserLink','santosh_|_assignee',NULL),('225078','event','2017-08-14 08:54:32','arun','225073',NULL,'AddUserLink','arun_|_assignee',NULL),('225079','comment','2017-08-14 08:54:32','arun','225073','225046','AddComment','Approved','Approved'),('225089','event','2017-08-14 08:55:39','gaurav','225084',NULL,'AddUserLink','gaurav_|_assignee',NULL),('225090','comment','2017-08-14 08:55:39','gaurav','225084','225046','AddComment','approved','approved'),('227510','event','2017-08-14 09:16:07','santosh','227507',NULL,'AddUserLink','santosh_|_assignee',NULL),('235010','event','2017-08-14 11:00:23','santosh','235007',NULL,'AddUserLink','santosh_|_assignee',NULL),('237502','event','2017-08-14 11:07:31','arun','235028',NULL,'AddUserLink','arun_|_assignee',NULL),('237503','comment','2017-08-14 11:07:31','arun','235028','235001','AddComment','Approved by Arun','Approved by Arun'),('237513','event','2017-08-14 11:08:16','gaurav','237508',NULL,'AddUserLink','gaurav_|_assignee',NULL),('237514','comment','2017-08-14 11:08:16','gaurav','237508','235001','AddComment','Reject by gaurav','Reject by gaurav'),('245010','event','2017-08-14 11:24:18','santosh','245007',NULL,'AddUserLink','santosh_|_assignee',NULL),('250010','event','2017-08-14 12:02:27','santosh','250007',NULL,'AddUserLink','santosh_|_assignee',NULL),('250033','event','2017-08-14 12:04:34','arun','250028',NULL,'AddUserLink','arun_|_assignee',NULL),('250034','comment','2017-08-14 12:04:34','arun','250028','250001','AddComment','Approved by Arun','Approved by Arun'),('250044','event','2017-08-14 12:05:04','arun','245028',NULL,'AddUserLink','arun_|_assignee',NULL),('250045','comment','2017-08-14 12:05:04','arun','245028','245001','AddComment','rejected','rejected'),('250050','event','2017-08-14 12:09:46','gaurav','250039',NULL,'AddUserLink','gaurav_|_assignee',NULL),('250051','comment','2017-08-14 12:09:46','gaurav','250039','250001','AddComment','completed','completed'),('250071','event','2017-08-14 12:19:48','santosh','250068',NULL,'AddUserLink','santosh_|_assignee',NULL),('250094','event','2017-08-14 12:20:35','arun','250089',NULL,'AddUserLink','arun_|_assignee',NULL),('250095','comment','2017-08-14 12:20:35','arun','250089','250062','AddComment','Approved','Approved'),('250105','event','2017-08-14 12:22:27','gaurav','250100',NULL,'AddUserLink','gaurav_|_assignee',NULL),('250106','comment','2017-08-14 12:22:27','gaurav','250100','250062','AddComment','approved','approved'),('250114','event','2017-08-14 12:29:23','arun','250111',NULL,'AddUserLink','arun_|_assignee',NULL),('250115','comment','2017-08-14 12:29:23','arun','250111','250062','AddComment','collaborated by arun','collaborated by arun');
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_detail`
--

DROP TABLE IF EXISTS `act_hi_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) NOT NULL,
  `TYPE_` varchar(255) NOT NULL,
  `TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `NAME_` varchar(255) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) DEFAULT NULL,
  `TASK_ID_` varchar(64) DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) DEFAULT NULL,
  `VAR_TYPE_` varchar(255) DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) DEFAULT NULL,
  `TEXT2_` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_detail`
--

LOCK TABLES `act_hi_detail` WRITE;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
INSERT INTO `act_hi_detail` VALUES ('190019','VariableUpdate','2017-08-12 11:15:47','taskOutcome','190001','190006','190009',NULL,'string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS',NULL),('190021','VariableUpdate','2017-08-12 11:15:47','processUserFormId','190001','190001',NULL,NULL,'integer',0,NULL,NULL,1,'1',NULL),('190023','VariableUpdate','2017-08-12 11:15:47','approved','190001','190001',NULL,NULL,'boolean',0,NULL,NULL,0,NULL,NULL),('190025','VariableUpdate','2017-08-12 11:15:47','workFlowId','190001','190001',NULL,NULL,'string',0,NULL,NULL,NULL,'22',NULL),('190027','VariableUpdate','2017-08-12 11:15:47','docType','190001','190001',NULL,NULL,'string',0,NULL,NULL,NULL,'JOURNAL',NULL),('190029','VariableUpdate','2017-08-12 11:15:47','initiator','190001','190001',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('190031','VariableUpdate','2017-08-12 11:15:47','businessKey','190001','190001',NULL,NULL,'string',0,NULL,NULL,NULL,'22',NULL),('190033','VariableUpdate','2017-08-12 11:15:47','docAuthor','190001','190001',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('190050','VariableUpdate','2017-08-12 11:15:52','taskOutcome','190001','190012','190015',NULL,'string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS',NULL),('190051','VariableUpdate','2017-08-12 11:15:53','processUserFormId','190001','190001',NULL,NULL,'integer',1,NULL,NULL,1,'1',NULL),('190052','VariableUpdate','2017-08-12 11:15:53','approved','190001','190001',NULL,NULL,'boolean',1,NULL,NULL,0,NULL,NULL),('190053','VariableUpdate','2017-08-12 11:15:53','workFlowId','190001','190001',NULL,NULL,'string',1,NULL,NULL,NULL,'22',NULL),('190054','VariableUpdate','2017-08-12 11:15:53','docType','190001','190001',NULL,NULL,'string',1,NULL,NULL,NULL,'JOURNAL',NULL),('190055','VariableUpdate','2017-08-12 11:15:53','initiator','190001','190001',NULL,NULL,'string',1,NULL,NULL,NULL,'santosh',NULL),('190056','VariableUpdate','2017-08-12 11:15:53','businessKey','190001','190001',NULL,NULL,'string',1,NULL,NULL,NULL,'22',NULL),('190057','VariableUpdate','2017-08-12 11:15:53','docAuthor','190001','190001',NULL,NULL,'string',1,NULL,NULL,NULL,'santosh',NULL),('195023','VariableUpdate','2017-08-12 14:59:28','taskOutcome','195005','195010','195013',NULL,'string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS',NULL),('195025','VariableUpdate','2017-08-12 14:59:28','processUserFormId','195005','195005',NULL,NULL,'integer',0,NULL,NULL,1,'1',NULL),('195027','VariableUpdate','2017-08-12 14:59:28','approved','195005','195005',NULL,NULL,'boolean',0,NULL,NULL,0,NULL,NULL),('195029','VariableUpdate','2017-08-12 14:59:28','workFlowId','195005','195005',NULL,NULL,'string',0,NULL,NULL,NULL,'24',NULL),('195031','VariableUpdate','2017-08-12 14:59:28','docType','195005','195005',NULL,NULL,'string',0,NULL,NULL,NULL,'JOURNAL',NULL),('195033','VariableUpdate','2017-08-12 14:59:28','initiator','195005','195005',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('195035','VariableUpdate','2017-08-12 14:59:28','businessKey','195005','195005',NULL,NULL,'string',0,NULL,NULL,NULL,'24',NULL),('195037','VariableUpdate','2017-08-12 14:59:28','docAuthor','195005','195005',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('195054','VariableUpdate','2017-08-12 14:59:29','taskOutcome','195005','195016','195019',NULL,'string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS',NULL),('195055','VariableUpdate','2017-08-12 14:59:29','processUserFormId','195005','195005',NULL,NULL,'integer',1,NULL,NULL,1,'1',NULL),('195056','VariableUpdate','2017-08-12 14:59:29','approved','195005','195005',NULL,NULL,'boolean',1,NULL,NULL,0,NULL,NULL),('195057','VariableUpdate','2017-08-12 14:59:29','workFlowId','195005','195005',NULL,NULL,'string',1,NULL,NULL,NULL,'24',NULL),('195058','VariableUpdate','2017-08-12 14:59:29','docType','195005','195005',NULL,NULL,'string',1,NULL,NULL,NULL,'JOURNAL',NULL),('195059','VariableUpdate','2017-08-12 14:59:29','initiator','195005','195005',NULL,NULL,'string',1,NULL,NULL,NULL,'santosh',NULL),('195060','VariableUpdate','2017-08-12 14:59:29','businessKey','195005','195005',NULL,NULL,'string',1,NULL,NULL,NULL,'24',NULL),('195061','VariableUpdate','2017-08-12 14:59:29','docAuthor','195005','195005',NULL,NULL,'string',1,NULL,NULL,NULL,'santosh',NULL),('195076','VariableUpdate','2017-08-12 15:01:24','approved','195005','195005',NULL,NULL,'boolean',1,NULL,NULL,1,NULL,NULL),('195080','VariableUpdate','2017-08-12 15:01:24','taskOutcome','195005','195042','195045',NULL,'string',0,NULL,NULL,NULL,'Approved',NULL),('197537','VariableUpdate','2017-08-12 15:54:43','taskOutcome','197519','197524','197527',NULL,'string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS',NULL),('197539','VariableUpdate','2017-08-12 15:54:43','processUserFormId','197519','197519',NULL,NULL,'integer',0,NULL,NULL,1,'1',NULL),('197541','VariableUpdate','2017-08-12 15:54:43','approved','197519','197519',NULL,NULL,'boolean',0,NULL,NULL,0,NULL,NULL),('197543','VariableUpdate','2017-08-12 15:54:43','workFlowId','197519','197519',NULL,NULL,'string',0,NULL,NULL,NULL,'25',NULL),('197545','VariableUpdate','2017-08-12 15:54:43','docType','197519','197519',NULL,NULL,'string',0,NULL,NULL,NULL,'JOURNAL',NULL),('197547','VariableUpdate','2017-08-12 15:54:43','initiator','197519','197519',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('197549','VariableUpdate','2017-08-12 15:54:43','businessKey','197519','197519',NULL,NULL,'string',0,NULL,NULL,NULL,'25',NULL),('197551','VariableUpdate','2017-08-12 15:54:43','docAuthor','197519','197519',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('197568','VariableUpdate','2017-08-12 15:54:44','taskOutcome','197519','197530','197533',NULL,'string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS',NULL),('197569','VariableUpdate','2017-08-12 15:54:44','processUserFormId','197519','197519',NULL,NULL,'integer',1,NULL,NULL,1,'1',NULL),('197570','VariableUpdate','2017-08-12 15:54:44','approved','197519','197519',NULL,NULL,'boolean',1,NULL,NULL,0,NULL,NULL),('197571','VariableUpdate','2017-08-12 15:54:44','workFlowId','197519','197519',NULL,NULL,'string',1,NULL,NULL,NULL,'25',NULL),('197572','VariableUpdate','2017-08-12 15:54:44','docType','197519','197519',NULL,NULL,'string',1,NULL,NULL,NULL,'JOURNAL',NULL),('197573','VariableUpdate','2017-08-12 15:54:44','initiator','197519','197519',NULL,NULL,'string',1,NULL,NULL,NULL,'santosh',NULL),('197574','VariableUpdate','2017-08-12 15:54:44','businessKey','197519','197519',NULL,NULL,'string',1,NULL,NULL,NULL,'25',NULL),('197575','VariableUpdate','2017-08-12 15:54:44','docAuthor','197519','197519',NULL,NULL,'string',1,NULL,NULL,NULL,'santosh',NULL),('197590','VariableUpdate','2017-08-12 15:57:50','approved','197519','197519',NULL,NULL,'boolean',1,NULL,NULL,1,NULL,NULL),('197594','VariableUpdate','2017-08-12 15:57:50','taskOutcome','197519','197580','197583',NULL,'string',0,NULL,NULL,NULL,'Approved',NULL),('197600','VariableUpdate','2017-08-12 16:03:38','approved','197519','197519',NULL,NULL,'boolean',2,NULL,NULL,1,NULL,NULL),('197604','VariableUpdate','2017-08-12 16:03:39','taskOutcome','197519','197580','197597',NULL,'string',0,NULL,NULL,NULL,'Approved',NULL),('200001','VariableUpdate','2017-08-13 11:35:48','approved','197519','197519',NULL,NULL,'boolean',2,NULL,NULL,0,NULL,NULL),('200005','VariableUpdate','2017-08-13 11:35:48','taskOutcome','197519','197556','197559',NULL,'string',0,NULL,NULL,NULL,'Rejected',NULL),('200020','VariableUpdate','2017-08-13 11:36:11','approved','197519','197519',NULL,NULL,'boolean',3,NULL,NULL,0,NULL,NULL),('200024','VariableUpdate','2017-08-13 11:36:11','taskOutcome','197519','197561','197564',NULL,'string',0,NULL,NULL,NULL,'Rejected',NULL),('200039','VariableUpdate','2017-08-13 11:36:22','approved','197519','197519',NULL,NULL,'boolean',3,NULL,NULL,1,NULL,NULL),('200043','VariableUpdate','2017-08-13 11:36:22','taskOutcome','197519','197585','197588',NULL,'string',0,NULL,NULL,NULL,'Approved',NULL),('200048','VariableUpdate','2017-08-13 11:36:30','approved','197519','197519',NULL,NULL,'boolean',4,NULL,NULL,1,NULL,NULL),('200052','VariableUpdate','2017-08-13 11:36:30','taskOutcome','197519','200015','200018',NULL,'string',0,NULL,NULL,NULL,'Approved',NULL),('200057','VariableUpdate','2017-08-13 11:36:37','approved','197519','197519',NULL,NULL,'boolean',4,NULL,NULL,1,NULL,NULL),('200061','VariableUpdate','2017-08-13 11:36:37','taskOutcome','197519','200010','200013',NULL,'string',0,NULL,NULL,NULL,'Approved',NULL),('200066','VariableUpdate','2017-08-13 11:36:41','approved','197519','197519',NULL,NULL,'boolean',4,NULL,NULL,1,NULL,NULL),('200070','VariableUpdate','2017-08-13 11:36:42','taskOutcome','197519','200034','200037',NULL,'string',0,NULL,NULL,NULL,'Approved',NULL),('200075','VariableUpdate','2017-08-13 11:36:46','approved','197519','197519',NULL,NULL,'boolean',4,NULL,NULL,1,NULL,NULL),('200079','VariableUpdate','2017-08-13 11:36:47','taskOutcome','197519','200029','200032',NULL,'string',0,NULL,NULL,NULL,'Approved',NULL),('202519','VariableUpdate','2017-08-13 12:02:50','taskOutcome','202501','202506','202509',NULL,'string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS',NULL),('202521','VariableUpdate','2017-08-13 12:02:50','processUserFormId','202501','202501',NULL,NULL,'integer',0,NULL,NULL,1,'1',NULL),('202523','VariableUpdate','2017-08-13 12:02:50','approved','202501','202501',NULL,NULL,'boolean',0,NULL,NULL,0,NULL,NULL),('202525','VariableUpdate','2017-08-13 12:02:50','workFlowId','202501','202501',NULL,NULL,'string',0,NULL,NULL,NULL,'26',NULL),('202527','VariableUpdate','2017-08-13 12:02:50','docType','202501','202501',NULL,NULL,'string',0,NULL,NULL,NULL,'JOURNAL',NULL),('202529','VariableUpdate','2017-08-13 12:02:50','initiator','202501','202501',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('202531','VariableUpdate','2017-08-13 12:02:50','businessKey','202501','202501',NULL,NULL,'string',0,NULL,NULL,NULL,'26',NULL),('202533','VariableUpdate','2017-08-13 12:02:50','docAuthor','202501','202501',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('202550','VariableUpdate','2017-08-13 12:02:51','taskOutcome','202501','202512','202515',NULL,'string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS',NULL),('202551','VariableUpdate','2017-08-13 12:02:51','processUserFormId','202501','202501',NULL,NULL,'integer',1,NULL,NULL,1,'1',NULL),('202552','VariableUpdate','2017-08-13 12:02:51','approved','202501','202501',NULL,NULL,'boolean',1,NULL,NULL,0,NULL,NULL),('202553','VariableUpdate','2017-08-13 12:02:51','workFlowId','202501','202501',NULL,NULL,'string',1,NULL,NULL,NULL,'26',NULL),('202554','VariableUpdate','2017-08-13 12:02:51','docType','202501','202501',NULL,NULL,'string',1,NULL,NULL,NULL,'JOURNAL',NULL),('202555','VariableUpdate','2017-08-13 12:02:51','initiator','202501','202501',NULL,NULL,'string',1,NULL,NULL,NULL,'santosh',NULL),('202556','VariableUpdate','2017-08-13 12:02:51','businessKey','202501','202501',NULL,NULL,'string',1,NULL,NULL,NULL,'26',NULL),('202557','VariableUpdate','2017-08-13 12:02:51','docAuthor','202501','202501',NULL,NULL,'string',1,NULL,NULL,NULL,'santosh',NULL),('202598','VariableUpdate','2017-08-13 12:33:02','taskOutcome','202576','202581','202584',NULL,'string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS',NULL),('202600','VariableUpdate','2017-08-13 12:33:02','processUserFormId','202576','202576',NULL,NULL,'integer',0,NULL,NULL,1,'1',NULL),('202602','VariableUpdate','2017-08-13 12:33:02','approved','202576','202576',NULL,NULL,'boolean',0,NULL,NULL,0,NULL,NULL),('202604','VariableUpdate','2017-08-13 12:33:02','workFlowId','202576','202576',NULL,NULL,'string',0,NULL,NULL,NULL,'27',NULL),('202606','VariableUpdate','2017-08-13 12:33:02','docType','202576','202576',NULL,NULL,'string',0,NULL,NULL,NULL,'JOURNAL',NULL),('202608','VariableUpdate','2017-08-13 12:33:02','initiator','202576','202576',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('202610','VariableUpdate','2017-08-13 12:33:02','businessKey','202576','202576',NULL,NULL,'string',0,NULL,NULL,NULL,'27',NULL),('202612','VariableUpdate','2017-08-13 12:33:02','docAuthor','202576','202576',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('202633','VariableUpdate','2017-08-13 12:33:03','taskOutcome','202576','202589','202592',NULL,'string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS',NULL),('202634','VariableUpdate','2017-08-13 12:33:03','processUserFormId','202576','202576',NULL,NULL,'integer',1,NULL,NULL,1,'1',NULL),('202635','VariableUpdate','2017-08-13 12:33:03','approved','202576','202576',NULL,NULL,'boolean',1,NULL,NULL,0,NULL,NULL),('202636','VariableUpdate','2017-08-13 12:33:03','workFlowId','202576','202576',NULL,NULL,'string',1,NULL,NULL,NULL,'27',NULL),('202637','VariableUpdate','2017-08-13 12:33:03','docType','202576','202576',NULL,NULL,'string',1,NULL,NULL,NULL,'JOURNAL',NULL),('202638','VariableUpdate','2017-08-13 12:33:03','initiator','202576','202576',NULL,NULL,'string',1,NULL,NULL,NULL,'santosh',NULL),('202639','VariableUpdate','2017-08-13 12:33:03','businessKey','202576','202576',NULL,NULL,'string',1,NULL,NULL,NULL,'27',NULL),('202640','VariableUpdate','2017-08-13 12:33:03','docAuthor','202576','202576',NULL,NULL,'string',1,NULL,NULL,NULL,'santosh',NULL),('202685','VariableUpdate','2017-08-13 12:36:50','taskOutcome','202663','202668','202671',NULL,'string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS',NULL),('202687','VariableUpdate','2017-08-13 12:36:50','processUserFormId','202663','202663',NULL,NULL,'integer',0,NULL,NULL,1,'1',NULL),('202689','VariableUpdate','2017-08-13 12:36:50','approved','202663','202663',NULL,NULL,'boolean',0,NULL,NULL,0,NULL,NULL),('202691','VariableUpdate','2017-08-13 12:36:50','workFlowId','202663','202663',NULL,NULL,'string',0,NULL,NULL,NULL,'28',NULL),('202693','VariableUpdate','2017-08-13 12:36:50','docType','202663','202663',NULL,NULL,'string',0,NULL,NULL,NULL,'JOURNAL',NULL),('202695','VariableUpdate','2017-08-13 12:36:50','initiator','202663','202663',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('202697','VariableUpdate','2017-08-13 12:36:50','businessKey','202663','202663',NULL,NULL,'string',0,NULL,NULL,NULL,'28',NULL),('202699','VariableUpdate','2017-08-13 12:36:50','docAuthor','202663','202663',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('202720','VariableUpdate','2017-08-13 12:36:51','taskOutcome','202663','202676','202679',NULL,'string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS',NULL),('202721','VariableUpdate','2017-08-13 12:36:51','processUserFormId','202663','202663',NULL,NULL,'integer',1,NULL,NULL,1,'1',NULL),('202722','VariableUpdate','2017-08-13 12:36:51','approved','202663','202663',NULL,NULL,'boolean',1,NULL,NULL,0,NULL,NULL),('202723','VariableUpdate','2017-08-13 12:36:51','workFlowId','202663','202663',NULL,NULL,'string',1,NULL,NULL,NULL,'28',NULL),('202724','VariableUpdate','2017-08-13 12:36:51','docType','202663','202663',NULL,NULL,'string',1,NULL,NULL,NULL,'JOURNAL',NULL),('202725','VariableUpdate','2017-08-13 12:36:51','initiator','202663','202663',NULL,NULL,'string',1,NULL,NULL,NULL,'santosh',NULL),('202726','VariableUpdate','2017-08-13 12:36:51','businessKey','202663','202663',NULL,NULL,'string',1,NULL,NULL,NULL,'28',NULL),('202727','VariableUpdate','2017-08-13 12:36:51','docAuthor','202663','202663',NULL,NULL,'string',1,NULL,NULL,NULL,'santosh',NULL),('222517','VariableUpdate','2017-08-14 08:16:30','taskOutcome','222505','222508','222511',NULL,'string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESSJournal_Subprocess',NULL),('222519','VariableUpdate','2017-08-14 08:16:32','processUserFormId','222505','222505',NULL,NULL,'integer',0,NULL,NULL,1,'1',NULL),('222521','VariableUpdate','2017-08-14 08:16:32','approved','222505','222505',NULL,NULL,'boolean',0,NULL,NULL,1,NULL,NULL),('222523','VariableUpdate','2017-08-14 08:16:32','workFlowId','222505','222505',NULL,NULL,'string',0,NULL,NULL,NULL,'037d8d7e-accc-43f7-86df-e5338e5acc7e',NULL),('222525','VariableUpdate','2017-08-14 08:16:32','docType','222505','222505',NULL,NULL,'string',0,NULL,NULL,NULL,'JOURNAL',NULL),('222527','VariableUpdate','2017-08-14 08:16:32','initiator','222505','222505',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('222529','VariableUpdate','2017-08-14 08:16:32','businessKey','222505','222505',NULL,NULL,'string',0,NULL,NULL,NULL,'037d8d7e-accc-43f7-86df-e5338e5acc7e',NULL),('222531','VariableUpdate','2017-08-14 08:16:32','docAuthor','222505','222505',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('222538','VariableUpdate','2017-08-14 08:17:36','approved','222505','222505',NULL,NULL,'boolean',1,NULL,NULL,1,NULL,NULL),('222542','VariableUpdate','2017-08-14 08:17:37','taskOutcome','222505','222508','222534',NULL,'string',0,NULL,NULL,NULL,'Approved',NULL),('225017','VariableUpdate','2017-08-14 08:30:15','taskOutcome','225005','225008','225011',NULL,'string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESSJournal_Subprocess',NULL),('225019','VariableUpdate','2017-08-14 08:30:15','processUserFormId','225005','225005',NULL,NULL,'integer',0,NULL,NULL,1,'1',NULL),('225021','VariableUpdate','2017-08-14 08:30:15','approved','225005','225005',NULL,NULL,'boolean',0,NULL,NULL,1,NULL,NULL),('225023','VariableUpdate','2017-08-14 08:30:15','workFlowId','225005','225005',NULL,NULL,'string',0,NULL,NULL,NULL,'d4e023e4-050c-46a9-b6d3-c4554afa2438',NULL),('225025','VariableUpdate','2017-08-14 08:30:15','docType','225005','225005',NULL,NULL,'string',0,NULL,NULL,NULL,'JOURNAL',NULL),('225027','VariableUpdate','2017-08-14 08:30:15','initiator','225005','225005',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('225029','VariableUpdate','2017-08-14 08:30:15','businessKey','225005','225005',NULL,NULL,'string',0,NULL,NULL,NULL,'d4e023e4-050c-46a9-b6d3-c4554afa2438',NULL),('225031','VariableUpdate','2017-08-14 08:30:15','docAuthor','225005','225005',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('225057','VariableUpdate','2017-08-14 08:53:34','taskOutcome','225046','225049','225052',NULL,'string',0,NULL,NULL,NULL,'TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_2',NULL),('225059','VariableUpdate','2017-08-14 08:53:34','processUserFormId','225046','225046',NULL,NULL,'integer',0,NULL,NULL,1,'1',NULL),('225061','VariableUpdate','2017-08-14 08:53:34','approved','225046','225046',NULL,NULL,'boolean',0,NULL,NULL,1,NULL,NULL),('225063','VariableUpdate','2017-08-14 08:53:34','workFlowId','225046','225046',NULL,NULL,'string',0,NULL,NULL,NULL,'7cb893a1-e72a-40de-9a5c-083c373a9305',NULL),('225065','VariableUpdate','2017-08-14 08:53:34','docType','225046','225046',NULL,NULL,'string',0,NULL,NULL,NULL,'JOURNAL',NULL),('225067','VariableUpdate','2017-08-14 08:53:34','initiator','225046','225046',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('225069','VariableUpdate','2017-08-14 08:53:34','businessKey','225046','225046',NULL,NULL,'string',0,NULL,NULL,NULL,'7cb893a1-e72a-40de-9a5c-083c373a9305',NULL),('225071','VariableUpdate','2017-08-14 08:53:34','docAuthor','225046','225046',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('225077','VariableUpdate','2017-08-14 08:54:32','approved','225046','225046',NULL,NULL,'boolean',1,NULL,NULL,1,NULL,NULL),('225081','VariableUpdate','2017-08-14 08:54:32','taskOutcome','225046','225049','225073',NULL,'string',0,NULL,NULL,NULL,'Approved',NULL),('225088','VariableUpdate','2017-08-14 08:55:39','approved','225046','225046',NULL,NULL,'boolean',1,NULL,NULL,1,NULL,NULL),('225092','VariableUpdate','2017-08-14 08:55:39','taskOutcome','225046','225049','225084',NULL,'string',0,NULL,NULL,NULL,'Approved',NULL),('227512','VariableUpdate','2017-08-14 09:16:07','taskOutcome','227501','227504','227507',NULL,'string',0,NULL,NULL,NULL,'TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_2',NULL),('227514','VariableUpdate','2017-08-14 09:16:14','processUserFormId','227501','227501',NULL,NULL,'integer',0,NULL,NULL,1,'1',NULL),('227516','VariableUpdate','2017-08-14 09:16:14','approved','227501','227501',NULL,NULL,'boolean',0,NULL,NULL,1,NULL,NULL),('227518','VariableUpdate','2017-08-14 09:16:14','workFlowId','227501','227501',NULL,NULL,'string',0,NULL,NULL,NULL,'c74e35b3-0374-4176-9f9c-2364ce2cafe1',NULL),('227520','VariableUpdate','2017-08-14 09:16:14','docType','227501','227501',NULL,NULL,'string',0,NULL,NULL,NULL,'JOURNAL',NULL),('227522','VariableUpdate','2017-08-14 09:16:14','initiator','227501','227501',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('227524','VariableUpdate','2017-08-14 09:16:14','businessKey','227501','227501',NULL,NULL,'string',0,NULL,NULL,NULL,'c74e35b3-0374-4176-9f9c-2364ce2cafe1',NULL),('227526','VariableUpdate','2017-08-14 09:16:14','docAuthor','227501','227501',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('235012','VariableUpdate','2017-08-14 11:00:23','taskOutcome','235001','235004','235007',NULL,'string',0,NULL,NULL,NULL,'TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_2',NULL),('235014','VariableUpdate','2017-08-14 11:00:23','processUserFormId','235001','235001',NULL,NULL,'integer',0,NULL,NULL,1,'1',NULL),('235016','VariableUpdate','2017-08-14 11:00:23','approved','235001','235001',NULL,NULL,'boolean',0,NULL,NULL,1,NULL,NULL),('235018','VariableUpdate','2017-08-14 11:00:24','workFlowId','235001','235001',NULL,NULL,'string',0,NULL,NULL,NULL,'9621c110-0737-45df-ad5b-dedef5f70cd4',NULL),('235020','VariableUpdate','2017-08-14 11:00:24','docType','235001','235001',NULL,NULL,'string',0,NULL,NULL,NULL,'JOURNAL',NULL),('235022','VariableUpdate','2017-08-14 11:00:24','initiator','235001','235001',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('235024','VariableUpdate','2017-08-14 11:00:24','businessKey','235001','235001',NULL,NULL,'string',0,NULL,NULL,NULL,'9621c110-0737-45df-ad5b-dedef5f70cd4',NULL),('235026','VariableUpdate','2017-08-14 11:00:24','docAuthor','235001','235001',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('237501','VariableUpdate','2017-08-14 11:07:31','approved','235001','235001',NULL,NULL,'boolean',1,NULL,NULL,1,NULL,NULL),('237505','VariableUpdate','2017-08-14 11:07:31','taskOutcome','235001','235004','235028',NULL,'string',0,NULL,NULL,NULL,'Approved',NULL),('237512','VariableUpdate','2017-08-14 11:08:16','approved','235001','235001',NULL,NULL,'boolean',1,NULL,NULL,0,NULL,NULL),('237516','VariableUpdate','2017-08-14 11:08:17','taskOutcome','235001','235004','237508',NULL,'string',0,NULL,NULL,NULL,'Rejected',NULL),('245012','VariableUpdate','2017-08-14 11:24:18','taskOutcome','245001','245004','245007',NULL,'string',0,NULL,NULL,NULL,'TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_2',NULL),('245014','VariableUpdate','2017-08-14 11:24:18','processUserFormId','245001','245001',NULL,NULL,'integer',0,NULL,NULL,1,'1',NULL),('245016','VariableUpdate','2017-08-14 11:24:18','approved','245001','245001',NULL,NULL,'boolean',0,NULL,NULL,1,NULL,NULL),('245018','VariableUpdate','2017-08-14 11:24:18','workFlowId','245001','245001',NULL,NULL,'string',0,NULL,NULL,NULL,'4d595dbe-ccba-4ffc-a77e-ee365714bb7c',NULL),('245020','VariableUpdate','2017-08-14 11:24:18','docType','245001','245001',NULL,NULL,'string',0,NULL,NULL,NULL,'JOURNAL',NULL),('245022','VariableUpdate','2017-08-14 11:24:18','initiator','245001','245001',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('245024','VariableUpdate','2017-08-14 11:24:18','businessKey','245001','245001',NULL,NULL,'string',0,NULL,NULL,NULL,'4d595dbe-ccba-4ffc-a77e-ee365714bb7c',NULL),('245026','VariableUpdate','2017-08-14 11:24:18','docAuthor','245001','245001',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('250012','VariableUpdate','2017-08-14 12:02:27','taskOutcome','250001','250004','250007',NULL,'string',0,NULL,NULL,NULL,'TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_2',NULL),('250014','VariableUpdate','2017-08-14 12:02:27','processUserFormId','250001','250001',NULL,NULL,'integer',0,NULL,NULL,1,'1',NULL),('250016','VariableUpdate','2017-08-14 12:02:27','approved','250001','250001',NULL,NULL,'boolean',0,NULL,NULL,1,NULL,NULL),('250018','VariableUpdate','2017-08-14 12:02:27','workFlowId','250001','250001',NULL,NULL,'string',0,NULL,NULL,NULL,'2',NULL),('250020','VariableUpdate','2017-08-14 12:02:27','docType','250001','250001',NULL,NULL,'string',0,NULL,NULL,NULL,'JOURNAL',NULL),('250022','VariableUpdate','2017-08-14 12:02:27','initiator','250001','250001',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('250024','VariableUpdate','2017-08-14 12:02:27','businessKey','250001','250001',NULL,NULL,'string',0,NULL,NULL,NULL,'2',NULL),('250026','VariableUpdate','2017-08-14 12:02:27','docAuthor','250001','250001',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('250032','VariableUpdate','2017-08-14 12:04:34','approved','250001','250001',NULL,NULL,'boolean',1,NULL,NULL,1,NULL,NULL),('250036','VariableUpdate','2017-08-14 12:04:34','taskOutcome','250001','250004','250028',NULL,'string',0,NULL,NULL,NULL,'Approved',NULL),('250043','VariableUpdate','2017-08-14 12:05:04','approved','245001','245001',NULL,NULL,'boolean',1,NULL,NULL,1,NULL,NULL),('250047','VariableUpdate','2017-08-14 12:05:04','taskOutcome','245001','245004','245028',NULL,'string',0,NULL,NULL,NULL,'Approved',NULL),('250049','VariableUpdate','2017-08-14 12:09:46','approved','250001','250001',NULL,NULL,'boolean',1,NULL,NULL,1,NULL,NULL),('250053','VariableUpdate','2017-08-14 12:09:46','taskOutcome','250001','250004','250039',NULL,'string',0,NULL,NULL,NULL,'Approved',NULL),('250073','VariableUpdate','2017-08-14 12:19:48','taskOutcome','250062','250065','250068',NULL,'string',0,NULL,NULL,NULL,'TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_2',NULL),('250075','VariableUpdate','2017-08-14 12:19:48','processUserFormId','250062','250062',NULL,NULL,'integer',0,NULL,NULL,1,'1',NULL),('250077','VariableUpdate','2017-08-14 12:19:48','approved','250062','250062',NULL,NULL,'boolean',0,NULL,NULL,1,NULL,NULL),('250079','VariableUpdate','2017-08-14 12:19:48','workFlowId','250062','250062',NULL,NULL,'string',0,NULL,NULL,NULL,'3',NULL),('250081','VariableUpdate','2017-08-14 12:19:48','docType','250062','250062',NULL,NULL,'string',0,NULL,NULL,NULL,'JOURNAL',NULL),('250083','VariableUpdate','2017-08-14 12:19:48','initiator','250062','250062',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('250085','VariableUpdate','2017-08-14 12:19:48','businessKey','250062','250062',NULL,NULL,'string',0,NULL,NULL,NULL,'3',NULL),('250087','VariableUpdate','2017-08-14 12:19:48','docAuthor','250062','250062',NULL,NULL,'string',0,NULL,NULL,NULL,'santosh',NULL),('250093','VariableUpdate','2017-08-14 12:20:35','approved','250062','250062',NULL,NULL,'boolean',1,NULL,NULL,1,NULL,NULL),('250097','VariableUpdate','2017-08-14 12:20:35','taskOutcome','250062','250065','250089',NULL,'string',0,NULL,NULL,NULL,'Approved',NULL),('250104','VariableUpdate','2017-08-14 12:22:27','approved','250062','250062',NULL,NULL,'boolean',1,NULL,NULL,1,NULL,NULL),('250108','VariableUpdate','2017-08-14 12:22:27','taskOutcome','250062','250065','250100',NULL,'string',0,NULL,NULL,NULL,'Approved',NULL),('250117','VariableUpdate','2017-08-14 12:29:23','taskOutcome','250062','250065','250111',NULL,'string',0,NULL,NULL,NULL,'Collaborated',NULL);
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_identitylink`
--

DROP TABLE IF EXISTS `act_hi_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) NOT NULL,
  `GROUP_ID_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `USER_ID_` varchar(255) DEFAULT NULL,
  `TASK_ID_` varchar(64) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_identitylink`
--

LOCK TABLES `act_hi_identitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_procinst`
--

DROP TABLE IF EXISTS `act_hi_procinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) NOT NULL,
  `PROC_INST_ID_` varchar(64) NOT NULL,
  `BUSINESS_KEY_` varchar(255) DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) NOT NULL,
  `START_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `END_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) DEFAULT NULL,
  `START_ACT_ID_` varchar(255) DEFAULT NULL,
  `END_ACT_ID_` varchar(255) DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  `NAME_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_procinst`
--

LOCK TABLES `act_hi_procinst` WRITE;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_taskinst`
--

DROP TABLE IF EXISTS `act_hi_taskinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) NOT NULL,
  `PROC_DEF_ID_` varchar(64) DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) DEFAULT NULL,
  `OWNER_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `START_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CLAIM_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `END_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `FORM_KEY_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_taskinst`
--

LOCK TABLES `act_hi_taskinst` WRITE;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_varinst`
--

DROP TABLE IF EXISTS `act_hi_varinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) NOT NULL,
  `PROC_INST_ID_` varchar(64) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) DEFAULT NULL,
  `TASK_ID_` varchar(64) DEFAULT NULL,
  `NAME_` varchar(255) NOT NULL,
  `VAR_TYPE_` varchar(100) DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) DEFAULT NULL,
  `TEXT2_` varchar(4000) DEFAULT NULL,
  `CREATE_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LAST_UPDATED_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_varinst`
--

LOCK TABLES `act_hi_varinst` WRITE;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
INSERT INTO `act_hi_varinst` VALUES ('190018','190001','190006','190009','taskOutcome','string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS',NULL,'2017-08-12 11:15:47','2017-08-12 11:15:47'),('190020','190001','190001',NULL,'processUserFormId','integer',1,NULL,NULL,1,'1',NULL,'2017-08-12 11:15:53','2017-08-12 11:15:53'),('190022','190001','190001',NULL,'approved','boolean',1,NULL,NULL,0,NULL,NULL,'2017-08-12 11:15:53','2017-08-12 11:15:53'),('190024','190001','190001',NULL,'workFlowId','string',1,NULL,NULL,NULL,'22',NULL,'2017-08-12 11:15:53','2017-08-12 11:15:53'),('190026','190001','190001',NULL,'docType','string',1,NULL,NULL,NULL,'JOURNAL',NULL,'2017-08-12 11:15:53','2017-08-12 11:15:53'),('190028','190001','190001',NULL,'initiator','string',1,NULL,NULL,NULL,'santosh',NULL,'2017-08-12 11:15:53','2017-08-12 11:15:53'),('190030','190001','190001',NULL,'businessKey','string',1,NULL,NULL,NULL,'22',NULL,'2017-08-12 11:15:53','2017-08-12 11:15:53'),('190032','190001','190001',NULL,'docAuthor','string',1,NULL,NULL,NULL,'santosh',NULL,'2017-08-12 11:15:53','2017-08-12 11:15:53'),('190049','190001','190012','190015','taskOutcome','string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS',NULL,'2017-08-12 11:15:52','2017-08-12 11:15:52'),('195022','195005','195010','195013','taskOutcome','string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS',NULL,'2017-08-12 14:59:28','2017-08-12 14:59:28'),('195024','195005','195005',NULL,'processUserFormId','integer',1,NULL,NULL,1,'1',NULL,'2017-08-12 14:59:29','2017-08-12 14:59:29'),('195026','195005','195005',NULL,'approved','boolean',2,NULL,NULL,1,NULL,NULL,'2017-08-12 15:01:24','2017-08-12 15:01:24'),('195028','195005','195005',NULL,'workFlowId','string',1,NULL,NULL,NULL,'24',NULL,'2017-08-12 14:59:29','2017-08-12 14:59:29'),('195030','195005','195005',NULL,'docType','string',1,NULL,NULL,NULL,'JOURNAL',NULL,'2017-08-12 14:59:29','2017-08-12 14:59:29'),('195032','195005','195005',NULL,'initiator','string',1,NULL,NULL,NULL,'santosh',NULL,'2017-08-12 14:59:29','2017-08-12 14:59:29'),('195034','195005','195005',NULL,'businessKey','string',1,NULL,NULL,NULL,'24',NULL,'2017-08-12 14:59:29','2017-08-12 14:59:29'),('195036','195005','195005',NULL,'docAuthor','string',1,NULL,NULL,NULL,'santosh',NULL,'2017-08-12 14:59:29','2017-08-12 14:59:29'),('195053','195005','195016','195019','taskOutcome','string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS',NULL,'2017-08-12 14:59:29','2017-08-12 14:59:29'),('195079','195005','195042','195045','taskOutcome','string',0,NULL,NULL,NULL,'Approved',NULL,'2017-08-12 15:01:24','2017-08-12 15:01:24'),('197536','197519','197524','197527','taskOutcome','string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS',NULL,'2017-08-12 15:54:43','2017-08-12 15:54:43'),('197538','197519','197519',NULL,'processUserFormId','integer',1,NULL,NULL,1,'1',NULL,'2017-08-12 15:54:44','2017-08-12 15:54:44'),('197540','197519','197519',NULL,'approved','boolean',10,NULL,NULL,1,NULL,NULL,'2017-08-13 11:36:47','2017-08-13 11:36:46'),('197542','197519','197519',NULL,'workFlowId','string',1,NULL,NULL,NULL,'25',NULL,'2017-08-12 15:54:44','2017-08-12 15:54:44'),('197544','197519','197519',NULL,'docType','string',1,NULL,NULL,NULL,'JOURNAL',NULL,'2017-08-12 15:54:44','2017-08-12 15:54:44'),('197546','197519','197519',NULL,'initiator','string',1,NULL,NULL,NULL,'santosh',NULL,'2017-08-12 15:54:44','2017-08-12 15:54:44'),('197548','197519','197519',NULL,'businessKey','string',1,NULL,NULL,NULL,'25',NULL,'2017-08-12 15:54:44','2017-08-12 15:54:44'),('197550','197519','197519',NULL,'docAuthor','string',1,NULL,NULL,NULL,'santosh',NULL,'2017-08-12 15:54:44','2017-08-12 15:54:44'),('197567','197519','197530','197533','taskOutcome','string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS',NULL,'2017-08-12 15:54:44','2017-08-12 15:54:44'),('197593','197519','197580','197583','taskOutcome','string',0,NULL,NULL,NULL,'Approved',NULL,'2017-08-12 15:57:50','2017-08-12 15:57:50'),('197603','197519','197580','197597','taskOutcome','string',0,NULL,NULL,NULL,'Approved',NULL,'2017-08-12 16:03:39','2017-08-12 16:03:39'),('200004','197519','197556','197559','taskOutcome','string',0,NULL,NULL,NULL,'Rejected',NULL,'2017-08-13 11:35:48','2017-08-13 11:35:48'),('200023','197519','197561','197564','taskOutcome','string',0,NULL,NULL,NULL,'Rejected',NULL,'2017-08-13 11:36:11','2017-08-13 11:36:11'),('200042','197519','197585','197588','taskOutcome','string',0,NULL,NULL,NULL,'Approved',NULL,'2017-08-13 11:36:22','2017-08-13 11:36:22'),('200051','197519','200015','200018','taskOutcome','string',0,NULL,NULL,NULL,'Approved',NULL,'2017-08-13 11:36:30','2017-08-13 11:36:30'),('200060','197519','200010','200013','taskOutcome','string',0,NULL,NULL,NULL,'Approved',NULL,'2017-08-13 11:36:37','2017-08-13 11:36:37'),('200069','197519','200034','200037','taskOutcome','string',0,NULL,NULL,NULL,'Approved',NULL,'2017-08-13 11:36:42','2017-08-13 11:36:42'),('200078','197519','200029','200032','taskOutcome','string',0,NULL,NULL,NULL,'Approved',NULL,'2017-08-13 11:36:47','2017-08-13 11:36:47'),('202518','202501','202506','202509','taskOutcome','string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS',NULL,'2017-08-13 12:02:50','2017-08-13 12:02:50'),('202520','202501','202501',NULL,'processUserFormId','integer',1,NULL,NULL,1,'1',NULL,'2017-08-13 12:02:51','2017-08-13 12:02:51'),('202522','202501','202501',NULL,'approved','boolean',1,NULL,NULL,0,NULL,NULL,'2017-08-13 12:02:51','2017-08-13 12:02:51'),('202524','202501','202501',NULL,'workFlowId','string',1,NULL,NULL,NULL,'26',NULL,'2017-08-13 12:02:51','2017-08-13 12:02:51'),('202526','202501','202501',NULL,'docType','string',1,NULL,NULL,NULL,'JOURNAL',NULL,'2017-08-13 12:02:51','2017-08-13 12:02:51'),('202528','202501','202501',NULL,'initiator','string',1,NULL,NULL,NULL,'santosh',NULL,'2017-08-13 12:02:51','2017-08-13 12:02:51'),('202530','202501','202501',NULL,'businessKey','string',1,NULL,NULL,NULL,'26',NULL,'2017-08-13 12:02:51','2017-08-13 12:02:51'),('202532','202501','202501',NULL,'docAuthor','string',1,NULL,NULL,NULL,'santosh',NULL,'2017-08-13 12:02:51','2017-08-13 12:02:51'),('202549','202501','202512','202515','taskOutcome','string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS',NULL,'2017-08-13 12:02:51','2017-08-13 12:02:51'),('202597','202576','202581','202584','taskOutcome','string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS',NULL,'2017-08-13 12:33:02','2017-08-13 12:33:02'),('202599','202576','202576',NULL,'processUserFormId','integer',1,NULL,NULL,1,'1',NULL,'2017-08-13 12:33:03','2017-08-13 12:33:03'),('202601','202576','202576',NULL,'approved','boolean',1,NULL,NULL,0,NULL,NULL,'2017-08-13 12:33:03','2017-08-13 12:33:03'),('202603','202576','202576',NULL,'workFlowId','string',1,NULL,NULL,NULL,'27',NULL,'2017-08-13 12:33:03','2017-08-13 12:33:03'),('202605','202576','202576',NULL,'docType','string',1,NULL,NULL,NULL,'JOURNAL',NULL,'2017-08-13 12:33:03','2017-08-13 12:33:03'),('202607','202576','202576',NULL,'initiator','string',1,NULL,NULL,NULL,'santosh',NULL,'2017-08-13 12:33:03','2017-08-13 12:33:03'),('202609','202576','202576',NULL,'businessKey','string',1,NULL,NULL,NULL,'27',NULL,'2017-08-13 12:33:03','2017-08-13 12:33:03'),('202611','202576','202576',NULL,'docAuthor','string',1,NULL,NULL,NULL,'santosh',NULL,'2017-08-13 12:33:03','2017-08-13 12:33:03'),('202632','202576','202589','202592','taskOutcome','string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS',NULL,'2017-08-13 12:33:03','2017-08-13 12:33:03'),('202684','202663','202668','202671','taskOutcome','string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS',NULL,'2017-08-13 12:36:50','2017-08-13 12:36:50'),('202686','202663','202663',NULL,'processUserFormId','integer',1,NULL,NULL,1,'1',NULL,'2017-08-13 12:36:51','2017-08-13 12:36:51'),('202688','202663','202663',NULL,'approved','boolean',1,NULL,NULL,0,NULL,NULL,'2017-08-13 12:36:51','2017-08-13 12:36:51'),('202690','202663','202663',NULL,'workFlowId','string',1,NULL,NULL,NULL,'28',NULL,'2017-08-13 12:36:51','2017-08-13 12:36:51'),('202692','202663','202663',NULL,'docType','string',1,NULL,NULL,NULL,'JOURNAL',NULL,'2017-08-13 12:36:51','2017-08-13 12:36:51'),('202694','202663','202663',NULL,'initiator','string',1,NULL,NULL,NULL,'santosh',NULL,'2017-08-13 12:36:51','2017-08-13 12:36:51'),('202696','202663','202663',NULL,'businessKey','string',1,NULL,NULL,NULL,'28',NULL,'2017-08-13 12:36:51','2017-08-13 12:36:51'),('202698','202663','202663',NULL,'docAuthor','string',1,NULL,NULL,NULL,'santosh',NULL,'2017-08-13 12:36:51','2017-08-13 12:36:51'),('202719','202663','202676','202679','taskOutcome','string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS',NULL,'2017-08-13 12:36:51','2017-08-13 12:36:51'),('222516','222505','222508','222511','taskOutcome','string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESSJournal_Subprocess',NULL,'2017-08-14 08:16:30','2017-08-14 08:16:30'),('222518','222505','222505',NULL,'processUserFormId','integer',1,NULL,NULL,1,'1',NULL,'2017-08-14 08:17:37','2017-08-14 08:17:37'),('222520','222505','222505',NULL,'approved','boolean',2,NULL,NULL,1,NULL,NULL,'2017-08-14 08:17:37','2017-08-14 08:17:37'),('222522','222505','222505',NULL,'workFlowId','string',1,NULL,NULL,NULL,'037d8d7e-accc-43f7-86df-e5338e5acc7e',NULL,'2017-08-14 08:17:37','2017-08-14 08:17:37'),('222524','222505','222505',NULL,'docType','string',1,NULL,NULL,NULL,'JOURNAL',NULL,'2017-08-14 08:17:37','2017-08-14 08:17:37'),('222526','222505','222505',NULL,'initiator','string',1,NULL,NULL,NULL,'santosh',NULL,'2017-08-14 08:17:37','2017-08-14 08:17:37'),('222528','222505','222505',NULL,'businessKey','string',1,NULL,NULL,NULL,'037d8d7e-accc-43f7-86df-e5338e5acc7e',NULL,'2017-08-14 08:17:37','2017-08-14 08:17:37'),('222530','222505','222505',NULL,'docAuthor','string',1,NULL,NULL,NULL,'santosh',NULL,'2017-08-14 08:17:37','2017-08-14 08:17:37'),('222541','222505','222508','222534','taskOutcome','string',0,NULL,NULL,NULL,'Approved',NULL,'2017-08-14 08:17:37','2017-08-14 08:17:37'),('225016','225005','225008','225011','taskOutcome','string',0,NULL,NULL,NULL,'APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESSJournal_Subprocess',NULL,'2017-08-14 08:30:15','2017-08-14 08:30:15'),('225018','225005','225005',NULL,'processUserFormId','integer',0,NULL,NULL,1,'1',NULL,'2017-08-14 08:30:15','2017-08-14 08:30:15'),('225020','225005','225005',NULL,'approved','boolean',0,NULL,NULL,1,NULL,NULL,'2017-08-14 08:30:15','2017-08-14 08:30:15'),('225022','225005','225005',NULL,'workFlowId','string',0,NULL,NULL,NULL,'d4e023e4-050c-46a9-b6d3-c4554afa2438',NULL,'2017-08-14 08:30:15','2017-08-14 08:30:15'),('225024','225005','225005',NULL,'docType','string',0,NULL,NULL,NULL,'JOURNAL',NULL,'2017-08-14 08:30:15','2017-08-14 08:30:15'),('225026','225005','225005',NULL,'initiator','string',0,NULL,NULL,NULL,'santosh',NULL,'2017-08-14 08:30:15','2017-08-14 08:30:15'),('225028','225005','225005',NULL,'businessKey','string',0,NULL,NULL,NULL,'d4e023e4-050c-46a9-b6d3-c4554afa2438',NULL,'2017-08-14 08:30:15','2017-08-14 08:30:15'),('225030','225005','225005',NULL,'docAuthor','string',0,NULL,NULL,NULL,'santosh',NULL,'2017-08-14 08:30:15','2017-08-14 08:30:15'),('225056','225046','225049','225052','taskOutcome','string',0,NULL,NULL,NULL,'TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_2',NULL,'2017-08-14 08:53:34','2017-08-14 08:53:34'),('225058','225046','225046',NULL,'processUserFormId','integer',0,NULL,NULL,1,'1',NULL,'2017-08-14 08:53:34','2017-08-14 08:53:34'),('225060','225046','225046',NULL,'approved','boolean',2,NULL,NULL,1,NULL,NULL,'2017-08-14 08:55:39','2017-08-14 08:55:39'),('225062','225046','225046',NULL,'workFlowId','string',0,NULL,NULL,NULL,'7cb893a1-e72a-40de-9a5c-083c373a9305',NULL,'2017-08-14 08:53:34','2017-08-14 08:53:34'),('225064','225046','225046',NULL,'docType','string',0,NULL,NULL,NULL,'JOURNAL',NULL,'2017-08-14 08:53:34','2017-08-14 08:53:34'),('225066','225046','225046',NULL,'initiator','string',0,NULL,NULL,NULL,'santosh',NULL,'2017-08-14 08:53:34','2017-08-14 08:53:34'),('225068','225046','225046',NULL,'businessKey','string',0,NULL,NULL,NULL,'7cb893a1-e72a-40de-9a5c-083c373a9305',NULL,'2017-08-14 08:53:34','2017-08-14 08:53:34'),('225070','225046','225046',NULL,'docAuthor','string',0,NULL,NULL,NULL,'santosh',NULL,'2017-08-14 08:53:34','2017-08-14 08:53:34'),('225080','225046','225049','225073','taskOutcome','string',0,NULL,NULL,NULL,'Approved',NULL,'2017-08-14 08:54:32','2017-08-14 08:54:32'),('225091','225046','225049','225084','taskOutcome','string',0,NULL,NULL,NULL,'Approved',NULL,'2017-08-14 08:55:39','2017-08-14 08:55:39'),('227511','227501','227504','227507','taskOutcome','string',0,NULL,NULL,NULL,'TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_2',NULL,'2017-08-14 09:16:07','2017-08-14 09:16:07'),('227513','227501','227501',NULL,'processUserFormId','integer',0,NULL,NULL,1,'1',NULL,'2017-08-14 09:16:14','2017-08-14 09:16:14'),('227515','227501','227501',NULL,'approved','boolean',0,NULL,NULL,1,NULL,NULL,'2017-08-14 09:16:14','2017-08-14 09:16:14'),('227517','227501','227501',NULL,'workFlowId','string',0,NULL,NULL,NULL,'c74e35b3-0374-4176-9f9c-2364ce2cafe1',NULL,'2017-08-14 09:16:14','2017-08-14 09:16:14'),('227519','227501','227501',NULL,'docType','string',0,NULL,NULL,NULL,'JOURNAL',NULL,'2017-08-14 09:16:14','2017-08-14 09:16:14'),('227521','227501','227501',NULL,'initiator','string',0,NULL,NULL,NULL,'santosh',NULL,'2017-08-14 09:16:14','2017-08-14 09:16:14'),('227523','227501','227501',NULL,'businessKey','string',0,NULL,NULL,NULL,'c74e35b3-0374-4176-9f9c-2364ce2cafe1',NULL,'2017-08-14 09:16:14','2017-08-14 09:16:14'),('227525','227501','227501',NULL,'docAuthor','string',0,NULL,NULL,NULL,'santosh',NULL,'2017-08-14 09:16:14','2017-08-14 09:16:14'),('235011','235001','235004','235007','taskOutcome','string',0,NULL,NULL,NULL,'TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_2',NULL,'2017-08-14 11:00:23','2017-08-14 11:00:23'),('235013','235001','235001',NULL,'processUserFormId','integer',0,NULL,NULL,1,'1',NULL,'2017-08-14 11:00:23','2017-08-14 11:00:23'),('235015','235001','235001',NULL,'approved','boolean',2,NULL,NULL,0,NULL,NULL,'2017-08-14 11:08:16','2017-08-14 11:08:16'),('235017','235001','235001',NULL,'workFlowId','string',0,NULL,NULL,NULL,'9621c110-0737-45df-ad5b-dedef5f70cd4',NULL,'2017-08-14 11:00:24','2017-08-14 11:00:24'),('235019','235001','235001',NULL,'docType','string',0,NULL,NULL,NULL,'JOURNAL',NULL,'2017-08-14 11:00:24','2017-08-14 11:00:24'),('235021','235001','235001',NULL,'initiator','string',0,NULL,NULL,NULL,'santosh',NULL,'2017-08-14 11:00:24','2017-08-14 11:00:24'),('235023','235001','235001',NULL,'businessKey','string',0,NULL,NULL,NULL,'9621c110-0737-45df-ad5b-dedef5f70cd4',NULL,'2017-08-14 11:00:24','2017-08-14 11:00:24'),('235025','235001','235001',NULL,'docAuthor','string',0,NULL,NULL,NULL,'santosh',NULL,'2017-08-14 11:00:24','2017-08-14 11:00:24'),('237504','235001','235004','235028','taskOutcome','string',0,NULL,NULL,NULL,'Approved',NULL,'2017-08-14 11:07:31','2017-08-14 11:07:31'),('237515','235001','235004','237508','taskOutcome','string',0,NULL,NULL,NULL,'Rejected',NULL,'2017-08-14 11:08:17','2017-08-14 11:08:17'),('245011','245001','245004','245007','taskOutcome','string',0,NULL,NULL,NULL,'TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_2',NULL,'2017-08-14 11:24:18','2017-08-14 11:24:18'),('245013','245001','245001',NULL,'processUserFormId','integer',0,NULL,NULL,1,'1',NULL,'2017-08-14 11:24:18','2017-08-14 11:24:18'),('245015','245001','245001',NULL,'approved','boolean',1,NULL,NULL,1,NULL,NULL,'2017-08-14 12:05:04','2017-08-14 12:05:04'),('245017','245001','245001',NULL,'workFlowId','string',0,NULL,NULL,NULL,'4d595dbe-ccba-4ffc-a77e-ee365714bb7c',NULL,'2017-08-14 11:24:18','2017-08-14 11:24:18'),('245019','245001','245001',NULL,'docType','string',0,NULL,NULL,NULL,'JOURNAL',NULL,'2017-08-14 11:24:18','2017-08-14 11:24:18'),('245021','245001','245001',NULL,'initiator','string',0,NULL,NULL,NULL,'santosh',NULL,'2017-08-14 11:24:18','2017-08-14 11:24:18'),('245023','245001','245001',NULL,'businessKey','string',0,NULL,NULL,NULL,'4d595dbe-ccba-4ffc-a77e-ee365714bb7c',NULL,'2017-08-14 11:24:18','2017-08-14 11:24:18'),('245025','245001','245001',NULL,'docAuthor','string',0,NULL,NULL,NULL,'santosh',NULL,'2017-08-14 11:24:18','2017-08-14 11:24:18'),('250011','250001','250004','250007','taskOutcome','string',0,NULL,NULL,NULL,'TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_2',NULL,'2017-08-14 12:02:27','2017-08-14 12:02:27'),('250013','250001','250001',NULL,'processUserFormId','integer',0,NULL,NULL,1,'1',NULL,'2017-08-14 12:02:27','2017-08-14 12:02:27'),('250015','250001','250001',NULL,'approved','boolean',2,NULL,NULL,1,NULL,NULL,'2017-08-14 12:09:46','2017-08-14 12:09:46'),('250017','250001','250001',NULL,'workFlowId','string',0,NULL,NULL,NULL,'2',NULL,'2017-08-14 12:02:27','2017-08-14 12:02:27'),('250019','250001','250001',NULL,'docType','string',0,NULL,NULL,NULL,'JOURNAL',NULL,'2017-08-14 12:02:27','2017-08-14 12:02:27'),('250021','250001','250001',NULL,'initiator','string',0,NULL,NULL,NULL,'santosh',NULL,'2017-08-14 12:02:27','2017-08-14 12:02:27'),('250023','250001','250001',NULL,'businessKey','string',0,NULL,NULL,NULL,'2',NULL,'2017-08-14 12:02:27','2017-08-14 12:02:27'),('250025','250001','250001',NULL,'docAuthor','string',0,NULL,NULL,NULL,'santosh',NULL,'2017-08-14 12:02:27','2017-08-14 12:02:27'),('250035','250001','250004','250028','taskOutcome','string',0,NULL,NULL,NULL,'Approved',NULL,'2017-08-14 12:04:34','2017-08-14 12:04:34'),('250046','245001','245004','245028','taskOutcome','string',0,NULL,NULL,NULL,'Approved',NULL,'2017-08-14 12:05:04','2017-08-14 12:05:04'),('250052','250001','250004','250039','taskOutcome','string',0,NULL,NULL,NULL,'Approved',NULL,'2017-08-14 12:09:46','2017-08-14 12:09:46'),('250072','250062','250065','250068','taskOutcome','string',0,NULL,NULL,NULL,'TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_2',NULL,'2017-08-14 12:19:48','2017-08-14 12:19:48'),('250074','250062','250062',NULL,'processUserFormId','integer',0,NULL,NULL,1,'1',NULL,'2017-08-14 12:19:48','2017-08-14 12:19:48'),('250076','250062','250062',NULL,'approved','boolean',2,NULL,NULL,1,NULL,NULL,'2017-08-14 12:22:27','2017-08-14 12:22:27'),('250078','250062','250062',NULL,'workFlowId','string',0,NULL,NULL,NULL,'3',NULL,'2017-08-14 12:19:48','2017-08-14 12:19:48'),('250080','250062','250062',NULL,'docType','string',0,NULL,NULL,NULL,'JOURNAL',NULL,'2017-08-14 12:19:48','2017-08-14 12:19:48'),('250082','250062','250062',NULL,'initiator','string',0,NULL,NULL,NULL,'santosh',NULL,'2017-08-14 12:19:48','2017-08-14 12:19:48'),('250084','250062','250062',NULL,'businessKey','string',0,NULL,NULL,NULL,'3',NULL,'2017-08-14 12:19:48','2017-08-14 12:19:48'),('250086','250062','250062',NULL,'docAuthor','string',0,NULL,NULL,NULL,'santosh',NULL,'2017-08-14 12:19:48','2017-08-14 12:19:48'),('250096','250062','250065','250089','taskOutcome','string',0,NULL,NULL,NULL,'Approved',NULL,'2017-08-14 12:20:35','2017-08-14 12:20:35'),('250107','250062','250065','250100','taskOutcome','string',0,NULL,NULL,NULL,'Approved',NULL,'2017-08-14 12:22:27','2017-08-14 12:22:27'),('250116','250062','250065','250111','taskOutcome','string',0,NULL,NULL,NULL,'Collaborated',NULL,'2017-08-14 12:29:23','2017-08-14 12:29:23');
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_group`
--

DROP TABLE IF EXISTS `act_id_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_group`
--

LOCK TABLES `act_id_group` WRITE;
/*!40000 ALTER TABLE `act_id_group` DISABLE KEYS */;
INSERT INTO `act_id_group` VALUES ('Admin',1,'Admin','security-role'),('Approver',1,'Approver','security-role'),('Submitter',1,'Submitter','security-role'),('user',1,'User','security-role');
/*!40000 ALTER TABLE `act_id_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_info`
--

DROP TABLE IF EXISTS `act_id_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) DEFAULT NULL,
  `TYPE_` varchar(64) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `VALUE_` varchar(255) DEFAULT NULL,
  `PASSWORD_` text,
  `PARENT_ID_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_info`
--

LOCK TABLES `act_id_info` WRITE;
/*!40000 ALTER TABLE `act_id_info` DISABLE KEYS */;
INSERT INTO `act_id_info` VALUES ('16',1,'arun','userinfo','LIMIT_TO_APPROVE','100000',NULL,NULL),('17',1,'gaurav','userinfo','LIMIT_TO_APPROVE','50000',NULL,NULL);
/*!40000 ALTER TABLE `act_id_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_membership`
--

DROP TABLE IF EXISTS `act_id_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) NOT NULL,
  `GROUP_ID_` varchar(64) NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_membership`
--

LOCK TABLES `act_id_membership` WRITE;
/*!40000 ALTER TABLE `act_id_membership` DISABLE KEYS */;
INSERT INTO `act_id_membership` VALUES ('admin','Admin'),('arun','Approver'),('gaurav','Approver'),('santosh','user'),('userCT1','user'),('userFC1','user'),('userFC2','user');
/*!40000 ALTER TABLE `act_id_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_user`
--

DROP TABLE IF EXISTS `act_id_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) DEFAULT NULL,
  `LAST_` varchar(255) DEFAULT NULL,
  `EMAIL_` varchar(255) DEFAULT NULL,
  `PWD_` varchar(255) DEFAULT NULL,
  `PICTURE_ID_` varchar(64) DEFAULT NULL,
  `department_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_user`
--

LOCK TABLES `act_id_user` WRITE;
/*!40000 ALTER TABLE `act_id_user` DISABLE KEYS */;
INSERT INTO `act_id_user` VALUES ('admin',4,'Admin','User','admin@da.com','admin','14',NULL),('arun',3,'Arun','Rawat','arun@gmail.com','arun','17',NULL),('gaurav',1,'Gaurav','Khatri','gaurav@gmail.com','gaurav','16',NULL),('santosh',2,'Santosh','Pandey','santosh3888@gmail.com','santosh','15',NULL),('userCT1',7,'userCT1','userCT1','userCT1@da.com','userCT1','20','CT'),('userFC1',5,'userFC1','userFC1','userFC1@da.com','userFC1','18','FC'),('userFC2',6,'userFC2','userFC2','userFC2@da.com','userFC2','19','FC');
/*!40000 ALTER TABLE `act_id_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_deployment`
--

DROP TABLE IF EXISTS `act_re_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  `DEPLOY_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
INSERT INTO `act_re_deployment` VALUES ('257501','Dynamic process deployment',NULL,'','2017-08-21 13:11:35'),('257505','Dynamic process deployment',NULL,'','2017-08-21 13:11:55');
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_model`
--

DROP TABLE IF EXISTS `act_re_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `CREATE_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LAST_UPDATE_TIME_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` text,
  `DEPLOYMENT_ID_` varchar(64) DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_model`
--

LOCK TABLES `act_re_model` WRITE;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) DEFAULT NULL,
  `HAS_START_FORM_KEY_` bit(1) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` bit(1) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
INSERT INTO `act_re_procdef` VALUES ('BOOK_REPORT___Admin:1:257508',1,'com.da','BOOK_REPORT___Admin','BOOK_REPORT___Admin',1,'257505','BOOK_REPORT___Admindynamic-model.bpmn','BOOK_REPORT___Admindynamic-model.BOOK_REPORT___Admin.png',NULL,'\0','',1,''),('BOOK_REPORT___user:1:257504',1,'com.da','BOOK_REPORT___user','BOOK_REPORT___user',1,'257501','BOOK_REPORT___userdynamic-model.bpmn','BOOK_REPORT___userdynamic-model.BOOK_REPORT___user.png',NULL,'\0','',1,'');
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_event_subscr`
--

DROP TABLE IF EXISTS `act_ru_event_subscr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) NOT NULL,
  `EVENT_NAME_` varchar(255) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) DEFAULT NULL,
  `CONFIGURATION_` varchar(255) DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_event_subscr`
--

LOCK TABLES `act_ru_event_subscr` WRITE;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) DEFAULT NULL,
  `PARENT_ID_` varchar(64) DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) DEFAULT NULL,
  `ACT_ID_` varchar(255) DEFAULT NULL,
  `IS_ACTIVE_` bit(1) DEFAULT NULL,
  `IS_CONCURRENT_` bit(1) DEFAULT NULL,
  `IS_SCOPE_` bit(1) DEFAULT NULL,
  `IS_EVENT_SCOPE_` bit(1) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  `NAME_` varchar(255) DEFAULT NULL,
  `LOCK_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `USER_ID_` varchar(255) DEFAULT NULL,
  `TASK_ID_` varchar(64) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_job`
--

DROP TABLE IF EXISTS `act_ru_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) NOT NULL,
  `LOCK_EXP_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LOCK_OWNER_` varchar(255) DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) DEFAULT NULL,
  `DUEDATE_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `REPEAT_` varchar(255) DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_job`
--

LOCK TABLES `act_ru_job` WRITE;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) DEFAULT NULL,
  `OWNER_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `DELEGATION_` varchar(64) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DUE_DATE_` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  `FORM_KEY_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) NOT NULL,
  `NAME_` varchar(255) NOT NULL,
  `EXECUTION_ID_` varchar(64) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) DEFAULT NULL,
  `TASK_ID_` varchar(64) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) DEFAULT NULL,
  `TEXT2_` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert`
--

DROP TABLE IF EXISTS `alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert` (
  `ID` varchar(255) NOT NULL,
  `CREATED_BY` varchar(255) DEFAULT NULL,
  `MESSAGE` varchar(10000) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ACKNOWLEDGED` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert`
--

LOCK TABLES `alert` WRITE;
/*!40000 ALTER TABLE `alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_report`
--

DROP TABLE IF EXISTS `book_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_report` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) DEFAULT NULL,
  `GROUP_ID` varchar(255) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DOC_STATE` varchar(255) DEFAULT NULL,
  `DOC_TYPE` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `BOOK_TITLE` varchar(255) DEFAULT NULL,
  `BOOK_AUTHOR` varchar(255) DEFAULT NULL,
  `SUMMARY` text,
  `CONTENT` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_report`
--

LOCK TABLES `book_report` WRITE;
/*!40000 ALTER TABLE `book_report` DISABLE KEYS */;
INSERT INTO `book_report` VALUES ('42108178-4bbb-4e8d-9a98-66e923ed0a7d','kermit','management','2017-06-10 08:39:00','DRAFT','BOOK_REPORT','sdfdsf','sdfsdf','sdfds','sdfsdf','sdfsd');
/*!40000 ALTER TABLE `book_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codelookup`
--

DROP TABLE IF EXISTS `codelookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codelookup` (
  `Code_type` varchar(45) NOT NULL,
  `Key_Code` varchar(45) NOT NULL,
  `Key_Value` varchar(100) DEFAULT NULL,
  `Dt_Created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codelookup`
--

LOCK TABLES `codelookup` WRITE;
/*!40000 ALTER TABLE `codelookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `codelookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `department_id` varchar(10) NOT NULL,
  `department_name` varchar(45) DEFAULT NULL,
  `department_desc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('CT','Controllership',NULL),('FC','Financial Control','Financial Control'),('PR','Payroll','Payroll'),('PY','Payables','Payables'),('RV','Receivbles','Receivbles');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) DEFAULT NULL,
  `GROUP_ID` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DOC_STATE` varchar(255) DEFAULT NULL,
  `DOC_TYPE` varchar(255) DEFAULT NULL,
  `PAYEE` varchar(255) DEFAULT NULL,
  `AMOUNT` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES ('2aa25f12-3436-495b-9e7f-60de874c40cd','fozzie','engineering','test-1','2017-06-10 09:06:00','DRAFT','INVOICE','santosh',12000.00),('3a9bb770-628b-4528-bb6b-e7d807e7f2a3','kermit','engineering','dummyTitle','2017-06-10 07:55:09','EMAILED','INVOICE','test',12000.00),('d4f78fd8-2893-4388-9b01-e5b17d9c43a3','kermit','engineering','Sales Report','2017-06-10 08:57:00','DRAFT','INVOICE','accoutype',12345.00);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal`
--

DROP TABLE IF EXISTS `journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AUTHOR` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `POSTING_DATE` varchar(255) DEFAULT NULL,
  `PERIOD` varchar(255) DEFAULT NULL,
  `REFERANCES` varchar(255) DEFAULT NULL,
  `DOC_TYPE` varchar(255) DEFAULT NULL,
  `COMPANY_CODE` varchar(255) DEFAULT NULL,
  `DOCUMENT_HEADER` varchar(255) DEFAULT NULL,
  `DEBIT_AMOUNT` varchar(255) DEFAULT NULL,
  `CREDIT_AMOUNT` varchar(255) DEFAULT NULL,
  `APPROVER` varchar(255) DEFAULT NULL,
  `EVIDENCE_LOCATION` varchar(255) DEFAULT NULL,
  `DOC_STATE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(255) DEFAULT NULL,
  `JOURNAL_DOC_TYPE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal`
--

LOCK TABLES `journal` WRITE;
/*!40000 ALTER TABLE `journal` DISABLE KEYS */;
/*!40000 ALTER TABLE `journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process`
--

DROP TABLE IF EXISTS `process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process` (
  `process_id` int(11) NOT NULL AUTO_INCREMENT,
  `process_name` varchar(45) DEFAULT NULL,
  `process_description` varchar(45) DEFAULT NULL,
  `process_owner` varchar(45) DEFAULT NULL,
  `process_type` varchar(45) DEFAULT NULL,
  `process_template_id` varchar(45) DEFAULT NULL,
  `process_level` varchar(45) DEFAULT NULL,
  `process_parent_id` varchar(45) DEFAULT NULL,
  `process_hasSibling` int(11) DEFAULT NULL,
  `process_task_mapping_process_task_mapping_id` int(11) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT 'admin',
  `updated_by` varchar(50) DEFAULT NULL,
  `dt_created` timestamp NULL DEFAULT NULL,
  `dt_updated` timestamp NULL DEFAULT NULL,
  `isLeaf` tinyint(4) DEFAULT '0',
  `expanded` tinyint(4) DEFAULT '0',
  `enabled` tinyint(4) DEFAULT '0',
  `doc_type` varchar(45) DEFAULT NULL,
  `group_id` varchar(45) DEFAULT NULL,
  `department_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`process_id`),
  UNIQUE KEY `process_name_UNIQUE` (`process_name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process`
--

LOCK TABLES `process` WRITE;
/*!40000 ALTER TABLE `process` DISABLE KEYS */;
INSERT INTO `process` VALUES (13,'TestWorkflow','testData','userFC2','Form Sumission','2','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'BOOK_REPORT','user','CT,FC'),(14,'Test_subprocess','test Desc','userFC2',NULL,'1',NULL,'13',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL),(15,'saxbAK','LJHLKH','userCT1','Form Sumission','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'BOOK_REPORT','Admin',NULL),(16,'Halhj','LHL','userCT1',NULL,'1',NULL,'15',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_department_mapping`
--

DROP TABLE IF EXISTS `process_department_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process_department_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_id` int(11) DEFAULT NULL,
  `department_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_department_mapping`
--

LOCK TABLES `process_department_mapping` WRITE;
/*!40000 ALTER TABLE `process_department_mapping` DISABLE KEYS */;
INSERT INTO `process_department_mapping` VALUES (33,6,'CT'),(34,11,'FC'),(35,11,'PR'),(36,13,'CT'),(37,13,'FC');
/*!40000 ALTER TABLE `process_department_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_userfom`
--

DROP TABLE IF EXISTS `process_userfom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process_userfom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_id` int(11) DEFAULT NULL,
  `group_id` varchar(45) CHARACTER SET big5 DEFAULT NULL,
  `created_by` varchar(45) DEFAULT 'SYSTEM_USER',
  `doctype` varchar(45) DEFAULT NULL,
  `user_id` varchar(45) DEFAULT NULL,
  `json_data` text,
  `userform_name` varchar(45) NOT NULL,
  `actual_json_data` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userform_name_UNIQUE` (`userform_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_userfom`
--

LOCK TABLES `process_userfom` WRITE;
/*!40000 ALTER TABLE `process_userfom` DISABLE KEYS */;
INSERT INTO `process_userfom` VALUES (4,NULL,NULL,'SYSTEM_USER',NULL,'admin','[{\"name\":\"text-1503226028207\",\"label\":\"User Name\",\"required\":null,\"type\":\"text\",\"value\":null,\"subtype\":\"text\",\"fieldId\":null,\"userFromId\":null,\"jsonData\":\"null\",\"values\":null,\"class\":null},{\"name\":\"select-1503226049140\",\"label\":\"Banks\",\"required\":\"true\",\"type\":\"select\",\"value\":null,\"subtype\":null,\"fieldId\":null,\"userFromId\":null,\"jsonData\":\"[{\\\"value\\\":\\\"option-1\\\",\\\"label\\\":\\\"Option 1\\\"},{\\\"value\\\":\\\"option-2\\\",\\\"label\\\":\\\"Option 2\\\"},{\\\"value\\\":\\\"option-3\\\",\\\"label\\\":\\\"Option 3\\\"}]\",\"values\":[{\"value\":\"option-1\",\"label\":\"Option 1\"},{\"value\":\"option-2\",\"label\":\"Option 2\"},{\"value\":\"option-3\",\"label\":\"Option 3\"}],\"class\":null},{\"name\":\"radio-group-1503226050857\",\"label\":\"Radio Group\",\"required\":null,\"type\":\"radio\",\"value\":null,\"subtype\":null,\"fieldId\":null,\"userFromId\":null,\"jsonData\":\"[{\\\"value\\\":\\\"option-1\\\",\\\"label\\\":\\\"Option 1\\\"},{\\\"value\\\":\\\"option-2\\\",\\\"label\\\":\\\"Option 2\\\"},{\\\"value\\\":\\\"option-3\\\",\\\"label\\\":\\\"Option 3\\\"}]\",\"values\":[{\"value\":\"option-1\",\"label\":\"Option 1\"},{\"value\":\"option-2\",\"label\":\"Option 2\"},{\"value\":\"option-3\",\"label\":\"Option 3\"}],\"class\":null}]','testForm','[{\"name\":\"text-1503226028207\",\"label\":\"User Name\",\"required\":null,\"type\":\"text\",\"value\":null,\"subtype\":\"text\",\"fieldId\":null,\"userFromId\":null,\"jsonData\":null,\"values\":null,\"class\":null},{\"name\":\"select-1503226049140\",\"label\":\"Banks\",\"required\":\"true\",\"type\":\"select\",\"value\":null,\"subtype\":null,\"fieldId\":null,\"userFromId\":null,\"jsonData\":null,\"values\":[{\"value\":\"option-1\",\"label\":\"Option 1\"},{\"value\":\"option-2\",\"label\":\"Option 2\"},{\"value\":\"option-3\",\"label\":\"Option 3\"}],\"class\":null},{\"name\":\"radio-group-1503226050857\",\"label\":\"Radio Group\",\"required\":null,\"type\":\"radio-group\",\"value\":null,\"subtype\":null,\"fieldId\":null,\"userFromId\":null,\"jsonData\":null,\"values\":[{\"value\":\"option-1\",\"label\":\"Option 1\"},{\"value\":\"option-2\",\"label\":\"Option 2\"},{\"value\":\"option-3\",\"label\":\"Option 3\"}],\"class\":null}]'),(5,NULL,NULL,'SYSTEM_USER',NULL,'admin','[{\"name\":\"select-1503226123056\",\"label\":\"Select\",\"required\":null,\"type\":\"select\",\"value\":null,\"subtype\":null,\"fieldId\":null,\"userFromId\":null,\"jsonData\":\"[{\\\"value\\\":\\\"option-1\\\",\\\"label\\\":\\\"Option 1\\\"},{\\\"value\\\":\\\"option-2\\\",\\\"label\\\":\\\"Option 2\\\"},{\\\"value\\\":\\\"option-3\\\",\\\"label\\\":\\\"Option 3\\\"}]\",\"values\":[{\"value\":\"option-1\",\"label\":\"Option 1\"},{\"value\":\"option-2\",\"label\":\"Option 2\"},{\"value\":\"option-3\",\"label\":\"Option 3\"}],\"class\":null},{\"name\":\"radio-group-1503226124131\",\"label\":\"Radio Group\",\"required\":null,\"type\":\"radio\",\"value\":null,\"subtype\":null,\"fieldId\":null,\"userFromId\":null,\"jsonData\":\"[{\\\"value\\\":\\\"option-1\\\",\\\"label\\\":\\\"Option 1\\\"},{\\\"value\\\":\\\"option-2\\\",\\\"label\\\":\\\"Option 2\\\"},{\\\"value\\\":\\\"option-3\\\",\\\"label\\\":\\\"Option 3\\\"}]\",\"values\":[{\"value\":\"option-1\",\"label\":\"Option 1\"},{\"value\":\"option-2\",\"label\":\"Option 2\"},{\"value\":\"option-3\",\"label\":\"Option 3\"}],\"class\":null}]','t1','[{\"name\":\"select-1503226123056\",\"label\":\"Select\",\"required\":null,\"type\":\"select\",\"value\":null,\"subtype\":null,\"fieldId\":null,\"userFromId\":null,\"jsonData\":null,\"values\":[{\"value\":\"option-1\",\"label\":\"Option 1\"},{\"value\":\"option-2\",\"label\":\"Option 2\"},{\"value\":\"option-3\",\"label\":\"Option 3\"}],\"class\":null},{\"name\":\"radio-group-1503226124131\",\"label\":\"Radio Group\",\"required\":null,\"type\":\"radio-group\",\"value\":null,\"subtype\":null,\"fieldId\":null,\"userFromId\":null,\"jsonData\":null,\"values\":[{\"value\":\"option-1\",\"label\":\"Option 1\"},{\"value\":\"option-2\",\"label\":\"Option 2\"},{\"value\":\"option-3\",\"label\":\"Option 3\"}],\"class\":null}]'),(6,NULL,NULL,'SYSTEM_USER',NULL,'admin','[{\"name\":\"select-1503226123056\",\"label\":\"Select\",\"required\":null,\"type\":\"select\",\"value\":null,\"subtype\":null,\"fieldId\":null,\"userFromId\":null,\"jsonData\":\"[{\\\"value\\\":\\\"option-1\\\",\\\"label\\\":\\\"Option 1\\\"},{\\\"value\\\":\\\"option-2\\\",\\\"label\\\":\\\"Option 2\\\"},{\\\"value\\\":\\\"option-3\\\",\\\"label\\\":\\\"Option 3\\\"}]\",\"values\":[{\"value\":\"option-1\",\"label\":\"Option 1\"},{\"value\":\"option-2\",\"label\":\"Option 2\"},{\"value\":\"option-3\",\"label\":\"Option 3\"}],\"class\":null},{\"name\":\"radio-group-1503226124131\",\"label\":\"Radio Group\",\"required\":null,\"type\":\"radio\",\"value\":null,\"subtype\":null,\"fieldId\":null,\"userFromId\":null,\"jsonData\":\"[{\\\"value\\\":\\\"option-1\\\",\\\"label\\\":\\\"Option 1\\\"},{\\\"value\\\":\\\"option-2\\\",\\\"label\\\":\\\"Option 2\\\"},{\\\"value\\\":\\\"option-3\\\",\\\"label\\\":\\\"Option 3\\\"}]\",\"values\":[{\"value\":\"option-1\",\"label\":\"Option 1\"},{\"value\":\"option-2\",\"label\":\"Option 2\"},{\"value\":\"option-3\",\"label\":\"Option 3\"}],\"class\":null},{\"name\":\"select-1503226144126\",\"label\":\"Select\",\"required\":null,\"type\":\"select\",\"value\":null,\"subtype\":null,\"fieldId\":null,\"userFromId\":null,\"jsonData\":\"[{\\\"value\\\":\\\"option-1\\\",\\\"label\\\":\\\"Option 1\\\"},{\\\"value\\\":\\\"option-2\\\",\\\"label\\\":\\\"Option 2\\\"},{\\\"value\\\":\\\"option-3\\\",\\\"label\\\":\\\"Option 3\\\"}]\",\"values\":[{\"value\":\"option-1\",\"label\":\"Option 1\"},{\"value\":\"option-2\",\"label\":\"Option 2\"},{\"value\":\"option-3\",\"label\":\"Option 3\"}],\"class\":null},{\"name\":\"textarea-1503226145169\",\"label\":\"Text Area\",\"required\":null,\"type\":\"textarea\",\"value\":null,\"subtype\":\"textarea\",\"fieldId\":null,\"userFromId\":null,\"jsonData\":\"null\",\"values\":null,\"class\":null},{\"name\":\"starRating-1503226146226\",\"label\":\"Star Rating\",\"required\":null,\"type\":\"starRating\",\"value\":null,\"subtype\":null,\"fieldId\":null,\"userFromId\":null,\"jsonData\":\"null\",\"values\":null,\"class\":null},{\"name\":\"text-1503226147672\",\"label\":\"Text Field\",\"required\":null,\"type\":\"text\",\"value\":null,\"subtype\":\"text\",\"fieldId\":null,\"userFromId\":null,\"jsonData\":\"null\",\"values\":null,\"class\":null}]','t2','[{\"name\":\"select-1503226123056\",\"label\":\"Select\",\"required\":null,\"type\":\"select\",\"value\":null,\"subtype\":null,\"fieldId\":null,\"userFromId\":null,\"jsonData\":null,\"values\":[{\"value\":\"option-1\",\"label\":\"Option 1\"},{\"value\":\"option-2\",\"label\":\"Option 2\"},{\"value\":\"option-3\",\"label\":\"Option 3\"}],\"class\":null},{\"name\":\"radio-group-1503226124131\",\"label\":\"Radio Group\",\"required\":null,\"type\":\"radio-group\",\"value\":null,\"subtype\":null,\"fieldId\":null,\"userFromId\":null,\"jsonData\":null,\"values\":[{\"value\":\"option-1\",\"label\":\"Option 1\"},{\"value\":\"option-2\",\"label\":\"Option 2\"},{\"value\":\"option-3\",\"label\":\"Option 3\"}],\"class\":null},{\"name\":\"select-1503226144126\",\"label\":\"Select\",\"required\":null,\"type\":\"select\",\"value\":null,\"subtype\":null,\"fieldId\":null,\"userFromId\":null,\"jsonData\":null,\"values\":[{\"value\":\"option-1\",\"label\":\"Option 1\"},{\"value\":\"option-2\",\"label\":\"Option 2\"},{\"value\":\"option-3\",\"label\":\"Option 3\"}],\"class\":null},{\"name\":\"textarea-1503226145169\",\"label\":\"Text Area\",\"required\":null,\"type\":\"textarea\",\"value\":null,\"subtype\":\"textarea\",\"fieldId\":null,\"userFromId\":null,\"jsonData\":null,\"values\":null,\"class\":null},{\"name\":\"starRating-1503226146226\",\"label\":\"Star Rating\",\"required\":null,\"type\":\"starRating\",\"value\":null,\"subtype\":null,\"fieldId\":null,\"userFromId\":null,\"jsonData\":null,\"values\":null,\"class\":null},{\"name\":\"text-1503226147672\",\"label\":\"Text Field\",\"required\":null,\"type\":\"text\",\"value\":null,\"subtype\":\"text\",\"fieldId\":null,\"userFromId\":null,\"jsonData\":null,\"values\":null,\"class\":null}]');
/*!40000 ALTER TABLE `process_userfom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(45) DEFAULT NULL,
  `task_description` varchar(45) DEFAULT NULL,
  `task_owner` varchar(45) DEFAULT NULL,
  `task_type` varchar(45) DEFAULT NULL,
  `task_parent_id` varchar(45) DEFAULT NULL,
  `task_hasSiblings` varchar(45) DEFAULT NULL,
  `task_status` varchar(45) DEFAULT NULL,
  `task_start_rule` int(11) DEFAULT NULL,
  `task_completion_rule` int(11) DEFAULT NULL,
  `task_input_params` int(11) DEFAULT NULL,
  `task_retry_count` int(11) DEFAULT NULL,
  `task_failure_action_id` int(11) DEFAULT NULL,
  `process_id` int(11) NOT NULL,
  `task_actor` varchar(20) NOT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_from_mapping`
--

DROP TABLE IF EXISTS `user_from_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_from_mapping` (
  `user_form_mapping_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `subtype` varchar(45) DEFAULT NULL,
  `required` varchar(45) DEFAULT NULL,
  `label` varchar(45) DEFAULT NULL,
  `class` varchar(45) DEFAULT NULL,
  `process_userform_id` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`user_form_mapping_id`),
  KEY `user_from_mapping_id_idx` (`subtype`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_from_mapping`
--

LOCK TABLES `user_from_mapping` WRITE;
/*!40000 ALTER TABLE `user_from_mapping` DISABLE KEYS */;
INSERT INTO `user_from_mapping` VALUES (1,'text-1503226028207','text','text',NULL,'User Name',NULL,4,'null'),(2,'select-1503226049140','select',NULL,'true','Banks',NULL,4,'[{\"value\":\"option-1\",\"label\":\"Option 1\"},{\"value\":\"option-2\",\"label\":\"Option 2\"},{\"value\":\"option-3\",\"label\":\"Option 3\"}]'),(3,'radio-group-1503226050857','radio',NULL,NULL,'Radio Group',NULL,4,'[{\"value\":\"option-1\",\"label\":\"Option 1\"},{\"value\":\"option-2\",\"label\":\"Option 2\"},{\"value\":\"option-3\",\"label\":\"Option 3\"}]'),(4,'select-1503226123056','select',NULL,NULL,'Select',NULL,5,'[{\"value\":\"option-1\",\"label\":\"Option 1\"},{\"value\":\"option-2\",\"label\":\"Option 2\"},{\"value\":\"option-3\",\"label\":\"Option 3\"}]'),(5,'radio-group-1503226124131','radio',NULL,NULL,'Radio Group',NULL,5,'[{\"value\":\"option-1\",\"label\":\"Option 1\"},{\"value\":\"option-2\",\"label\":\"Option 2\"},{\"value\":\"option-3\",\"label\":\"Option 3\"}]'),(6,'select-1503226123056','select',NULL,NULL,'Select',NULL,6,'[{\"value\":\"option-1\",\"label\":\"Option 1\"},{\"value\":\"option-2\",\"label\":\"Option 2\"},{\"value\":\"option-3\",\"label\":\"Option 3\"}]'),(7,'radio-group-1503226124131','radio',NULL,NULL,'Radio Group',NULL,6,'[{\"value\":\"option-1\",\"label\":\"Option 1\"},{\"value\":\"option-2\",\"label\":\"Option 2\"},{\"value\":\"option-3\",\"label\":\"Option 3\"}]'),(8,'select-1503226144126','select',NULL,NULL,'Select',NULL,6,'[{\"value\":\"option-1\",\"label\":\"Option 1\"},{\"value\":\"option-2\",\"label\":\"Option 2\"},{\"value\":\"option-3\",\"label\":\"Option 3\"}]'),(9,'textarea-1503226145169','textarea','textarea',NULL,'Text Area',NULL,6,'null'),(10,'starRating-1503226146226','starRating',NULL,NULL,'Star Rating',NULL,6,'null'),(11,'text-1503226147672','text','text',NULL,'Text Field',NULL,6,'null');
/*!40000 ALTER TABLE `user_from_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow`
--

DROP TABLE IF EXISTS `workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_type` varchar(45) DEFAULT NULL,
  `process_userform_id` int(11) DEFAULT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  `DOC_STATE` varchar(255) DEFAULT NULL,
  `GROUP_ID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow`
--

LOCK TABLES `workflow` WRITE;
/*!40000 ALTER TABLE `workflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_mapping`
--

DROP TABLE IF EXISTS `workflow_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(45) DEFAULT NULL,
  `field_value` varchar(45) DEFAULT NULL,
  `workflow_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_mapping`
--

LOCK TABLES `workflow_mapping` WRITE;
/*!40000 ALTER TABLE `workflow_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_mapping` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-21 18:55:41
