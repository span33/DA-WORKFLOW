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
INSERT INTO `act_ge_bytearray` VALUES ('267502',1,'dynamic-model.bpmn','267501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"da.com\">\n  <process id=\"TEST33___NONE\" isExecutable=\"true\">\n    <startEvent id=\"start\"></startEvent>\n    <userTask id=\"task1\" name=\"First task\" activiti:assignee=\"fred\"></userTask>\n    <userTask id=\"task2\" name=\"Second task\" activiti:assignee=\"john\"></userTask>\n    <endEvent id=\"end\"></endEvent>\n    <sequenceFlow id=\"sequenceFlow-499ac43b-e7cb-4b0d-9156-dbd35d4a09bd\" sourceRef=\"start\" targetRef=\"task1\"></sequenceFlow>\n    <sequenceFlow id=\"sequenceFlow-0587d993-5986-4382-a188-bfd2f976eb06\" sourceRef=\"task1\" targetRef=\"task2\"></sequenceFlow>\n    <sequenceFlow id=\"sequenceFlow-5b44f6ff-99fd-4c3c-8411-69440dda2e91\" sourceRef=\"task2\" targetRef=\"end\"></sequenceFlow>\n    <subProcess id=\"DYNAMIC_SUB_PROCESS\" name=\"Dynamic Document Subprocess\">\n      <startEvent id=\"dynamic_sub_process_start_event\" name=\"Start Dynamic SubProcess\"></startEvent>\n      <endEvent id=\"dynamic_sub_process_end_event\" name=\"End Dynamic SubProcess\"></endEvent>\n      <endEvent id=\"rejectedErrorEndEvent\" name=\"ErrorEnd\">\n        <errorEventDefinition></errorEventDefinition>\n      </endEvent>\n      <sequenceFlow id=\"sequenceFlow-b2d01ffa-4684-480a-9340-b3a43b1aefbd\" sourceRef=\"dynamic_sub_process_start_event\" targetRef=\"APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS\"></sequenceFlow>\n      <exclusiveGateway id=\"exclusivegateway_approval_1_of_1_of_DYNAMIC_SUB_PROCESS\" name=\"Exclusive Approval Gateway 1 of 1 of DYNAMIC_SUB_PROCESS\"></exclusiveGateway>\n      <sequenceFlow id=\"sequenceFlow-63ca93dc-0fac-4728-a381-81003ab71be9\" sourceRef=\"APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS\" targetRef=\"exclusivegateway_approval_1_of_1_of_DYNAMIC_SUB_PROCESS\"></sequenceFlow>\n      <sequenceFlow id=\"docRejectedSubFlow_1_of_1_of_DYNAMIC_SUB_PROCESS\" name=\"Doc Rejected 1 of 1 of DYNAMIC_SUB_PROCESS\" sourceRef=\"exclusivegateway_approval_1_of_1_of_DYNAMIC_SUB_PROCESS\" targetRef=\"rejectedErrorEndEvent\">\n        <extensionElements>\n          <activiti:executionListener event=\"take\" expression=\"${docWorkflowListener.onRejected(execution)}\"></activiti:executionListener>\n        </extensionElements>\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${approved == false}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"docApprovedSubFlow_1_of_1_DYNAMIC_SUB_PROCESS\" name=\"Doc Approved 1 of 1 of DYNAMIC_SUB_PROCESS\" sourceRef=\"exclusivegateway_approval_1_of_1_of_DYNAMIC_SUB_PROCESS\" targetRef=\"COLLABORATE_DOC_USER_TASK_1\">\n        <extensionElements>\n          <activiti:executionListener event=\"take\" expression=\"${docWorkflowListener.onApproved(execution)}\"></activiti:executionListener>\n        </extensionElements>\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${approved == true}]]></conditionExpression>\n      </sequenceFlow>\n      <userTask id=\"APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS\" name=\"Approval (1 / 1 /DYNAMIC_SUB_PROCESS)\" activiti:candidateGroups=\"management\">\n        <extensionElements>\n          <activiti:taskListener event=\"create\" expression=\"${docWorkflowListener.onCreateApproval(execution, task)}\"></activiti:taskListener>\n        </extensionElements>\n      </userTask>\n      <userTask id=\"COLLABORATE_DOC_USER_TASK_1\" name=\"Collaboration (1 / 1)\" activiti:candidateUsers=\"kermit\">\n        <extensionElements>\n          <activiti:taskListener event=\"create\" expression=\"${docWorkflowListener.onCreateCollaborate(execution, task)}\"></activiti:taskListener>\n          <activiti:taskListener event=\"complete\" expression=\"${docWorkflowListener.onCompleteCollaborate(execution, task)}\"></activiti:taskListener>\n        </extensionElements>\n      </userTask>\n      <sequenceFlow id=\"dynamic_collab_subflow_1_1\" name=\"Collaboration SubFlow 1 of 1\" sourceRef=\"COLLABORATE_DOC_USER_TASK_1\" targetRef=\"dynamic_sub_process_end_event\"></sequenceFlow>\n    </subProcess>\n    <sequenceFlow id=\"sequenceFlow-9ffdd741-e032-4422-8880-5dc919148848\" sourceRef=\"task1\" targetRef=\"DYNAMIC_SUB_PROCESS\"></sequenceFlow>\n    <boundaryEvent id=\"REJECTED_ERROR_BOUNDARY_EVENT\" name=\"Rejected Error Event\" attachedToRef=\"DYNAMIC_SUB_PROCESS\">\n      <errorEventDefinition></errorEventDefinition>\n    </boundaryEvent>\n    <sequenceFlow id=\"sequenceFlow-61fdc5e0-61c4-469e-accb-ea5ce17461fe\" name=\"Rejected\" sourceRef=\"REJECTED_ERROR_BOUNDARY_EVENT\" targetRef=\"task1\"></sequenceFlow>\n    <endEvent id=\"Subend\"></endEvent>\n    <sequenceFlow id=\"sequenceFlow-a9085ba0-1261-4356-99d3-02720d78c96f\" sourceRef=\"DYNAMIC_SUB_PROCESS\" targetRef=\"Subend\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_TEST33___NONE\">\n    <bpmndi:BPMNPlane bpmnElement=\"TEST33___NONE\" id=\"BPMNPlane_TEST33___NONE\">\n      <bpmndi:BPMNShape bpmnElement=\"APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS\" id=\"BPMNShape_APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"330.0\" y=\"247.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"rejectedErrorEndEvent\" id=\"BPMNShape_rejectedErrorEndEvent\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"605.0\" y=\"340.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"dynamic_sub_process_start_event\" id=\"BPMNShape_dynamic_sub_process_start_event\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"250.0\" y=\"262.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"COLLABORATE_DOC_USER_TASK_1\" id=\"BPMNShape_COLLABORATE_DOC_USER_TASK_1\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"570.0\" y=\"180.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway_approval_1_of_1_of_DYNAMIC_SUB_PROCESS\" id=\"BPMNShape_exclusivegateway_approval_1_of_1_of_DYNAMIC_SUB_PROCESS\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"480.0\" y=\"259.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"dynamic_sub_process_end_event\" id=\"BPMNShape_dynamic_sub_process_end_event\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"720.0\" y=\"195.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"0.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"820.0\" y=\"15.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"Subend\" id=\"BPMNShape_Subend\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"820.0\" y=\"260.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"task1\" id=\"BPMNShape_task1\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"80.0\" y=\"123.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"REJECTED_ERROR_BOUNDARY_EVENT\" id=\"BPMNShape_REJECTED_ERROR_BOUNDARY_EVENT\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"647.0\" y=\"375.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"task2\" id=\"BPMNShape_task2\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"450.0\" y=\"0.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"DYNAMIC_SUB_PROCESS\" id=\"BPMNShape_DYNAMIC_SUB_PROCESS\" isExpanded=\"true\">\n        <omgdc:Bounds height=\"230.0\" width=\"540.0\" x=\"230.0\" y=\"160.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"dynamic_collab_subflow_1_1\" id=\"BPMNEdge_dynamic_collab_subflow_1_1\">\n        <omgdi:waypoint x=\"670.0\" y=\"210.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"682.0\" y=\"210.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"682.0\" y=\"210.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"720.0\" y=\"210.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-b2d01ffa-4684-480a-9340-b3a43b1aefbd\" id=\"BPMNEdge_sequenceFlow-b2d01ffa-4684-480a-9340-b3a43b1aefbd\">\n        <omgdi:waypoint x=\"280.0\" y=\"277.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"330.0\" y=\"277.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-63ca93dc-0fac-4728-a381-81003ab71be9\" id=\"BPMNEdge_sequenceFlow-63ca93dc-0fac-4728-a381-81003ab71be9\">\n        <omgdi:waypoint x=\"430.0\" y=\"277.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"442.0\" y=\"277.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"442.0\" y=\"279.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"480.0\" y=\"279.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"docApprovedSubFlow_1_of_1_DYNAMIC_SUB_PROCESS\" id=\"BPMNEdge_docApprovedSubFlow_1_of_1_DYNAMIC_SUB_PROCESS\">\n        <omgdi:waypoint x=\"520.0\" y=\"271.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"532.0\" y=\"271.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"532.0\" y=\"210.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"570.0\" y=\"210.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"docRejectedSubFlow_1_of_1_of_DYNAMIC_SUB_PROCESS\" id=\"BPMNEdge_docRejectedSubFlow_1_of_1_of_DYNAMIC_SUB_PROCESS\">\n        <omgdi:waypoint x=\"520.0\" y=\"286.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"532.0\" y=\"286.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"532.0\" y=\"355.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"605.0\" y=\"355.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-0587d993-5986-4382-a188-bfd2f976eb06\" id=\"BPMNEdge_sequenceFlow-0587d993-5986-4382-a188-bfd2f976eb06\">\n        <omgdi:waypoint x=\"180.0\" y=\"140.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"192.0\" y=\"140.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"192.0\" y=\"30.000000000000007\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"450.0\" y=\"30.000000000000007\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-5b44f6ff-99fd-4c3c-8411-69440dda2e91\" id=\"BPMNEdge_sequenceFlow-5b44f6ff-99fd-4c3c-8411-69440dda2e91\">\n        <omgdi:waypoint x=\"550.0\" y=\"30.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"782.0\" y=\"30.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"782.0\" y=\"30.000000000000004\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"820.0\" y=\"30.000000000000004\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-a9085ba0-1261-4356-99d3-02720d78c96f\" id=\"BPMNEdge_sequenceFlow-a9085ba0-1261-4356-99d3-02720d78c96f\">\n        <omgdi:waypoint x=\"770.0\" y=\"275.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"820.0\" y=\"275.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-9ffdd741-e032-4422-8880-5dc919148848\" id=\"BPMNEdge_sequenceFlow-9ffdd741-e032-4422-8880-5dc919148848\">\n        <omgdi:waypoint x=\"180.0\" y=\"165.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"192.0\" y=\"165.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"192.0\" y=\"275.00000000000006\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"230.0\" y=\"275.00000000000006\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-61fdc5e0-61c4-469e-accb-ea5ce17461fe\" id=\"BPMNEdge_sequenceFlow-61fdc5e0-61c4-469e-accb-ea5ce17461fe\">\n        <omgdi:waypoint x=\"662.0\" y=\"405.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"662.0\" y=\"415.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"130.0\" y=\"415.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"130.0\" y=\"279.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"130.0\" y=\"183.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-499ac43b-e7cb-4b0d-9156-dbd35d4a09bd\" id=\"BPMNEdge_sequenceFlow-499ac43b-e7cb-4b0d-9156-dbd35d4a09bd\">\n        <omgdi:waypoint x=\"30.0\" y=\"153.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"80.0\" y=\"153.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>','\0'),('267503',1,'dynamic-model.TEST33___NONE.png','267501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\\\0\0©\0\0\0™%7G\0\0C\çIDATx\Ú\í\Ý”\Õuø7uÍŸuüyN­\í©v·¾\Ö\\·\Õ\Ý\\=¿\Ê\Ãö«\Óz´³ÛºH3$D J\\LEDió\Ï\Z\ZX*¢&¦™‰ ò\'„@Q\Â A‡ŒX\Ð÷\ï¾>ñ™ß?w˜\æ\ï\Ç\ãœÏ™¹÷s\çÞ¹—\á\Î\ç9\ï\Ï\çý9\ê(\0\èÁRJÇ¼ø\â‹-[¶\ì\í\ê\ê\ê4w\î\\K/ó\æ\ÍK‹-ú}a©ò	\0\0e$bkñ\âÅ©¦¦&½õ\Ö[–NZv\îÜ™.\\¸»_ÿ\é§\0\0\ÊDŒl‰­.]oÍ;wŸJ\0\0(±¡\Ø\é:K!¸ø©\0€2\Ç	.\\\ÉO%\0\0ô°\àzý\ÛÓ‹+¦¥µó®Ë–ø<®I‚\0\08‚\àÚ³k[z~Î¸ô\ìc—\×Y\âºX\'”\0\0\Ð\Ê\àÚºö\rb+_^^;S(	.\0\0 µÁµ\î\ÉKW¬J‚\0\0hep=?÷Ú’Áë„’\à\0\0—\à\0\0ºVpÅ¬„¥‚+\Ö	%Á\0\0´2¸6,¹µdp\Å:¡$¸\0\0€V\×k\ÛÖ¤\çŸ\ßpw\Â\Âu±N(	.\0\0 •ÁË¦§\ïi\\qH\\@÷PYYyúW¾ò•k+**f>>WXö–TXöºüPa¹¾OŸ>g{µ\0 #ƒ\ë\Í7Ó†§¦4Ü°p]¬J‚\èšø\îB@(D\Ö\ï\ÅU³–\Â\×<Sø8¬w\ï\Þ\ïñ*@;×ž]\Û\Òú%“K\Ã\ë\â6bIp]K!²þµ°lnIh5²l-,½¼š\0\Ð\ÖÁõ\æ›iû†ù\é¹\ÙW–Œ­|‰\Û\Ämv	. óÅ¨V!’¦b\ë`q<®O·\ÞzkZ²dIÚ¶m[z\ã7RØ·o_ª©©I«W¯NS¦LIƒ\rj,¼\îûõ\ê@\×\áFµŒv	. k\êÕ«\×1…8úUq,\r6,Íž=;\íß¿?5\ÇÁƒ³÷¢øºz\Ñõ] \r‚«9£ZMv	\'Át¼C#[ubkúô\éµ#Y-#_3f\Ìh]u^m\08‚\àjml\å‹p\\@Ç‹\Ý‹\ãh\æÌ™©-\ÄûRß¾}\ë\ì^\è\Õ€#.‹\àº—Cdl\ë\Ø*Ž®z#]½¼\ê\0 ¸PöbW\Â\â\Ùc7\ÂöPo÷Â­Ž\ç\0Á%¸€²\ç\Ù*ž £µ\Çl5ç˜®ziŒñ\ê€\à\\@Y+>©q\ÌFØž\ê\íZ¸\É\Z\0ô\ä_Às\Ëg—\à\Ê÷}¼²²òô\âól5w\ê÷ÖŠ)\ã/¾ø\â\Ú\è\êÓ§\Ï\Ùþ¥\0\è‘ò_†ñ»©_ˆ‚Kp\Ý÷}¼°þ\ÚüvqR\ãŽpû\í·r]\ï_\n€ý‹ºhy¼±¿”\n.Át\ß÷ñ\Â\åùúeË–uHp­^½º\Îy¹üK\àu\ÑRÁ%¸€\îû>^¸ü\\~ýö\í\Û;$¸jjjŠ¿Ÿuþ¥\0ð‹ºñ\åñ\ØEEp	. û¾–·ò\Ë\í5;ac³}ûüKÁ‘ýG¶X,e¾®®µø™´X,­]:Rñ\ãÚ¢†\Ã—Wz\ÜTVô\é\Ó\çü|*_Áe„\è¾\ï\ã…\Ï÷\áÁt_\ÔuB+\×Áµ|ùòô\Ù\Ï~6w\Üq\éø\ãOŸþô§Ó’%K:=^\nO/[\ê_¿p\á\Ât\Î9\ç´\Ë}. #\ß\Ç—Ÿq. sQ/­¨¨ø÷R\'§l‹\àúø\Ç?ž\ÅÇš5kÒªU«²\Ï?ü\áw\Ù\àj‹X\\@Wx7K!. óþ7:¢\ÕÁ£Z/¼ðBƒu;w\îLýû÷¯ýº\à‚\Ò\Ë/¿œ­{é¥—R\áûK\Ç{l:\å”S\ÒÒ¥K³\ë_{\íµ4t\è\Ð\ìöñuÃ†\rK»w\ï®:cÆŒI\'œpBzÿûßŸ~ø\Ãf\ë\âñO?ýô\ì\ë\r\Z\Ôh\Åý\å\×\ç\ëb\Ä\ë\ÔSOÍ¾“O>9\Ý}÷\Ý\Ùõ>úh:\í´Ó²\ë\ã>cTl\ãÆ\r‚ë¦›n\Ê>¿êª«Ð¡\ï\ã…\Û\\\í<\\ ¸€.¬-‚+Ž \áÃ‡g#]ùºf\ëb\ä+þ*\ZŸñ‹_\ÌÖ{\î¹\Ù\å­øø\ÉO~2»>b+.\ßÿýé¡‡\Ê>\è*Gy$=ÿüó\Ù\ç\'tR¶.\â-_±tT3G¸\"¶b·È­[·f×Ÿx\â‰\Ùõñ1.oÚ´)[ŸŸy\æ™u\îc\êÔ©\Ù\Ç<#\\@G«¬¬<=Ÿx¿Ý¿»\Æ\ÖÁƒ\Ó\àÁƒ\ß\É³\Ô	™Á´ap\Å\Çl\Å/ûˆ®ˆ°\ÆF”b‰\ëŠ\×Õ¿¯üú80;–â¯©Kñù\ÑG]ò\ëš\\TcÇŽ\Íbªx]‹Ÿ\ÇW\Ä\ám·Ý–\Ø\ßG¾|\ï{\ß\\@gmÏ­\Èhö\ì\Ù\í\Z\\ñU4ºµ\ép{Q€ÿ ‚W\ÏR˜Õª RaUj\Å\âpŠ+\\ù\å\ÖW\ì\Î—gÎœYg]\ÜG¼>£FÊŽI‹\ë\ãxµ\âû1bDöýÆ®‡‚\èƒóŠ½\Úk¶\ÂxO:t\è\ÛEÁ5Æ«‚\è€\àÊƒ%v»{ú\é§\ë„Ieeev9Ž³\Ê\'Ôˆ\r‹w)ŒÑ±£Šv)\ÌwC,Þ¥0vU<\\pÅ®ŠGÚ¥0ÿºÆ‚+…‹\ã\Âb\"µüûË¿æ¬³Îª\Ý\åñ•W^\É>ÿ\à?\Ø\àq«ªª²ÏŸ|òIÁt¸\Â{\æ»c´)¡\éÓ§·KpÍ˜1£xtkk\ïÞ½\ß\ã\ÕÁt@pÅ±Yù´ð±{_ìŠ—O€±cÇŽ, ò	0\"Šb²Œ|W¾ˆš\Øe/Fˆ\"\ØòI3œ\Ý>–ˆ­ú“f4\\1¡ED[\Ü_|}©\àºë®»²\ã¾\â{½\ï¾û²]\ãq\êO´\ßç—¿ü\å\ì{ûŒ]c‚úû\ØceŸ_xá…‚\è¬mº^…\å@D³f\Íj\ÓØš?~ý)\ê{y\ÕAp\\\Ó\Â]b»nZqµUtElõ\ï\ßÿ`\Ñ}\ß\ë\ÕÁ.Áô(1E\ÄPqt\Åî…±\ëtkÙª·avÞ­Ø…Ñ«\r‚\\‚\è‘\ÑU|2\ä|\"˜½0¦to\î\Ô\ï1ªUo‚Œ,¶·‚\\‚\èñ\Ñuh÷\Â\ÅÁ\Ç\ÓN™2%­X±\"mß¾½v6\ÃÉª©©\ÉÎ¡\'5.„\Ö;õB+Û\Ð\È.@p	.€ÿ;¯Wñì…­\\¶š  ¸@#bTªOŸ>#\n\Û|ZZjc\ìB‚\\‚ y\Û}Ÿ*,W\Ç1^…{¦ðù¾Cq\×\Å1Z…u\ß.¬;;vKôŠ\à—\à\0 ¸,‚\0 ¸,‚\0\\€\à\\\0€\à—Ep€\à—Ep\0‚\\‚\0\\€\à².\0\\€\à².\0@p‚Kp\0‚\èª««…N\×Yö‚ë€ŸJ\0\\@™X´h\Ñöšš\Z±\Ó–mÛ¶=P®u~*@pebþüùÿ¶`Á‚?¾ú\ê«{EO\çlElÍ›7\ï¥\ÂòŸ~*@pe¤°‘þÜ¹sW\Ä\îlq‘¥Ã—x\Ý×‰-\0\\\0\0\0.\0\0\0Á\0\0 ¸\0\0\0\\\0\0\0‚\0\0@p\0\0 ¸\0\0\0\0\0€\à\0\0@p\0\0.\0\0\0Á\0\0€\à\0\0\\\0\0\0‚\0\0\0Á\0\0 ¸\0\0\0\0\0\0‚\0\0@p\0\0.\0\0\0\0\0€\à\0\0\\\0\0\0.\0\0\0Á\0\0 ¸\0\0\0\\\0\0\0‚\0\0@p\0\0 ¸\0\0\0\0\0€\à\0\0@p\0\0.\0\0\0Á\0\0€\à\0\0\\\0\0\0‚\0\0\0Á\0\0 ¸\0\0\0\0\0\0‚\0\0@p\0\0.\0\0\0\0\0€\à\0\0\\‚\0\0@p\0\0.\0\0\0\0\0€\à\0\0\\\0\0\0.\0\0\0Á\0\0 ¸\0\0\0\\\0\0\0‚\0\0@p\0\0 ¸\0\0\0\0\0ô`)¥c^|ñÅ‡–-[övuuuš;w®¥ƒ—yó\æ¥E‹ý¾°T	.\0\0(#[‹/N555é­·Þ²tÒ²s\çÎ´p\á\ÂÝ…øúOÁ\0\0e\"F¶\ÄV—‰®·\æÎ»Np\0@™ˆ\Ý\ÅN\×Y\nÁu@p\0@™ˆcˆ„N—\n®”\à\0€2®\×ÿ¸=½¸bZZ;\ïºl‰\Ï\ã:‘$¸\0\0€#®=»¶¥\ç\çŒK\Ï>vy%®‹uBIp\0\0­®­k\Ñ ¶ò\å\åµ3…’\à\0\0Z\\ëž¼±dp\Å:¡$¸\0\0€V\×ós¯-\\±N(	.\0\0@p	.\0\0 kW\ÌJX*¸bP\\\0\0@+ƒkÃ’[KW¬J‚\0\0hep½¶mMzþ‰ñ\rw\',\\ë„’\à\0\0Z\\±lzúžÁ×‰$Á\0@—Rz÷š5k†NŸ>}\á\r7Ü°{Ô¨Q˜bcµªª\êK.¹ä­«®º\ê\Åo¼ñ¾\Âò·‚«\Þò\æ›i\ÃSS\Z\îNX¸.\Ö	%Á\0@\r­‡~øžë¯¿þÀ\èÑ£\Ó\í·ßž–-[–¶mÛ–ö\íÛ—B|¬©©I+W®L… K_û\Ú\×\Þùú×¿¾yÈ!ƒ\×[iÏ®miý’\É%\áŠuq±$¸\0\0\èA\na5h\âÄ‰o^~ù\åYL<x05\×\êÕ«\ÓW\\qp\èÐ¡\ëz÷\îý±\\o¾™¶o˜Ÿž›}e\É\ØÊ—¸M\Ü\ÖhWû×—¾ô¥ÿ\ë\Â/ü|EE\Å\ÄBlý*‚«ð3ú\çþ\Ç\0\Ð!\n½tÌ£>:Ø°ai\æÌ™-\n­úfÏž\r\Z´·œG»\Z®Ãj\í\ê¸\àj$°ö–Å…\åú\Âòÿb\ëxÿ\ë\0\è°\ØZ°`Áò‘#G¦õ\ë×§¶°yó\æTˆ·½ƒ¾´§WsFµš\Z\íN­_üñ$°\0\0\è’bd+b+Ž\ÉjKqC†\ÙS\Ø®\ê	Á\Õ\Ú\Ø\Ê\áÔº\å7\ÞHH\0€.\'ŽÙŠ\Ý\Ûjd«±‘®þýû\ï*D\×)\å\\–\Î[\æÌ™c\0\0º–˜ðº\ë®{+Ž\ÙjO=ö\ØÞ¾}û.\\–®2K!\0\0´»Gy\ä\Ç1\áþýûS{>|øŽrÚµPp	.\0\0()F·\â<[1õ{Gxö\Ùg\ß*§Q.Á%¸\0\0 ¤5k\Ö‰2Ždú÷–\Z4hÐŽ¯|\å+Ó•_—ŠŠŠ¹…\å3‚Kp\0@«MŸ>}\áwÜ‘:Ò¤I“V‚kLW~]â„¸±Dxõ\é\Ó\çlÁ%¸\0\0 \Ån¸\á†\ÝË–-\ë\Ð\àzê©§6bffw®¢\åñ\ÆF¼—\à\0€’F\Zu`ûö\í\Z\\;v\ì¨)\Ì\Ön\\µ#^\Å\á%¸\0\0”4p\àÀ´oß¾\r®x¼B¼\ì\ëŽÁU<\â»\Z\n.Á\0\0M†EghF\Ðt‹Ep	.\0\0(iÀ€\ïtô\×Þ½{wt\ã®}úô9¿W¯^\Ç\Ä\í—\à\0€’FŽùVG\Ãõ\Ê+¯ü¶\ÃU\'´r\\…‡i°_ßšû\\¸pa:\çœsZ¼®¥ß³\à\0 G7nÜ†Žž¥pÎœ9³º\Ñ,…K+**þ½~huFpu\Ô}¶\Å\ã	.\0\0(¸ù\æ›\ï\è\èóp?þ±np®FG´ºRp\Õ\ÈhWŒLy\æ™\Ùu>úh:\í´\ÓÒ±\Ç›Ž?þøl\ÝÆ\Óq\Ç\×`´,_\Z[#^§žzjv?\'Ÿ|rºûî»›¼ÿú\ß\ÛM7Ý”}~\ÕUW	.\0\0z–«¯¾úÿŒ1\â\íƒv\Ø$…•••Aó7\åðúu•]\nóÏ«««c—\Í\ìºO<1»nÓ¦Miùò\å\Ù\çyŒÕ‚®ˆ­øú­[·f\×\Çý6÷þ§Nš}4h.\0\0z¦o|\ã¿[¹reG\íNx_!¶—\Ëk\×\ÕF¸b”|ý§?ý\é\ìº:÷\Üs\Óm·Ý–v\î\Ü\Ù\â\àŠ \Z;vlS\Å\ëšsÿùò½\ï}Op\0\Ð3}õ«_\í}\Ùe—\è€Q®]•••«***ªWûWñúˆ¯øþF\Z•>ü\ág\ë?þñ·8¸N9\å”\ìòÌ™3\ë¬k\Îý1\"\Û\Ý0v=\\-³|ùòÿgøð\á>ñ‰O8ª‘QN‹\Åb±X,––.úÐ‡ö¶×¦>\n\ê`C‡]\Ô\í)Ž‹Ñ­\Ã%¸\Ú&¸\Î:\ë¬ìº¥K—f»\Æ\çü\à³u\'œpBvy÷\î\ÝuF\Å\Z[—×µjÕª:\Ó\Ôýß®ªª*ûü\É\'Ÿ\\-ˆ­‚ƒ\çŸ~Z±bE‡Ÿœ\0(?H\Ï=÷\\º\à‚\Þy\ï{ß»^tu°8¦jÐ A{×¯_\ß.ÿÀkÖ¬y´ð\Û+**N)§×­+\×K/½”¾ü\å/g#L±\Û_\ì`Äº»\îº+t\ÒI\éè£N÷\Ýw_¯«¿.vŒ\èŠã°Š§©û/¾\Ýc=–}~\á…¶ûk5gÎœ²®K/½tc\Ä\0@{ø\Â¾°³°\Éñm\ÔÁªªªú:ôššš6ý}ù\å—UYYùR9\íJØ‘ÁeiÞ²w\ï\ÞÔ¿ÿ˜\Ê]Ÿ>}~Zøy›Pø¼ðiŸ\Óz÷\îý\ç\Ý\é\ç*v#Œ‘-\0€ö°v\í\Úÿ-lrlP@ oß¾ƒ†²§­Fºbd+b«°\Ñ{E9¾^‚«k-1\ÂUˆ­#¸\"¼\n\Ñõ›Â²¯›…˜\Ý€v»\Ú#‰\ÎP\ØýJUU\Õ\îŸÿü\ç¯ÁD\Z»n¹\å–i±aaX®¯•\à\êZK©c¸\"¬J„X\ê¢\ÇúM\0\0´+Á\ÕŽéª¬¬¬:t\èŽU«V\ímÁ¿Ý¾\'žxbF!\ØV\Ä\åvÌ–\à\êžÁ\Õ\Ä\ÏyW}£ñ[\0\0\\=$¼þ3\Âk\àÀ57\Üp\Ã\Ú_ý\êW/mÛ¶m{¾»\ÓÞ½{w¼ò\Ê+¿7o\Þ/¯½ö\Ú\Çûö\íûb„VŒj•\Ól„‚Kpu\Å\à:ªhš\×÷¾÷½\é\ë_ÿz¶‹@xónñ\í»\Òs8O=õTŒš6º\î™gžI\çœsN6	ML6ó™\Ï|&;ix[¿¦\0 ¸º\ç±]ª¨¨]\Ø@}¨°l:tLL:ôqka™YX\Æ\Ä\ÈXOz]—\à\ê\nÁ&Ožœ}\'©\î†oö\Ýú947Žþöoÿ6[·nÝºlZ\Þøü¯þ\ê¯\0‚—\à\ê\êÁ•O\Çð1r’oØ‡ø—\Ï>û\ìÚ¯‰¨‰s®ý\Å_üEv*€|t\æ\ïþ\î\ï²iþ?ðd§(~œú§\Ê\Ö\ÅH\Ôu\×]\çñ\ÈFk\â¶<ð@ƒ\ï)\Î\Ïö¹\Ï}.ûšO|\â\éé§Ÿnös{ö\ìI—\\rI6\Zsé¥—\ÖN&R\ê¾\ë\ÇIñ\å–<8\ÝÀkG£z÷\îò\\K½†ù9\ëJR\ÜO\\¿q\ã\Æ\ÃFUc\ß÷!C²û8\ãŒ3j\ï#_§mˆuÿðÿ\Ð`]Œ¸ýó?ÿs«_Ó¦^‹8\í\Ã\ßÿý\ßg_\ëâ±¶l\Ùr\Øu\0.\\‚«[W~96n|ðÁ\ìók®¹&»þê«¯\Î.G\ä_\':ÿ\ío›}\ç][±\ÛÛŽ;²\ëO<ñ\Ä:óè£\Æij/?ò\È#ió\æ\Íu\î£ø{:\ï¼ó²\Ïc\Ã=>F4÷9„ƒ¸\Ï\'+>@hê¾›.\Íyùy\çb$j\íÚµ\Ù\ç\çž{nûi\ì5lj4\ê–[n\É\ÖE¤9²6ˆ›û}GÀ\ä\çµ\Ëw[,~Nùº\Ïþóu\Ö-Z´(ýþ÷¿oõk\Ú\Ôk?#q9^\ÏøÙ‰\Ïó¸kj\0‚—\à\ê¶Áõö\Ûo§}\èC\éoþ\æo²\ë?úÑfAP|R\êâ¯‰“\\‡\Ø0¾ò\Ê+³\â\Æ6ø[!ñi\Ís(þúx>±\Ä\çq]S÷\Ý\Ü\ï\íp—\ëV?vS¯\á\ávÿ‹c¶\"`\"º\âva\Íý¾{š».×š×´©\×\"M³¶\Ûo¿=;\Ü:\0.Á\Õ-w)ŒQª»\Ê\Å\åI“&e/»\ì²\Ãn\Ø\Çndñù\ã?\Þ)ÁUÿ9\ä»\à\ÇA„JGWq¬´\æ1J\ÉG›Š¸¦‚+^›\æ®+Öš×´©\×\"®[°`A6\ÙI\ì\n\Z·‹c\Õ·\0Á‚Kpu«\à\Êw\Ìw#Œclbd!ß­+v}knd\ä:ipå»¨Å¨Nsv)¬ÿò]ÙŠw‹]ñšº\ï8ž*¾q\"\ì\Ö>ªªª\Ú\Ý0ó\×#f<\Ü\×\å#Wq\\Tý@Éƒ6v¯{ö\Ùg\ëHs¾\ï8¾,\áxþ\Å\ë\î¿ÿþ\Úu_úÒ—JWk^Ó¦^‹ü¸À\Ø\r1v[Œ\Ïctõp\ë\0\\ ¸W·	®£M©žb\åb¢ƒX!4\'2b—¯ˆ®Áƒ·Ip\Å.Š±\Ñ\á“\'Dh´\ä9\Ä1QD|O±D\ä<”º\ï˜\è#\"3Fr\â¾Zû<þð‡?\ÔND\Ç,Å¤‡ûº{\î¹\'\Û}3v1\Ì\'\à\È\ÅñOù´ð±>v¹\Ë\'¦h\Î÷\Ç_\ÅóŠcÎŠ\×\ÅqXqŸ±;h¼6¥‚«5¯iS¯E|ŒIGb]|]<~L¾r¸u\0.\\‚«\ËW)1²\Ç\Ê\Ä\Ä\nùeý\Ë\Ò€\àBpYWGWŒ”\ÄHDì®–O\íNy\ÊGª\0@p!¸,‚«ƒ‚\0@p!¸,‚Kp\0‚—\à\\\0€\à‚W]]-tºÎ²¯\\\0Å¶lÙ’–.]š\âwvüa\ÎÒ±Ë¼yóÒ¢E‹Ò†\rü0\n.h¹\Â\Èö8ß‘\Ø\éüeÛ¶m\Þ\Ø\×	.\0Šckñ\â\Å\É\ï\ê\Î]v\îÜ™}ýúõ~(´\Ìüùóÿ­ðò\ÇW_}u¯7\Ô\ÎÙŠØš7o\ÞK…\å?\0¹\Ù[]\'ºb”Á-V\Ø\È?\îÜ¹+bw¶\î8\Ô?cÆŒ\áÑwWˆ\×}]KcKp”?»þw½c­\\\Ð\ã¢cf„G¯^½Ž\é\Ï]p”1“[	.tª>}úœ]ˆŽÿ*¸@O®\×ÿ¸=½¸bZZ;\ïºl‰\Ï\ã:‘$¸p¤ÁõHDÇ¡e…\à\\\0=-¸ö\ìÚ–žŸ3.=û\Ø\åu–¸.\Ö	%Á%¸€\Ö\ÆÆ§òÑ­|)\Øù‚Kpô¤\àÚºö\rb+_^^;S(	.Á´:6f\ÇV>\ÊÕ“Ž\å\\\0‚kÝ“7–®X\'”—\à\Údt+_***þ]p	.€ž\\\ÏÏ½¶dp\Å:¡$¸Ðš\Ðx¼±\Ø:´,\\‚@p	.Á%¸€6\Ý\êi\Çr	.\0Á³–\n®X\'”—\àZ\Z3›Š­ž4c¡\à\\–\ÜZ2¸bP\\‚(\çð\\\0´kp½¶mMzþ‰ñ\rw\',\\ë„’\à\\€\à\\\0´2¸b\Ùôô=\r‚+®I‚\ëH,]º4M˜0!1\"õ\ë\×/&&«Ý›(.><?>UWW.ž·\à(\Ó\àzóÍ´\á©)\rw\',\\ë„’\àj‰7\Þx#Mš4)UUU¥f\ÂQ\'À&Ožœv\í\Ú%¸@xxÞ‚ <‚kÏ®miý’\É%\áŠuq±$¸š\ãg?ûY\êÛ·o‹B«þRYY™fÍš%¸@xxÞ‚ ×›o¦\í\æ§\çf_Y2¶ò%n·5\Ú%¸š\Z\Õ\Z=zt]c8p`ºõ\Ö[Ó’%KÒ¶mÛ²Û…}ûö¥ššš´zõ\ê4eÊ”4hÐ \á5r\ä\È\Ú\Û.ž·\à\è6Áu¸Q-£]‚«%\ây]t\ÑEubiØ°aiö\ì\ÙiÿþýÍºƒf¯M|]ñý\Ä1^í¹‹¡\à\á!¸\0hó\àjÎ¨VS£]\ÂIplÕ­\éÓ§·zd*F¾fÌ˜\Ñ º\âµ\\ <<oÁ\Ð-‚«µ±•/\ÂIp\åb7\Â\â8š9sf›ý\Ü»\n.ž·\à\èÁe\\m!&\È(>f«­b«øg·8\æ\Úc\"\rÁ\ÂCp ¸W—»@\Ån„\í¡x÷Â˜½°­\ç\\ <\0‚Kpu9qž­\â	2\Úk6Á8¦«x\"›nºIpðð¼€à²”wpŸ\Ô8f#l\ïŸ\áü±bT­-\'\Ð\\ <\0\Z<xpz\â‰\'—\à\êðŸ«¥K—\Ö9\ÏVs§~o­˜2þ\â‹/®}\Ì\ê\êjÁ\Â\Ãó\\\0\í+\ßøŒ\r\ä¦6@—\àjëŸ«	&\Ô\Þ.Nj\Ün¿ýö\Ú\Ç?~¼\à\á\áy.€Ž\Ù0Î—hldBp	®¶þ¹\Z1bD\íúeË–u\È÷µzõ\ê:\ç\å\\ <<oÁÐ¡\Æ\Å#\ÅÈ‚Kpµõ\ÏU¿~ýj¯ß¾}{‡|_555µÇ	.ž·\à\è”\r\ãâ‘‰\Ø%Lp	®¶þ¹*¾\Ü^³\Ö³?®\à\á\áy.@\0u‰Epu­¥«þœ´v\é¬ÿc‚„‡\ç-¸€\\]!ð|ðÁÚ©³—®¶þ¹ª¨¨0\Â.ÁÐ³‚«~h\åš\n®8‰\ìG>ò‘t\ì±Ç¦÷¾÷½©²²2mÜ¸ñ°\Ñph#µÁ\çÍ¹}{-.L\çœsN»>\æ\ÝwßN?ýô\\ý\\9†\\‚ \ÇWœiÆŒ%O[*¸n»\í¶lcó_øB6zðè£f—?ù\ÉOv\Ë\àj\ï\ÇØ±cG:é¤“²)\É{Bp5õse–B@p	.€²®R#Z\Í\r®©‰÷\ÚGy¤\Ñõ¯½öZ\Z:th:þø\ã\Óq\Ç—†\r–v\ï\Þ\Ýdp\Å(Ó©§žš˜|ò\ÉÙˆPñmb¦»¸¿x\ì^x¡Ù#Wgžyf\ÉÇˆ¯\Ëo\Û\Ø÷Õœ\Ç3fL:\á„\Òû\ßÿþô\Ãþ°Á\ë1nÜ¸\ìv=öXYWs~®&Nœ\è<\\€\à\\\0\å\\\ÍU*¸\"X\â½6úKJ¬¿ÿþû\ÓC=”}¡\ÒTpE-_¾<mÝº5»\î\ÄO¬s›E\ËG\Òò\Ýÿšó81\Û\â+¯¼Ò¬\ÇhlÄ«9\áùüó\ÏgŸ\ÇHV©@Ý³gOYWs,]º´\ÎH\Øþýû\Ûõñ<XgvÄ¦Nô-¸@xxÞ‚\\]\"¸Ž>ú\èlc3F\Z[Ÿ\Z\Åî†±\Ä\çq]SÁµiÓ¦4v\ì\Øl4ª±\Û4v_\Íyœ¸>ÿ¾÷WsŸK~9^›RZ\î“f´d$, Ù³g·û\ÏpþX}ûö=ì¨®\à\á\áy.@puzpÅ±ZM\íR»\ßÕ”\Øå®©\à:\å”S²\ÏgÎœy\Ø\àŠûo\É\ã\ä\Ë\á£±\àj\ÉcU\âX°<\Ú×Ÿü\à?¨ -l¯\Ù\n\ã\ß+F(óÇŠ‰^Ú’\à\á!¸\0W»\×Ô©S³\Íó\Î;/Û¨}øá‡³\Ëû\ØÇ²õ±«Xý\Ýðb²‚¦‚+’U«V5z›ûî»¯6”\Î=÷\Ü=Nýð©ÿPù.’yT\å\ëZò¥‚ë¬³Îª³f©\×\à¨\ÃL\ÞQ.Á£MyMŸ>½]\'&\î\È#f\ÑÜµk—\à\á\áy.@puý\àŠ%&‡ˆc“bw¹Š\ãª\âøœ|¢‰˜\ä\"\'–”\Ã\ÅF\Ì|·4hP£·‰‘Šx¬]Û°aC‹§xv\Å\Æã®»\îÊŽ½Š\Ý#ìŽª7iFs£T0}\ë[ßª=MpýÉ¬Y³\êL!—\Û\Òüùó\ÛõþÁ ¸\Ú5¸,-›þ}\ï{_\íd=}—\Â\Ü\èÑ£\Û%Š\"¶ú÷\ï_{¿#GŽl—\ï_pð\\\0‚Kpu‘\åž{î©ž^pýI<§ˆ¡\â\èŠ\Ýc·\ÎÖˆ¯+Þ0?\ïV{#&¸@x.\0Á%¸\Êh)·\àÊ£«ød\ÈùD\Z1{aL\é\Þq»\Õ*ž #­¶>nKpðð¼ ¸—\à\êv\ÑU÷\Âü<]S¦LI+V¬HÛ·o¯©Š‘¬ššš´fÍš\ì¤\Æhõ¿6F\Î\ÚkdKpðð¼ ¸—\à\êv\â®\â\Ù[³\Äl„\í1A†\à\á\áy.@p	.Á\Õ\íÅ¨Ô¤I“RUUU‹B+B-Î³Õž»\n.ž·\à—\à\\ecÑ¢Ei\âÄ‰\Ù1^ýúõ«XdqŒ\Ö5\×\\“ª««³×§£	.‚@p	.Á…\à\á\áy.@p	.‹\à\\€\à\\\0‚\Ë\"¸\\ <€\à\\‚Á\Â\Ãó\\€\à\\Á%¸\0Á%¸\0—Ep!¸@xx\Þ~\0‚Kp	.\Ï[p.‹\à\\€\à\\\0‚\Ë\"¸\\ <<oÁ.Á%¸\\ <<oÁÐ¥ƒ«ººZ\è.\Ï[p‚«=,^¼8\Õ\ÔÔˆ.°\ìØ±#`.\Ï[p”IpmÜ¸1-X° ½úê«¢§\Ä\Öúõ\ëýg\\ ¸<oÁP.Á•G\×üùó³\Ý\Ù,³ˆ-Á‚Kp	.€2\r.@pðð¼ ¸\0Á\Â\Ãó\\\0‚ ¸€\à\Ï[p‚\\ <<oÁ ¸@p‚KpÑ¶¶lÙ’–.]šMmlŠ\çŽ_\æÍ›—-Z”6l\Ø\à‡Qp‚„‡\ç-¸\Ê-¶/^œjjjœÀ´—;wf\'°u.Á.ž·\à*#1²%¶ºNt\Å(#‚\\ <<oÁU&b_\ìt%v1Dp‚„‡\ç-¸\ÊDl\àÁ…\àÁ.ÁE\'\×\ëÜž^\\1-­w]¶\Ä\çqH\\‚\\ ¸—\à\â‚kÏ®m\éù9\ãÒ³]^g‰\ëbP\\‚\\ ¸<oÁE+ƒk\ë\Ú_4ˆ­|yy\íL¡$¸ ¸@pyÞ‚‹\Ö×º\'o,\\±N(	.Á.\\ž·à¢•Áõü\ÜkKW¬J‚Kp‚—\ç-¸\\‚Á‚\\‚‹®\\1+a©\àŠuBIpµ·Í›7.@pðð¼Wy×†%·–®X\'”W{ºþú\ë³\r§ø(¸\0ÁÕ¸\Ê\Ê\Ê\Ó\ïU\×VTT\Ì(||®°\ì‰÷®Â²\ï\Ð\å‡\n\Ëõ}úô9[ ¸],¸^Û¶&=ÿ\Äø†»®‹uBIpµ—o¼1ýÙŸýY:\ãŒ3²\×\\s\à\×!|w! F\"\ëw‡\âªYK\ákž)|Ö»w\ï÷(—\à¢W,›ž¾§Ap\Åu\"Ipµwl\å‘#\\\ïz×»:%º®®¦YÿZX6·$´\ZY¶–^jÁ%¸\ÚÄ–-[ÒŒ3²¸Q£F¥fo6UUUiøð\áiÜ¸qi\êÔ©\é\Å_\\õ—7\ßLžš\Òpw\Â\Âu±N(	®öŽ­\Ã]/¸€ž\\1ªUxOšVˆ­ƒ\Åñ\Û5·\ÞzkZ²dIÚ¶m[z\ã7²\×aß¾}©¦¦&­^½:M™2%\r\Z4¨±ðº7\îW5 ¸W«Ìž=;û\Ëø\èÑ£\Ó\í·ßž–-[–½\ÅPñ\ÑÊ•+\Óô\é\Ó\Ó×¾öµt\Ùe—¥iÓ¦	®Â²g×¶´~\É\ä’\ÇpÅº¸X\\m%þ¿6UùúŽ<¦Kp\à\ê\nzõ\êuL\áý\èWÅ±4lØ°l[gÿþý\Íz]<˜ý®‰¯«]\Ù\ÅÁ%¸Zd\ãÆi\âÄ‰\éò\Ë/\Ïb*\Þ`š+þ\nt\ÅW¤K/½4­Y³¦g×›o¦\í\æ§\çf_Y2¶ò%n·5\Ú%¸\Ú*¶S=\Ò%¸@pu‘‘­:±(\ÎG²Z*þ\à{þÔ®ˆ:õ€\à\\‡5kÖ¬\ì/73g\ÎlQh56:öÕ¯~µ¬G»\Z®Ãj\í\\\í!¨\æŽ\\µôö‚W7ß®›VG±\ÓV\Û}ûö­³{¡z@p	®&-Z´(92­_¿¾M\î/\Îÿñ\Çwõ”\àjÎ¨VS£]\ÂIpµ6¶Z:b\ÕQ\Ñ%¸@pu¦Cdl\ë\Ø*\Þ¨7\Ò\ÕKA ¸WÉ‘­ˆ­8&«-\Åý\r2$\Ýy\ç=\"¸Z[ù\"œWG\ÄV[}½\àÁ\Õ\Õw%,ž0v#lõv/\Ü\êx.—\àj ŽÙŠ‘¨¶\Z\Ùjl¤«ÿþ\é™gž)û\à²®Žr¸	2:ú~®®&Î³U<AFk\Ù:œ8¦«\ÞD\ZcT‚Kp\Õq\Ýu×µù{c#hqL—\à²®¶‹­¶\Ú°=Gº®NÜ°ö¤\Æqly{o\×&h ¸º\Øó.¼!\Ì-,Ÿ\éŒ\àŠ7 ˜°¹S¢‰˜¹°œv-\\‚«3\Ô?ö\ê\í·\ßNƒ\Î>¶Dý¯k¯cº®\Î\Ønª¬¬<½ø<[í½]|ñÅµ\ÑÕ§OŸ³•‚«=\ïü?g¼\æ?h»ü¥<¦~\ï\Ï>ûlYr	.Á\ÕY±•DE,}ü\ã\Ï6Ž\âcs£«\Ô×µEt\íÞ½;=ú\è£\é\Úk¯M]tQöÞ–Ÿ»\\µ\ÝTXm~»8©qGˆs–r]¯$\\]0¸Š–\ÇKü\å¦M\ß¶lÙ’M”q$Ó¿·T\×/¼Ð¥\Ñ\Ä_ýŸx\â	Á%¸ºtl\å?«‡6Œš]Å±•/1±MñaZ²{aýÀ*¼weÇŸíª¼g\Ï[¯ ¸:|»©pyF¾~Ù²eòºÅ¹H‹\ÏË¥$\\];¸jÿrS\ï\r¤M\ßbV;î¸£C\ß\Ä\'Ožœnº\é¦.ý‹&ýcc¶ººZp	®NW*‚\Z‹§¦¢«¹·o\ê˜.‚«Wƒ\í¦\Â\å\çò\ë·o\ß\Þ!¯[\Ì\Ì\\ôý¬S®n\\\Å¹94d\Þ\æ1ï¨¿ú\ä–.]š†\Ú-‚+_bŸ\ì\ÆF¼—\àj‘\ÓR±Uj7¿\æFTK\ã¬8º®\î\\\Å\ÛM…\å­ür{\ÍNX_\ì>]ô=\ìS®#û\Ü)K[×¨Q£:\ì¯>¹;v¤\Ê\Ê\Ên\\\Å#^\ÅÌ‚Kpµ\Ç\Èic\Ñs¸cªS-­Ü·¿ý\íôÿñ©w\ï\Þz®º\ÔÚ¥³^;%\à\ê·¢OŸ>\çM-Ú¦o\n1kOGÌžÿõ§;ÿ¢‰¯\Ø`\\‚«=FNajŽRQu\àÀV\ÅVnÂ„	\í~rdÀW[o7>\ßc„ÁESoõC«]Ž\á\ê¬ð)—¿˜	®®µt§¿z65rÚš\Øj*ºþü\Ïÿ¼Õ±u¤\ß ¸:k»©pù\Çp!¸h\ìciEEÅ¿7q²¼6}c0`@‡p\íÝ»·ÛŽp\Å\ëõ\àƒf÷Apu\ï®®\\õGN[:K`s¢\ëHb«~tµõyº\0Á\Õ\ÛMf)DpQÿu.5¢Õ®Á5bÄˆ?†+¯»\ÃU?´rG\\Ÿü\ä\'k7‚7m\Ú\Ô\åc&ÿ^[w÷\Ýw§\ÓO?½\Îu_ü\âKÞ¾+WW]\Î8\ãŒ#úŽ\Ý\ël\Å\å¸þH\Ä÷÷µyóf[¤ ¸ºôvS\á6W;‚‹\Öh\Ó7†˜u¬£g)|ò\É\'»\Í,…qŒ[L_?´Ž4¸ž~ú\é:\ÂS§N\í¶Á“ œt\ÒIÙ„\nqyÍš5\ésŸû\\“\æ®¦ƒþp³\Z\ázzp5Gee\å\éÅ¿\Ï÷\ï\ßß®¯Yœ\Ótð\àÁ\ï\äY\ê„\Ì ¸zXp\Å9¸:ú<\\q®®~®R#Zm\\1;dü[\Æ/€øx\á…6›Xwüñ\Çg#aq¢\è\æ®;\çœsÒ™gž™]÷\Úk¯eq·=\î¸\ãÒ°aÃ²s(\Ýÿý\Ùm«ªª²\Ûõ\ï\ß?»|\ß}÷¥…¦SO=5{\ì±\é\ä“O\ÎF¯š\n®q\ã\Æe\×?ö\Øcµ·‹\Ç\\­9-Ž\Çp‚\ë\ÈF\Âò÷\ÜÙ³g·\ëk¿ƒŠ\Þ\ã75c¯%\\=!¸^|ñ\Ål·\Âø«LG\é×¯_	\å 5Á\ÇÌ½ÿý\ïOù—™Å¿iQ\\_6?üpv\î£ø<FŒš».Žz\å•W²\ë\"¶\âº¬‡z(û<¢+\Ö\Ç\çý\×\Ý\î#ùHvy\ëÖ­Yl-_¾<û<®;ñ\Ä›®Ø•0®©\Â\ãò—¿ü\å\Ú\ç%¸Z7r\Ú\Ú%³‚«®ŠŠŠÁù{oüþk¯\Ù\n\ãwx\áw\î\ÛEÁ5\Æ&+‚Kp\Õ\Z3fLZ¹re‡¼/Z´(;aj¹hMpE,Å¿\ãØ±c³\Ëÿøÿ˜]\Î\ï+\ß Ž7\ïX\âójÉºü±b]©ÛŸv\Úi\Ù\å\Ø\Å3>Fh\Åõq<Y|oõG©JTŒ„5v½\àjý\ÈikF–\Ú\ë<\\Ó¦MK\\pAv®™½ù\æ›\Ó/ù\Ë,ªÁ\Õ\Õ\r8ð\Ý1Ú”‡\Ðô\é\Ó\Û\åõŠ?¢\Å\Ö\Ö\Â{\æ{l²\"¸W­Ÿü\ä\'\é²\Ë.\ëQ®ˆ­;ï¼³G×—¾ô¥F­\É¬±¨Š°\æ®+~¬XWÿö\'œpB¶nøð\á\Ù\åû·\Ë>\ÆhX\\\Ê)§d—\ã·\Í	®<\êWû9Ü¬…Í©–FW{—_~yZ¼xqv¬\áý\×¥Aƒ¥ŠŠŠlò›ø¹‰cAcw\Ô\ßü\æ7­>>\\\í¸-Û«°ÈƒhÖ¬YmúZÍŸ?¿þ.\ã½l®\"¸W±[al`·§8V,‚«%\Ý/·\àŠQ£>:\Û\í.¿î®»\î\Ê~±\å³ü\å\Â÷\ÜsOmôœw\Þy\Í^Wüxù1bÅ»FhÅºür>B\á]P«V­jVpu\ÖY\ÙõqlXsƒ«\Ôýi¤•kp55\Ò\ÕÒˆj\î\íóÇ»\âŠ+J\ÞOV„VW„WX„XY„YZ„ZGp\\Ml\ÏN+Ž¢¶Š®ˆ­þýû,º\ï{mª\"¸W£â˜ª\ØHZ¿~}»\Ül˜\Å\Æ\Ø3\Ï<SV¿Z\Z\\“\'O\Î~‰\ÅDùuñ\Ú\ç¾/½ôR\íç±¯y\ÄY\ìÚ—OßœuÅ“f\ÄIu#¢b‰\Ø\Ê\Ã(>\Æ}\Ä\×\ÄÇ;wf\×\ßv\Ûm\Ùm\ã\ç¡91ô­o}+»>Ž)\\\í?\Òõ®w½«NtÅ¿oKwl,º†\Ò\ìµ¦\Äb—\Ã\Øõ0vAŒc6\ã÷H9ý¡W÷XDGW\ì^\Ø\Ús‘\Æ\×\ÕÛ0;\ïV\ì\ÂhSÁ%¸JŠ\Ù\è\â¯\Ôq–ô¶´mÛ¶l6¼rÚ•°µÁu¤\ç»\êŒ\Ýôš3j÷¾÷½/‹À\îv\â\ã\î\Z]\Åi\ÇSK&\Â(õu\í1õ{W?\Ñ9PþÁ•GWñÉó‰4bö\Â\æV·‹Q­zdd±\å¸-—\àj–8a_ü¥»­Fºbd+b\ë¿ÿû¿\ËòR{W>\Z\Õ\Òu¹\Ä.ŽùTô‚«ý\Õß½0b)þß¶ôø©ú_w¤\çÿ\\ ¸º\ÉH×´\âcºò\Ùc§L™’V¬X‘¶o\ß^»+tŒd\Å¢\ã“±T­w\Z9Ÿ\â½F¶\\‚«EbV²\Ø\r\è\ç?ÿùM¤#Z±a¼A•«ö.‹\àjMtµ\Å\ÈYý\Ý®2Þ¾\íU<{a+—­&\È@p	®V‹\ãŠ\â/ß—\\rI‹»Šƒ\ä\ãøŸ˜ £ÜŽ\Ù\\‚«£«½Oj,¸@puE1*Õ§OŸ…÷¨\r-­µ1v!Dp	®6q\ï½÷f\áñô?ÿó?iÉ’%\é\å—_®=\Èt\ïÞ½\Ù\Ð{œ_ë¦›n\ÊF\Æ\â¶1ª\Õ’\\‚«³\én€\íµ¡\àÁ\ÕÍ¶w?UX®Žc¼\nöL\áó}‡\â*>®‹c´\n\ë¾]Xwv\ì–hsÁ%¸\Ú\ÜÆ\Ó-·Ü’\Ír×·o\ß:\é\É\Ï\ÅÁ#c=‰\à\\])ºZ:B\Õd.\\€\à\\.ÁUvZº[`{\ïF(¸@p‚Kp!¸WŒ®˜U²©“\Z.@p\à\\.‹\àj\Ä\áŽ\É\Êg#\ì¨\Ø\\ ¸\0Á%¸\\‚«GŒtu\än„‚ ¸‚Kpõ˜\è\ê¬\Ø\\ ¸\0Á%¸\\‚«¬£\ëŒ3\Î\è´\Ø\\ ¸\0Á%¸\\‚«l\Å1[ñ¾\Ñ\ÞS¿.\\€\à\\.Á\Õ#mÞ¼¹S_p\à—\àBp	. ¸@p!¸—Ep	.@p\àBp	.‹\àBp\à—à¢µª««…Ž\àBp\à—\à¢=,^¼8\Õ\ÔÔˆ.°\ìØ±#` ¸@p!¸\Ê\ÄÆÓ‚Ò«¯¾*zº@l­_¿\Þ¥\à.W¹E\×üùó³\Ý\Ù,³ˆ-Á.\\.@p‚\\‚@p\à—\à\\€\àÁ…\à ¸\0Á%¸\0.\Û ¸€\à. ¸\0Á.Á ¸\0Á‚Kp.@p\àBp‚\\€\à\\\0‚\\ ¸€\à. ¸.@p	.\0Á.\\ø-\0.@p\àBp.\\€\à\\\0‚\\ ¸\\€\à.€\àÁ.Á ¸\0Á‚Á.@p\àBp.\\€\à\\\0‚\\ ¸\\€\à.€\àÁ.Á ¸\0Á‚Á.@p\àBp.\\€\à\\\0‚\\ ¸\\€\à.€\àÁ.Á ¸ºŸ¥K—¦	&¤#F¤~ýú¥ŠŠŠ\ìõ%.><?>UWW{±\\ ¸\\€\à\âp\Þx\ã4iÒ¤TUUUW\ÍY\"À&Ožœv\í\Ú\åEDp\àBp‚‹ú~ö³Ÿ¥¾}û¶(´\ê/•••iÖ¬Y^L. ¸z†­;þ7þþü:K±\Õ\Z=zt]c8p`ºõ\Ö[Ó’%KÒ¶mÛ²Û…}ûö¥šššôÔ¯WÕ½\ß\ïÍ«ýÚ‘#G\ÖÞ¾1o½u }½\Þ÷\à—\à\\\Ý\Î}sÖ¦›\î_^\"|\ÞJ]tQ\Ð\Z6lXš={vÚ¿“÷û\Ôs\Û\Ò\Ã×§ƒ¦¹s\çf_W|?qŒW©]\ç,Û”®¹s‰.Á ¸º·qwþ*œú^©ùC\Zõ\ÙiÈ•“Ó¥ÿ=#ºeVú\Ö\í¿H\ßù\Éòô\ã\'~“\ÆÜ¶ »\ãW\é™\r¯þid\ë­\é\êý*ýtÁo\Ó÷º2\Ýñ\Ë5\é7›~_{1ò5cÆŒ4p\ÄUi\äÍ¿H#nüY6\ê5\í±gÿôx¿=ý×”…\é\ë“ç§›ø?3Vø\ÇAp\à\\\0‚«ûzû\í·\ìN˜\ïR8\âÊ›Ò¥\ß~0U]44\r>6]=unª\ÙõF6jµpõ\Öô\Î;ï¤—v\ì\Î\"+<_ˆ«›g,\Ïn\ë.»õ\ÉF\ïwÊŒy\ÙýVö»(\rúú\Äté„»²ë¯¿û©ôÐ“¿\Í>Ÿ0\í©ô³Eü!¸@p	.\0Á\Õ}U¯\Ü\Ò\è®{1A\Æ\à17‚\èú\ì5›|ïœ´\èÙ­Ùº\Ë° 8øvöù›ûf£R\á‰\å›koó\Û-Hw>ö\\££c\Óþ\Óñ\\1z#^1‘FY»•×Šu;ü!¸@p	.\0Á\Õ}\Ån{÷\Îy¾\Îu1™E\ÌFx\Éø;Ó€a—§\éÓ§§i…x\Êw¼b\ê¢ld\ë\í·\ßIžÙ’n¼kvv}ñmY´!-y\î\åFs\ê\ÏW§\Ûve»»ö®4`\è7²\ÙGOžŸž{qgúõo^\É\â+F\ß@p\à\\\0‚«Ûº\ì¶\rvûû\Úwfýi&Áÿùeºdø¥Y€Å±Zù¨Ö³¿«I\ã\ï\\’\Ã5\í—Ï¤Êªþ\é…^¨s›ÿ¾wYƒû\Í\'\æ;ua:X¸]\Ó5z\Ò\ìTQQ™=\Þ7Þ™EW\ì¢£h ¸@p!¸\0ÁUvŠOj³6¥ºº:»\Ý7¾ñl6\ÂÃ‰c»Š\Å\ì…ùcÅ¨ZÌŠ‚‚\\\Ý\Î\àÁƒ\ÓO<\Ñ\äm–.]Z\ç<[‡›ú}Ò¤Iµ\ç\çŠ\ã¾\'\Î\ÙU,\"\í\â‹/®}\Ì8\\ ¸\\€\à\ê–\Ï=–¯Ra3aÂ„\Ú\Û\ÅI›\ÇXŸ£+FÆ¶o\ß^òö\Ï>ûlºû\î»\\û\í·\×\Þ\Çøñ\ãý\"¸@p!¸\0Á\Õ}ƒ+_bd©þˆ×ˆ#j\×/[¶¬\Éû[¿~}û‹‘®ë¯¿¾\Ñ\Ûþ\áHC†iô>W¯^]\çd\È ¸@p!¸\0Á\Õíƒ«x\Ä+¯~ýú\Õ^\ß\ÔhUø\éOZ»;añ²hÑ¢:·‹‘°¹Š\Û\îÞ½»Áý\Ô\Ô\Ô\Ô%Á‚Á®²	®\â¯\â\Ë1;aSÆ\× ¸\âòW¿úÕ´gÏž\Ú\Û\ÝÿýÙº1c\Æ4z?1[añ}€\àÁ…\à\Ê4:,\ÍŸˆ±\ÆF·ò\èš:ujv»•+W\Ö\ÞnÚ´i\ÍúwÁ‚ÁP6±9`À€ô\àƒfS²GTS#\\¿þõ¯ko\'-Ž¥þý.X° Î¤\ZË—/7Â…\àÁ…\à\èÁUZ¹\æ\Ãõ£ý¨6²\Z\éÊ¯+þX¼›a1\Çp!¸@p!¸\0\Ê&¸\âüZ3f\Ìhô$\ÃÍ¥°øv<ð@º\å–[š\Ü\Åðò\Ë//y_f)Dp\àBpt{h\Õ7q\â\ÄÃž‡+F¾ò\Û|ó›\ß\ÌN^\×õ\íÛ·dpMŸ>½\äc:‚‚ GXºti‘°ýû÷7¸Íœ9sjwI,\Þ\í0&\Å(5\Êõô\ÓO7úxkÅ³#–:!3‚\Ë&.Á@Yˆ\Êhö\ì\Ù\r\Ö\ß|ó\ÍÙº\'Ÿ|²\ÎõqŒVL’\Ñ\ØTñ¥&\à˜;wn\í\íb„¬©\Ñ7 ¸\0\Ý\Þ~ðƒ\Ú\Z6lXXŠ©ùš4iR£_û‹_ü¢Al;¶\Ñ\Û\Æ\ì„C‡­½\íM7\Ý\ä\ÅGp\àBp”·¬\âã±Š¿Z»vm6±\Åë¯¿\Þ\è\×\Æ.ˆ—^zi\Ù	\ï½÷\ÞFowO-¿k\×./>‚‚ üÍš5«\ÎHU\\1#aDWS–,YR\çkW­Z\Õ\à6ó\ç\ÏoôþAp\àBpô£GnE1©\Æ\á¼ó\Î;\é\Ê+¯¬\áÚ»woƒ\Ø\êß¿\íýŽ9Ò‹\àÁ…\à\èYb‹ˆ¡\âèŠ™\ãØ«\Ãy\á…²\ÛGx\å\â\ëŠw#\ÌÏ»UjB\r\\ ¸\\\0e]\Å\'9\Î\'Òˆ\Ùc¦|\ç;\ßI?þñ³\ÛÅ¨Vñyl9nÁ‚Á\Ðã£«þ\î…ùyº¦L™’V¬X‘+©Š‘¬ššš´`Á‚t\Ã\r7dVÿkc\ä\Ì\È‚‚€C\â®\â\Ù[³\Äl„&\È@p\àBpÐˆ•ŠspUUUµ(´\"\Ô\â<[v!Dp\àBp\Ð‹-J\'NÌŽñ\ê×¯_ÀŠ ‹c´®¹\æšT]]\í–‚‚\0\\ ¸\\\0€\à—\à\0\\ ¸\\\0”Ÿ7fS\Ô\ç¶mÛ–gÇ;6;3‚\\‚\0Z`\åÊ•\éº\ë®\Ë&\ï¸\ï¾û\Z¬\Ï\Ï¶eË–\Ú\ë6oÞœ–-[vØ“:#¸@p!¸\0\èÑ¾ÿý\ï·8žÖ¯_Ÿ®¼ò\Ê4nÜ¸,¾\\ ¸\\\0pHœ\'¬-Ìž=;]|ñ\Åiûö\í^TÁ‚Á\03g\ÎL\ãÇopý\ÒÜ¹sÓ AƒÒ§>õ©ô\îw¿;ß€O§œrJ\Z<xp¶>nW\ìÿ÷½¨‚‚\0b\×Á‘#Gf\Çd‹	1>ö±¥3\Ï<3›(\ãÈŽ\Ý\ÊClÅŠ\é\æ›oNgŸ}vv»Rh´\Õ\È‚‚€n%\"+&\Æ(žü\"¢ªªª*Ázüñ\ÇSuuu\\£GNû÷\ïoô~b”\ë´\ÓN\Ën·w\ï\Þ:÷_W|ÿ.\\.\0zŒ˜\ê½8\Î?ÿüôù\Ï>\íÜ¹3»nÒ¤I©ÿþYL=ø\àƒ%\ïgÏž=\Ù×žw\Þyµ#ayŒ\ÅD\Zf/\\ ¸\\\0ôh1²±ñ\Þ~û\í\ìø­ü\à\é»\ßýn¶¾8\Ð\ê[µjUº\à‚²8+³\Æ.ˆ.\\.\0z„\ØÍ¯x\Ô)ŽÁŠ\Ýó‘­S½\ÇöÃ’%KÒ®]»²øš0aBz\çw\Z\Ü\ßþð‡4dÈ\ìDÉ±{añ1]k×®MkÖ¬ñ¢.\\.\0\Ê\ßÆ³©\Ûóc²bŒ˜ø\"Ž\Ù*öÓŸþ4UTT¤Ý»wg—c÷ÀØžxò\É\'\ë\Ü.F\Â\"\Äò\Û\Æ\í\âþ\ê\Ï^ˆ\àÁE‡Wñ>\î\0\ÐQb\Zø;î¸£ör\Òé§Ÿ\Þ\àv\×\\sMú\æ7¿Y{9F¶âº˜>°ð“Ÿü$±\Ë/¿¼öº˜½°~ÀÑ±\nÁ»Kp\à\ê±>úÑ\î±?;\0\áû\ßÿ~6|nÄˆ\éúë¯¯s›˜Î½²²2›þw¿û]š?~výÖ­[Sß¾}\Óm·Ý–]Ž]cd+¶3¦M›Vûõ1e|„Y.va,5u<\íc\åÊ•O696\Ø\êÁ\Õ#r\Ê)S\Ï=÷\\ûZ\0\Ð\áz\è¡ì˜¬\\œ\Ôxñ\â\Åunó\ë_ÿ:‹¨\ÂF{\Z5jT\Z:th\í”\ïa±.¾&ŽÛŠ\É4\âòò\å\Ëk¿>þ¨Ç„\åb\nú\â0\ÚÝ|\àÕ…MŽo\Û\êÁ\ÕS½§`\íg?ûÙË–-\Ûe?w\0:\Ë1\Ç\Ó`7÷ý\èGé¢‹.\ÊF\Ãb+–\Øu0Ä±_q~­Ø¶ˆ\Û\Üz\ë­\Ùú|v\Ãlk¿ð{í¨¢\ã•\ãþûõ\ë\ç\Ån\ï\Ê:p`WŒlŠ­u±½a“WŽ®\Âr\í¡7\Äd±X,KG,õÿ\ÈwT#9Å¨V~þ­\Ø0v!ŒË¯½öZ¶þ¹\çž\Ë\Ö=õ\ÔS\Ù\îˆcÇŽmpõ\ï÷Ð¶ˆ¥ý—Øðf±‚\0\èó\ç\Ï­xJøú#\\Û·o\Ï\â(–8‡V\Üö÷¿ÿ}6B\ç\ä\Ê\Å\î†1\Ú\×OŸ>½þHK\àÚ»w\ïŽ\Âý\íó\ê‚\0(k—\\r\É[U¥Ž\áš3gN[HÅ·‹‘®\Øupó\æÍµ\×\Å9¶\â¶O?ýt\àª\×+¯¼ò\Û\Â\ížó\ê‚\0(kW^y\å\ÆÕ«W\×\ÆPýY\nc†Á\ÆÎ·“f\Ä$\'N¬3GDX\ÌjX¬þ,…ó\æ\Íûe\á>ò\ê‚\0(k\ßþö·\ï)ž¢½ø<\\±û`L„1iÒ¤F\'e\ÈG¿žy\æ™\ìòøñ\ãëœ«+Wÿ<\\…x»ªOŸ>\ç{õÁ\0”µ‘#Gþó<°¯øx«}\ìcY ­[·.\r><½þú\ëW\Ù7¾ñ4fÌ˜l\Ä+¦„¿÷\Þ{\ë\Ü&.\î¯hrŽx¬ÿ\Û+.\0 G(\Ð\ÕÅ‘#^q\ÌUL~36%ŽÏŠ\íŠ\ï~÷»\Ù\ÇU«VÕ®‹©\áO;\í´ú\'9¾\Þ+.\0 \'×»cB\Â\â*ŠÑªó\Î;¯\Îù´J™0aB[•••µ\'DŽ­ó\Ï??»¾È®\ÂýÎ«¨¨8Å«.\0 \Ç(D\ÓÝ³gÏ®sr\â¦\Ïþói×®]M\×Æ³\É2®º\êªÚ‘­ük‹§˜ÿ\Þ÷¾7¥°\r²¢W¯^\Çx\ÅÁ\0ô½{÷þØ AƒönÙ²¥Nt\ÅHW\ì^X<\éEc¾ÿý\ï§ÿø\Ç\Ù1[±alk\Ç\Ö\ï~÷»‡\×í¬¬¬<Ý«\r.\0 \Ç\éß¿Ÿ‹/¾x_ñù¶òcºbâ‹˜½0¦Œót\å1»\Æq\\1=ü¿üË¿d·«w\ÌV6w\Æ\àÁƒ/-lô*‚\0\è±úö\í;hó\æ\Í\Õ/¦«½Šót\ÅÉ‘9\æ˜Ø–È–ˆ¬8\ÏVŒ‚\ÍF˜›VX\Þ\ã•\0À!…H:ÿõ\×_ÿ}Lý\ÞJ»¾û\Ý\ï\ÞaT\\\0\0\èß¿ÿµC‡\Ýñ\ÔSO\íÛ¿sCk\ß\ìÙ³RUUµ¢°½±\Ø1[€\à\0(¡¢¢¢ª°,0`Àk/¾ø\â}… Šsm\Í¬ðq\ÇK/½´¾ðñö\ÂÅ³f\Íú?…íŒ¥1²e6B@p\04/¼N8pà»‹¶%¶\ÆöDa9PX6ô\í\Û÷C^%\0Á\0Øž\0ð	\0Øž\0ð	\0Øž\0À$\0`{À$\0`{À$\0`{\0o\0€\í	\0o\0€\í	\0o\0€\í	\0\Z{ƒ´X,‹\Åb9\Ò\ÅV\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0”ðÿ\Õ\Ä)òŽylµ\0\0\0\0IEND®B`‚','');
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
INSERT INTO `act_ge_property` VALUES ('next.dbid','287501',116),('schema.history','create(5.17.0.2)',1),('schema.version','5.18.0.0',1);
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
INSERT INTO `act_hi_actinst` VALUES ('267506','TEST33___NONE:1:267504','267505','267505','start',NULL,NULL,NULL,'startEvent',NULL,'2017-08-22 07:09:29','2017-08-22 07:09:29',24,''),('267507','TEST33___NONE:1:267504','267505','267505','task1','267508',NULL,'First task','userTask','fred','2017-08-22 07:09:29','2017-08-22 07:09:29',NULL,'');
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
INSERT INTO `act_hi_identitylink` VALUES ('267509',NULL,'participant','fred',NULL,'267505');
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
INSERT INTO `act_hi_procinst` VALUES ('267505','267505',NULL,'TEST33___NONE:1:267504','2017-08-22 07:09:29','2017-08-22 07:09:29',NULL,NULL,'start',NULL,NULL,NULL,'',NULL);
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
INSERT INTO `act_hi_taskinst` VALUES ('267508','TEST33___NONE:1:267504','task1','267505','267505','First task',NULL,NULL,NULL,'fred','2017-08-22 07:09:29','2017-08-22 07:09:29','2017-08-22 07:09:29',NULL,NULL,50,'2017-08-22 07:09:29',NULL,NULL,'');
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
INSERT INTO `act_id_membership` VALUES ('admin','Admin'),('arun','Approver'),('gaurav','Approver'),('santosh','Submitter'),('santosh','user'),('userCT1','user'),('userFC1','user'),('userFC2','user');
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
INSERT INTO `act_id_user` VALUES ('admin',4,'Admin','User','admin@da.com','admin','14',NULL),('arun',3,'Arun','Rawat','arun@gmail.com','arun','17',NULL),('gaurav',1,'Gaurav','Khatri','gaurav@gmail.com','gaurav','16',NULL),('santosh',4,'Santosh1','Pandey1','santosh38881@gmail.com','XXXXXXXXXX','15',NULL),('userCT1',7,'userCT1','userCT1','userCT1@da.com','userCT1','20','CT'),('userFC1',5,'userFC1','userFC1','userFC1@da.com','userFC1','18','FC'),('userFC2',6,'userFC2','userFC2','userFC2@da.com','userFC2','19','FC');
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
INSERT INTO `act_re_deployment` VALUES ('267501','Dynamic process deployment',NULL,'','2017-08-22 07:09:27');
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
INSERT INTO `act_re_procdef` VALUES ('TEST33___NONE:1:267504',1,'da.com',NULL,'TEST33___NONE',1,'267501','dynamic-model.bpmn','dynamic-model.TEST33___NONE.png',NULL,'\0','',1,'');
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
INSERT INTO `act_ru_execution` VALUES ('267505',1,'267505',NULL,NULL,'TEST33___NONE:1:267504',NULL,'task1','','\0','','\0',1,2,'',NULL,'2017-08-22 07:09:29');
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
INSERT INTO `act_ru_identitylink` VALUES ('267509',1,NULL,'participant','fred',NULL,'267505',NULL);
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
INSERT INTO `act_ru_task` VALUES ('267508',1,'267505','267505','TEST33___NONE:1:267504','First task',NULL,NULL,'task1',NULL,'fred',NULL,50,'2017-08-22 07:09:29','2017-08-22 07:09:29',NULL,1,'',NULL);
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
  `Code_Type` varchar(45) NOT NULL,
  `Key_Code` varchar(45) NOT NULL,
  `Key_Value` varchar(100) DEFAULT NULL,
  `Dt_Created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codelookup`
--

LOCK TABLES `codelookup` WRITE;
/*!40000 ALTER TABLE `codelookup` DISABLE KEYS */;
INSERT INTO `codelookup` VALUES ('DOC_TYPE','INVOICE','INVOICE','2017-08-22 10:55:17',2),('DOC_TYPE','BOOK_REPORT','BOOK_REPORT','2017-08-22 10:56:05',3),('PROCESS_TYPE','FORM_SUBMISSION','FORM_SUBMISSION','2017-08-22 10:59:05',4),('PROCESS_TYPE','TIME_BASED','TIME_BASED','2017-08-22 10:59:53',5),('TASK_TYPE','APPROVE_REJECT','APPROVE_REJECT','2017-08-22 11:08:17',6),('TASK_TYPE','COLLABORATION','COLLABORATION','2017-08-22 11:09:53',7),('TASK_TYPE','USER_TASK','USER_TASK','2017-08-22 11:10:25',8),('TASK_STATUS','CONFIGURED','CONFIGURED','2017-08-22 11:18:14',10),('DOC_TYPE','NEW_USER','NEW_USER','2017-08-25 12:32:33',11),('TASK_TYPE','SYSTEM_TASK','SYSTEM_TASK','2017-08-25 14:12:02',12),('GROUP_TYPE','SECURITY_ROLE','SECURITY_ROLE','2017-08-25 17:28:18',13);
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
  `process_description` varchar(255) DEFAULT NULL,
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
  `department_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`process_id`),
  UNIQUE KEY `process_name_UNIQUE` (`process_name`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process`
--

LOCK TABLES `process` WRITE;
/*!40000 ALTER TABLE `process` DISABLE KEYS */;
INSERT INTO `process` VALUES (29,'TmsSubProcess','Test desc','userFC2',NULL,'1',NULL,'28',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL),(30,'UserReg','TestDesc','userFC2','FORM_SUBMISSION','System','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'INVOICE','user','CT,FC'),(31,'UserRegSubProcess','test Desc','userFC2',NULL,'1',NULL,'30',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_department_mapping`
--

LOCK TABLES `process_department_mapping` WRITE;
/*!40000 ALTER TABLE `process_department_mapping` DISABLE KEYS */;
INSERT INTO `process_department_mapping` VALUES (33,6,'CT'),(34,11,'FC'),(35,11,'PR'),(36,13,'CT'),(37,13,'FC'),(38,17,'CT'),(39,17,'FC'),(40,19,'CT'),(41,19,'FC'),(42,19,'PR'),(43,19,'PY'),(44,19,'RV'),(45,22,'CT'),(46,22,'FC'),(47,24,'CT'),(48,24,'FC'),(49,26,'CT'),(50,26,'FC'),(51,28,'CT'),(52,28,'FC'),(53,30,'CT'),(54,30,'FC');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_userfom`
--

LOCK TABLES `process_userfom` WRITE;
/*!40000 ALTER TABLE `process_userfom` DISABLE KEYS */;
INSERT INTO `process_userfom` VALUES (7,NULL,NULL,'SYSTEM_USER',NULL,'admin','[{\"name\":\"text-1503371330655\",\"label\":\"User Name\",\"required\":null,\"type\":\"text\",\"value\":null,\"subtype\":\"text\",\"jsonData\":\"null\",\"userFromId\":null,\"fieldId\":null,\"values\":null,\"class\":null},{\"name\":\"radio-group-1503371335249\",\"label\":\"Radio Group\",\"required\":null,\"type\":\"radio\",\"value\":null,\"subtype\":null,\"jsonData\":\"[{\\\"value\\\":\\\"option-1\\\",\\\"label\\\":\\\"Option 1\\\"},{\\\"value\\\":\\\"option-2\\\",\\\"label\\\":\\\"Option 2\\\"},{\\\"value\\\":\\\"option-3\\\",\\\"label\\\":\\\"Option 3\\\"}]\",\"userFromId\":null,\"fieldId\":null,\"values\":[{\"value\":\"option-1\",\"label\":\"Option 1\"},{\"value\":\"option-2\",\"label\":\"Option 2\"},{\"value\":\"option-3\",\"label\":\"Option 3\"}],\"class\":null},{\"name\":\"checkbox-group-1503371357686\",\"label\":\"Checkbox Group\",\"required\":null,\"type\":\"checkbox-group\",\"value\":null,\"subtype\":null,\"jsonData\":\"[{\\\"value\\\":\\\"option-1\\\",\\\"label\\\":\\\"Option 1\\\"}]\",\"userFromId\":null,\"fieldId\":null,\"values\":[{\"value\":\"option-1\",\"label\":\"Option 1\"}],\"class\":null},{\"name\":\"text-1503371394341\",\"label\":\"Password\",\"required\":\"true\",\"type\":\"text\",\"value\":null,\"subtype\":\"text\",\"jsonData\":\"null\",\"userFromId\":null,\"fieldId\":null,\"values\":null,\"class\":null}]','testForm','[{\"name\":\"text-1503371330655\",\"label\":\"User Name\",\"required\":null,\"type\":\"text\",\"value\":null,\"subtype\":\"text\",\"jsonData\":null,\"userFromId\":null,\"fieldId\":null,\"values\":null,\"class\":null},{\"name\":\"radio-group-1503371335249\",\"label\":\"Radio Group\",\"required\":null,\"type\":\"radio-group\",\"value\":null,\"subtype\":null,\"jsonData\":null,\"userFromId\":null,\"fieldId\":null,\"values\":[{\"value\":\"option-1\",\"label\":\"Option 1\"},{\"value\":\"option-2\",\"label\":\"Option 2\"},{\"value\":\"option-3\",\"label\":\"Option 3\"}],\"class\":null},{\"name\":\"checkbox-group-1503371357686\",\"label\":\"Checkbox Group\",\"required\":null,\"type\":\"checkbox-group\",\"value\":null,\"subtype\":null,\"jsonData\":null,\"userFromId\":null,\"fieldId\":null,\"values\":[{\"value\":\"option-1\",\"label\":\"Option 1\"}],\"class\":null},{\"name\":\"text-1503371394341\",\"label\":\"Password\",\"required\":\"true\",\"type\":\"text\",\"value\":null,\"subtype\":\"text\",\"jsonData\":null,\"userFromId\":null,\"fieldId\":null,\"values\":null,\"class\":null}]');
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
  `task_description` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (22,'Submit_Document','test desc','userFC2','USERTASK',NULL,NULL,'CONFIGURED',NULL,NULL,NULL,NULL,NULL,18,'System'),(23,'Approver_1','test approver','userFC2','APPROVE_REJECT',NULL,NULL,'CONFIGURED',NULL,NULL,NULL,NULL,NULL,18,'arun'),(24,'Submit_Document','test desc','userFC2','USERTASK',NULL,NULL,'CONFIGURED',NULL,NULL,NULL,NULL,NULL,21,'System'),(25,'Approver_1','test','userFC2','APPROVE_REJECT',NULL,NULL,'CONFIGURED',NULL,NULL,NULL,NULL,NULL,21,'gaurav'),(26,'Task_1','desc','userCT1','USERTASK',NULL,NULL,'CONFIGURED',NULL,NULL,NULL,NULL,NULL,23,'System'),(27,'Task_1','test desc','userFC2','USERTASK',NULL,NULL,'CONFIGURED',NULL,NULL,NULL,NULL,NULL,29,'System'),(28,'Task_2','test desc','userFC2','APPROVE_REJECT',NULL,NULL,'CONFIGURED',NULL,NULL,NULL,NULL,NULL,29,'arun');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_from_mapping`
--

LOCK TABLES `user_from_mapping` WRITE;
/*!40000 ALTER TABLE `user_from_mapping` DISABLE KEYS */;
INSERT INTO `user_from_mapping` VALUES (16,'text-1503371330655','text','text',NULL,'User Name',NULL,7,'null'),(17,'radio-group-1503371335249','radio',NULL,NULL,'Radio Group',NULL,7,'[{\"value\":\"option-1\",\"label\":\"Option 1\"},{\"value\":\"option-2\",\"label\":\"Option 2\"},{\"value\":\"option-3\",\"label\":\"Option 3\"}]'),(18,'checkbox-group-1503371357686','checkbox-group',NULL,NULL,'Checkbox Group',NULL,7,'[{\"value\":\"option-1\",\"label\":\"Option 1\"}]'),(19,'text-1503371394341','text','text','true','Password',NULL,7,'null');
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

-- Dump completed on 2017-08-26 17:00:14
