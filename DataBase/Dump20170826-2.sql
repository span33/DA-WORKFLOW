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
INSERT INTO `act_ge_bytearray` VALUES ('267502',1,'dynamic-model.bpmn','267501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"da.com\">\n  <process id=\"TEST33___NONE\" isExecutable=\"true\">\n    <startEvent id=\"start\"></startEvent>\n    <userTask id=\"task1\" name=\"First task\" activiti:assignee=\"fred\"></userTask>\n    <userTask id=\"task2\" name=\"Second task\" activiti:assignee=\"john\"></userTask>\n    <endEvent id=\"end\"></endEvent>\n    <sequenceFlow id=\"sequenceFlow-499ac43b-e7cb-4b0d-9156-dbd35d4a09bd\" sourceRef=\"start\" targetRef=\"task1\"></sequenceFlow>\n    <sequenceFlow id=\"sequenceFlow-0587d993-5986-4382-a188-bfd2f976eb06\" sourceRef=\"task1\" targetRef=\"task2\"></sequenceFlow>\n    <sequenceFlow id=\"sequenceFlow-5b44f6ff-99fd-4c3c-8411-69440dda2e91\" sourceRef=\"task2\" targetRef=\"end\"></sequenceFlow>\n    <subProcess id=\"DYNAMIC_SUB_PROCESS\" name=\"Dynamic Document Subprocess\">\n      <startEvent id=\"dynamic_sub_process_start_event\" name=\"Start Dynamic SubProcess\"></startEvent>\n      <endEvent id=\"dynamic_sub_process_end_event\" name=\"End Dynamic SubProcess\"></endEvent>\n      <endEvent id=\"rejectedErrorEndEvent\" name=\"ErrorEnd\">\n        <errorEventDefinition></errorEventDefinition>\n      </endEvent>\n      <sequenceFlow id=\"sequenceFlow-b2d01ffa-4684-480a-9340-b3a43b1aefbd\" sourceRef=\"dynamic_sub_process_start_event\" targetRef=\"APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS\"></sequenceFlow>\n      <exclusiveGateway id=\"exclusivegateway_approval_1_of_1_of_DYNAMIC_SUB_PROCESS\" name=\"Exclusive Approval Gateway 1 of 1 of DYNAMIC_SUB_PROCESS\"></exclusiveGateway>\n      <sequenceFlow id=\"sequenceFlow-63ca93dc-0fac-4728-a381-81003ab71be9\" sourceRef=\"APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS\" targetRef=\"exclusivegateway_approval_1_of_1_of_DYNAMIC_SUB_PROCESS\"></sequenceFlow>\n      <sequenceFlow id=\"docRejectedSubFlow_1_of_1_of_DYNAMIC_SUB_PROCESS\" name=\"Doc Rejected 1 of 1 of DYNAMIC_SUB_PROCESS\" sourceRef=\"exclusivegateway_approval_1_of_1_of_DYNAMIC_SUB_PROCESS\" targetRef=\"rejectedErrorEndEvent\">\n        <extensionElements>\n          <activiti:executionListener event=\"take\" expression=\"${docWorkflowListener.onRejected(execution)}\"></activiti:executionListener>\n        </extensionElements>\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${approved == false}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"docApprovedSubFlow_1_of_1_DYNAMIC_SUB_PROCESS\" name=\"Doc Approved 1 of 1 of DYNAMIC_SUB_PROCESS\" sourceRef=\"exclusivegateway_approval_1_of_1_of_DYNAMIC_SUB_PROCESS\" targetRef=\"COLLABORATE_DOC_USER_TASK_1\">\n        <extensionElements>\n          <activiti:executionListener event=\"take\" expression=\"${docWorkflowListener.onApproved(execution)}\"></activiti:executionListener>\n        </extensionElements>\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${approved == true}]]></conditionExpression>\n      </sequenceFlow>\n      <userTask id=\"APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS\" name=\"Approval (1 / 1 /DYNAMIC_SUB_PROCESS)\" activiti:candidateGroups=\"management\">\n        <extensionElements>\n          <activiti:taskListener event=\"create\" expression=\"${docWorkflowListener.onCreateApproval(execution, task)}\"></activiti:taskListener>\n        </extensionElements>\n      </userTask>\n      <userTask id=\"COLLABORATE_DOC_USER_TASK_1\" name=\"Collaboration (1 / 1)\" activiti:candidateUsers=\"kermit\">\n        <extensionElements>\n          <activiti:taskListener event=\"create\" expression=\"${docWorkflowListener.onCreateCollaborate(execution, task)}\"></activiti:taskListener>\n          <activiti:taskListener event=\"complete\" expression=\"${docWorkflowListener.onCompleteCollaborate(execution, task)}\"></activiti:taskListener>\n        </extensionElements>\n      </userTask>\n      <sequenceFlow id=\"dynamic_collab_subflow_1_1\" name=\"Collaboration SubFlow 1 of 1\" sourceRef=\"COLLABORATE_DOC_USER_TASK_1\" targetRef=\"dynamic_sub_process_end_event\"></sequenceFlow>\n    </subProcess>\n    <sequenceFlow id=\"sequenceFlow-9ffdd741-e032-4422-8880-5dc919148848\" sourceRef=\"task1\" targetRef=\"DYNAMIC_SUB_PROCESS\"></sequenceFlow>\n    <boundaryEvent id=\"REJECTED_ERROR_BOUNDARY_EVENT\" name=\"Rejected Error Event\" attachedToRef=\"DYNAMIC_SUB_PROCESS\">\n      <errorEventDefinition></errorEventDefinition>\n    </boundaryEvent>\n    <sequenceFlow id=\"sequenceFlow-61fdc5e0-61c4-469e-accb-ea5ce17461fe\" name=\"Rejected\" sourceRef=\"REJECTED_ERROR_BOUNDARY_EVENT\" targetRef=\"task1\"></sequenceFlow>\n    <endEvent id=\"Subend\"></endEvent>\n    <sequenceFlow id=\"sequenceFlow-a9085ba0-1261-4356-99d3-02720d78c96f\" sourceRef=\"DYNAMIC_SUB_PROCESS\" targetRef=\"Subend\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_TEST33___NONE\">\n    <bpmndi:BPMNPlane bpmnElement=\"TEST33___NONE\" id=\"BPMNPlane_TEST33___NONE\">\n      <bpmndi:BPMNShape bpmnElement=\"APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS\" id=\"BPMNShape_APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESS\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"330.0\" y=\"247.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"rejectedErrorEndEvent\" id=\"BPMNShape_rejectedErrorEndEvent\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"605.0\" y=\"340.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"dynamic_sub_process_start_event\" id=\"BPMNShape_dynamic_sub_process_start_event\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"250.0\" y=\"262.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"COLLABORATE_DOC_USER_TASK_1\" id=\"BPMNShape_COLLABORATE_DOC_USER_TASK_1\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"570.0\" y=\"180.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway_approval_1_of_1_of_DYNAMIC_SUB_PROCESS\" id=\"BPMNShape_exclusivegateway_approval_1_of_1_of_DYNAMIC_SUB_PROCESS\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"480.0\" y=\"259.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"dynamic_sub_process_end_event\" id=\"BPMNShape_dynamic_sub_process_end_event\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"720.0\" y=\"195.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"0.0\" y=\"138.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"820.0\" y=\"15.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"Subend\" id=\"BPMNShape_Subend\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"820.0\" y=\"260.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"task1\" id=\"BPMNShape_task1\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"80.0\" y=\"123.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"REJECTED_ERROR_BOUNDARY_EVENT\" id=\"BPMNShape_REJECTED_ERROR_BOUNDARY_EVENT\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"647.0\" y=\"375.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"task2\" id=\"BPMNShape_task2\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"450.0\" y=\"0.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"DYNAMIC_SUB_PROCESS\" id=\"BPMNShape_DYNAMIC_SUB_PROCESS\" isExpanded=\"true\">\n        <omgdc:Bounds height=\"230.0\" width=\"540.0\" x=\"230.0\" y=\"160.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"dynamic_collab_subflow_1_1\" id=\"BPMNEdge_dynamic_collab_subflow_1_1\">\n        <omgdi:waypoint x=\"670.0\" y=\"210.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"682.0\" y=\"210.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"682.0\" y=\"210.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"720.0\" y=\"210.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-b2d01ffa-4684-480a-9340-b3a43b1aefbd\" id=\"BPMNEdge_sequenceFlow-b2d01ffa-4684-480a-9340-b3a43b1aefbd\">\n        <omgdi:waypoint x=\"280.0\" y=\"277.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"330.0\" y=\"277.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-63ca93dc-0fac-4728-a381-81003ab71be9\" id=\"BPMNEdge_sequenceFlow-63ca93dc-0fac-4728-a381-81003ab71be9\">\n        <omgdi:waypoint x=\"430.0\" y=\"277.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"442.0\" y=\"277.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"442.0\" y=\"279.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"480.0\" y=\"279.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"docApprovedSubFlow_1_of_1_DYNAMIC_SUB_PROCESS\" id=\"BPMNEdge_docApprovedSubFlow_1_of_1_DYNAMIC_SUB_PROCESS\">\n        <omgdi:waypoint x=\"520.0\" y=\"271.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"532.0\" y=\"271.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"532.0\" y=\"210.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"570.0\" y=\"210.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"docRejectedSubFlow_1_of_1_of_DYNAMIC_SUB_PROCESS\" id=\"BPMNEdge_docRejectedSubFlow_1_of_1_of_DYNAMIC_SUB_PROCESS\">\n        <omgdi:waypoint x=\"520.0\" y=\"286.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"532.0\" y=\"286.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"532.0\" y=\"355.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"605.0\" y=\"355.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-0587d993-5986-4382-a188-bfd2f976eb06\" id=\"BPMNEdge_sequenceFlow-0587d993-5986-4382-a188-bfd2f976eb06\">\n        <omgdi:waypoint x=\"180.0\" y=\"140.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"192.0\" y=\"140.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"192.0\" y=\"30.000000000000007\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"450.0\" y=\"30.000000000000007\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-5b44f6ff-99fd-4c3c-8411-69440dda2e91\" id=\"BPMNEdge_sequenceFlow-5b44f6ff-99fd-4c3c-8411-69440dda2e91\">\n        <omgdi:waypoint x=\"550.0\" y=\"30.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"782.0\" y=\"30.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"782.0\" y=\"30.000000000000004\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"820.0\" y=\"30.000000000000004\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-a9085ba0-1261-4356-99d3-02720d78c96f\" id=\"BPMNEdge_sequenceFlow-a9085ba0-1261-4356-99d3-02720d78c96f\">\n        <omgdi:waypoint x=\"770.0\" y=\"275.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"820.0\" y=\"275.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-9ffdd741-e032-4422-8880-5dc919148848\" id=\"BPMNEdge_sequenceFlow-9ffdd741-e032-4422-8880-5dc919148848\">\n        <omgdi:waypoint x=\"180.0\" y=\"165.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"192.0\" y=\"165.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"192.0\" y=\"275.00000000000006\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"230.0\" y=\"275.00000000000006\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-61fdc5e0-61c4-469e-accb-ea5ce17461fe\" id=\"BPMNEdge_sequenceFlow-61fdc5e0-61c4-469e-accb-ea5ce17461fe\">\n        <omgdi:waypoint x=\"662.0\" y=\"405.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"662.0\" y=\"415.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"130.0\" y=\"415.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"130.0\" y=\"279.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"130.0\" y=\"183.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-499ac43b-e7cb-4b0d-9156-dbd35d4a09bd\" id=\"BPMNEdge_sequenceFlow-499ac43b-e7cb-4b0d-9156-dbd35d4a09bd\">\n        <omgdi:waypoint x=\"30.0\" y=\"153.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"80.0\" y=\"153.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>','\0'),('267503',1,'dynamic-model.TEST33___NONE.png','267501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\\\0\0�\0\0\0�%7G\0\0C\�IDATx\�\�\��\�u��7u͟u�yN�\�v���\�\\�\�\�\\=�\�\���\�z��ۺH3$D J\\LEDi�\�\Z\ZX*�&��� �\'�@Q\� A��X\��\�>�ߝ?w�\�\�\�\�ϙ��s\�޹�\�\�\�9\�\�\��9\�(\0\��RJǼ�\�-[�\�\�\�\�\�4w\�\\K/�\�\�K�-�}a��	\0\0e$bk�\�ũ��&��\�[�NZv\�ܙ.\\��_�\�\0\0\�D�l��.]o͝;w��J\0\0(��\�\�:K!���\0�2\�	�.\\\�O%\0\0��\�z��\�Ӌ+����˖�<�I�\0\08�\�ڳk[z~θ�\�c�\�Y\�X\'�\0\0\�\�\�ں�\rb+_^^;S(	.\0\0����\�\�KW�J�\0\0hep=?�ڒ�넒\�\0\0�\�\0\0�VpŬ���+\�	%�\0\0�2�6,��dp\�:�$�\0\0�V\�k\�֤\�\�pw\�\�u�N(	.\0\0���˦�\�i\\q�H\\@�PYYy�W��k+**f>>WX��TX���Pa��O�>g{�\0�#�\�\�7ӆ��4ܝ�p]�J�\��\�B@�(D\�\�\�U��\�\�<S�8�w\�\�\��*@;מ]\�\��%�K\�\�\�6bIp]K!����lnIh5�l-,���\0\�\���\�i���\�\�W���|�\�\�m�v	.��ŨV!��b\�`q<�O�\�zkZ�dIڶm[z\�7Rطo_���I�W�NS�LI�\rj,�\���\�@\�\�F��v	.�k\�ի\�1�8�Uq,\r6,͞=;\�߿?5\��������z\���]�\r��9�ZM�v	\'�t�C#[ubk��\�#Y-#_3f\�h]u^m\08�\�jml\�p\\@ǋ\��\�h\�̙�-\��R߾}\�\�^\�\��#.�\���Cdl\�\�*��z#]��\�\0 �P�bW\�\�\�c7\��Po�­�\�\0�%���\�\�*� ��\�l5瘮zi��\��\�\\@Y+>�q\�F؞\�\�Z�\�\Z\0�\�_�s\�g�\�\��}�����\��l5w\��֊)\�/��\�\�\�\�ӧ\�\���\0\��_����_��Kp\��}���\��vqR\�p�\��r]\�_\n����hy����\n.�t\���\�\���e˖uHp�^��\�y��K\�u\�R�%��\��>^��\\~��\�\�;$�jjj���u��\0����\��\�EEp	.�������\�\�5;ac�}��K���G�X,e�������X,�]:R�\�ڢ�\��Wz\�TV�\�\�\��|*_�e�\�\�\�\��\��t�_\�uB+\���|���\�\�~6w\�q\��\�O����Ӓ%K:=^\nO/[\�_�p\�\�t\�9\�\�}.�#\�\���q.�sQ/�����R\'�l�\���\�?�\�ǚ5kҪU��\�?�\�w\�\�j�X\\@Wx7K!.���7:�\���Z/��B�u;w\�L������\��\�\�/���{饗R\��K\�{l:\�S\�ҥK�\�_{\�4t\�\�\���uÆ\rK�w\�:cƌI\'�pBz��ߟ~�\�f\�\��O?��\�\�\r\Z\�h\��\�\�\�\�b\�\�\�SO;��O>9\�}�\�\���>�h:\�Ӳ\�\�>cTl\�ƍ\r�릛n\�>�ꪫС\�\�\�\\\�<\\ ��.�-�+��\�Çg#]���f\�b\�+�*\Z��_\�֝{\�\�\����\�O~2�>b+.\���顇\�>�\�*�Gy$=���\�\�\'�tR�.\�-_�tT3G�\"�b�ȭ[�fןx\�\���1.oڴ)[��y\�u\�c\�ԩ\�\�<#\\@G���<=��x�ݿ�\�\���\�\���\�\��\�	���ap\�\�l\�/������\�F�b�\�\�տ���80;�⯩K��\�G]�\�\\Tcǎ\�b�x]��\�W\�\�m�ݖ�\�\�G�|\�{\�\\@gmϭ\�h�\�\�\�\Z\\�U4��\�p{Q����W\�R��Տ��RaUj\�\�p��+\\�\�\�W\�\��gΜYg]\�G�>�F�ʎI�\�\�x�\��1bD��Ʈ��\�����\�k�\�xO:t\�\�E�5ƫ�\�\�ʃ%v�{�\�\�Ieeev9��\�\'Ԉ\r�w)�ѱ��v)\�wC,ޥ0vU<\\pŮ�Gڥ0��Ƃ+��\�\�b\"���˿欳Ϊ\�\��W^\�>�\�?\�\�q����ϟ|�I�t�\�{\�c�)�\�ӧ�Kp͘1�xtkk\�޽\�\�\��t@pűY���{_슗O��cǎ,��	0\"�b��|W���\�e/F�\"\��I3�\�>�����f4\\1�ED[\�_|}�\�뮻�\�\�{�\���]\�q\�O�\�痿�\�\�{���]c�����\�c�e�_xᅂ\�m�^�\�@D�f\�j\�ؚ?~�)\�{y\�Ap\\\�\�]b�nZq�UtEl�\�\��`\�}\�\�\��.��(1�E\�Pqt\�\�tk�٪�avޭ؅ѫ\r�\\�\�\�U|2\�|\"���0�to\�\�\�1�Uo��,���\\�\��\�uh�\�\��\�\�N�2%�X�\"m߾�v6\�ɪ��\�Ρ\'5.�\�;�B+ۍ\�\�.@p	.��;�W�셭\\��  �@#bT�O�>#\n\�|ZZjc\�B�\\��y\�}�*,W\�1^�{����Cq\�\�1Z�u\�.�;;vK�\��\�\0 �,�\0 �,�\0\\�\�\\\0�\��Ep�\��Ep\0�\\�\0\\�\�.\0\\�\�.\0@p�Kp\0�\�����N\�Y��뀟J\0\\@�X�h\����\Z�\��m۶=P�u~*@peb�����`��?��\�{EO\�lEl͛7\�\��~*@pe����ܹsW\�\�lq��×x\�׉-\0\\\0\0\0.\0\0\0�\0\0 �\0\0\0\\\0\0\0�\0\0@p\0\0 �\0\0\0\0\0�\�\0\0@p\0\0.\0\0\0�\0\0�\�\0\0\\\0\0\0�\0\0\0�\0\0 �\0\0\0\0\0\0�\0\0@p\0\0.\0\0\0\0\0�\�\0\0\\\0\0\0.\0\0\0�\0\0 �\0\0\0\\\0\0\0�\0\0@p\0\0 �\0\0\0\0\0�\�\0\0@p\0\0.\0\0\0�\0\0�\�\0\0\\\0\0\0�\0\0\0�\0\0 �\0\0\0\0\0\0�\0\0@p\0\0.\0\0\0\0\0�\�\0\0\\�\0\0@p\0\0.\0\0\0\0\0�\�\0\0\\\0\0\0.\0\0\0�\0\0 �\0\0\0\\\0\0\0�\0\0@p\0\0 �\0\0\0\0\0�`)�c^|�Ň�-[�vuuu�;w����y�\�E����T	.\0\0(#[�/N555魷޲tҲs\�δp\�\�݅��O�\0\0e\"F�\�V����\�Ν�Np\0@��\�\�N\�Y\n�u@p\0@��c��N�\n��\�\0�2�\���=��bZZ;\�l�\�\�:�$�\0\0�#�=���\�\�K\�>vy�%��uBIp\0\0���k\� ��\�\�3��\�\0\0Z\\랼�dp\�:�$�\0\0�V\��s�-\\�N(	.\0\0@p	.\0\0�kW\�JX*�b�P\\\0\0@+�kÒ[KW�J�\0\0hep��mMz���\rw\',\\넒\�\0\0Z\\�lz���׉$�\0@�Rz��5k�N�>}\�\r7ܰ{ԨQ�bc���\�K.�䭫��\�\�o��\�򷂫\��\�i\�SS\Z\�NX�.\�	%�\0@\r��~��믿��\�ѣ\�\�ߞ�-[��mۖ�\�ۗB|���I+W�L� K_�\�\�\���׿�yȐ!�\�[iϮmi��\�%�\�uq�$�\0\0\�A\na5h\�ĉo^~�\�YL<x05\�\�ի\�W\\qp\�С\�z�\���\\o���o����}e\�\�ʗ�M\�\�hW�ח����\�\�/�|EE\�\�Bl�*���3�\��\�\0\�!\n�ṭ�>:ذai\�̙-\n��fϞ�\r\Z���G�\Z�Íj\�\�\�j$���Ņ\��\���b\�x�\�\0\�\�Z�`��#G��\�ק��y�\�T�������WsF��\Z\�N�_��$�\0\0\�bd+b+�\�jKqC�\�S\��\�	�\�\�\�\�\�Ժ\�7\�HH\0�.\'�ي\�\�jd�������\�*D\�)\�\\�\�[\�̙c\0\0�����\�{+�\�jO�=�\�޾}�.\\��2K!\0\0��Gy\�\�1\����S{>|��rڵPp	.\0\0()F�\�<[1�{Gx�\�g\�*�Q.�%�\0\0��5k\���2�d���\Z4hЎ�|\�+ӕ_������\�3�Kp\0@�M�>}\�wܑ:ҤI�V�kLW~]ℸ�Dx�\�\�\�l�%�\0\0�\�n�\�\�˖-\�\�\�zꩧ6bffw��\��\�F��\�\0��F�\Zu`��\�\Z\\;v\�)\�\�n\\�#^\�\�%�\0\0�4p\���o߾\r�x�B�\�\��U<\��\Z\n.�\0\0M�EghF\�t�Ep	.\0\0(i��\�t�\�޽{wt\��}��9�W�^\�\�\��\�\0��F��VG\��\�+���\�U\'�r\\��i�_ߚ�\\�pa:\�sZ���߳\�\0�G7n܆���pΜ9��\�,�K+**��~huFpu\�}�\�\�	.\0\0(��\�\�\�\��p�?��np�FG��Rp\�\�hW�L�y\�\�u�>�h:\�\�ұ\���?��l\�ƍ\�q\�\�`�,_\Z[#^��zjv?\'�|r�����\�\�M7ݔ}~\�UW	.\0\0z�������1\�\�v\�$����A�7\���u�]\n�ϫ��c�\�\�O<1�nӦMi��\�\�\�y�Ղ������[�f\�\��6���N��}4h�.\0\0z�o|\��[�reG\�Nx_!��\�k\�\�F�b�|��?�\�\��:�\�s\�m�ݖv\�\�\�\�\���\Z;vlS\�\�s���\�}Op\0\�3}��_\�}\�e�\�Q�]����***�W�W������F�\Z�>�\�g\�?��8�N9\�\��̙3\�k\���1\"\�\�0v=\\-�|���g��\�>�O8��QN�\�b�X,��.�Ї��צ>�\n\�`C�]\�\�)��ѭ\�%�\�&�\�:\�캥K�f�\�\��\��u\'�pBvy�\�\�uF\�\Z[�׵jժ:�\�\��߮��*��\�\'�\\-����\�~Z�bE���\0(?H\�=�\\�\��\�y\�{߻^tu�8�jРA{ׯ_\�.��k֬y��\�+**N)�׭+\�K/����\�/g#L�\�_\�`ĺ�\�+�t\�I\�裏N�\�w_����.v�\�㰊���/�\�c�=�}~\���k5gΜ��K/�tc\�\0@{�\�����\��m\������:􍚚�6�}�\�UYY�R9\�Jؑ�ei޲w\�\�Կ��\�]�>}~Z�y�P���i�\�z�\��\�\�\�\�*v#��-\0���v\�\��-lrlP@��o߾�����F�bd+b��\�{E9�^��k-1\��U��#�\"�\n\���²����\��v�\�#�\�P\��JUU\�\���\��D\Z�n�\�i�aaX���\�\�ZK�c�\"�J�X\�\��M\0\0�+�\��骬��:t\�U�V\�m��ݾ\'�xbF!\�V\�\�v̖\�\��\�\�\�yW}��[\0\0\\=$��3\�k\���57\�p\�\�_�\�W/m۶m{��\�޽{w��\�+��7o\�/���\�\���\��b�V�j�\�l��Kpu\�\�:�h�\�����\�\�_�z��@x�n�\�\�s8O=�T��6�\�g�I\�sN6	ML6�\�|&;ix[��\0 ��\�]���]\�@}��l:tLL:�qka�YX\�\�\�XOz]�\�\�\n�&O��}\'�\�o�\��947���o�6[�nݺlZ\�����\�\0��\�\�\���O\��1r�o؇��\�>�\�گ���s��\�_�Ev*�|t\�\��\�\�i�?��d�(~���\�\�\�H\�u\�]\��\�Fk\�<�@�\�)\�\���\�}.��O|\�\�駟n�s{�\�I�\\rI6\Z�s饗\�N&R\�\�\�I�\�<�8\���kG�z�\��\\K���9\�JR\�O\\�q\�\�\�FUc\���!C��8\�3j\�#_�m�u���\�`]����?�s�_Ӧ^�8\�\�\���\�g_\�ⱶl\�r\�u\0.\\��[W~96n|��\��k��&��ꫯ\�.G\�_\':�\�o�}\�][�\�ێ;�\�O<�\�:��裏\�ij/?�\�#i�\�\�u\��{:\��\�c\�=>F4�9���\�\'+>�@h꾛.\�y�y\�b$j\�ڵ\�\�\�{n��i\�5lj4\�[n\�\�E��9�6���}G�\�\�\�w[,~N��\���u\�-Z�(����o�k\�\�k?#q9^\��ى\��kj\0��\�\����\�o�}\�C\�o�\�o�\�?�яfAP|R\�⯉�\\�\�0��\�+��\�\�6�[!�i\�s(��x>�\�\�q]S�\�\�\�\�p�\�V?vS�\�\�v��c�\"`\"�\�va\���{��.ך״�\�\"M���\�o�=;\�:\0.�\�-w)�Q��\�\�\�I�&e/�\�\�n\�\�nd��\�?\�)�U�9\�\�\�A�JGWq��\�1J\�G�����+^�\�+֚״�\�\"�[�`A6\�I\�\n\Z��c\��\0��Kpu�\�\�w\�w#�clbd!߭+v}knd\�:ip廨ŨNsv)���]يw�]�\�8�*�q\"\�\�>����\�\�0�\�#f<\�\�\�#Wq\\T�@Ƀ6v�{�\�g\�Hs�\�8�,�\�x�\�\�\���\�u_�җJWk^Ӧ^����\�\r1v[�\�ct�p\�\0\\ �W�	��M���b\�b��X!4\'2b�������Ip\�.��\�\��\'Dh�\�9\�1QD|O�D\�<��\�\�#\"3Fr\�Z�<���?\�ND�\�,Ť���{\�\'\�}3v1\�\'\�\�\��O���>v�\�\'�h\��\�_\���cΊ\�\�qXq��;h�6���5�iS�E|�IGb]|]<~L�r�u\0.\\��\�W)1�\�\�\�\�\n�e�\�\��\�BpYWGW��\�HD쮖O\�Ny\�G�\0@p!�,����\0@p!�,�Kp\0��\�\\\0�\��W]]-t�β�\\\0Ŷlْ�.]�\�wv�a\�ұ˼y�ҢE�҆\r�0\n.h�\�\��8ߑ\�\��e۶m\�\�\�	.\0�ck�\�\�\�\�\�\�]v\�ܙ�}���~(�\��������\�W_}u�7\�\�يؚ7o\�K�\�?\0�\�[]\'�b��-V\�\�?\�ܹ+bw�\�8\�?cƌ\�эwW�\�}]KcKp�?��w�c�\\\�\��cf�G�^��\�\�]p�1�[	.t�>}��]���*�@O�\���=��bZZ;\�l�\�\�:�$�p���HDǡe�\�\\\0=-��\�ږ��3.=�\�\�u��.\�	%�%��\�\�Ƨ�ѭ|)\���Kp��\�ں�\rb+_^^;S(	.��:6f\�V>\�Փ�\�\\\0�kݓ7��X\'��\�\�dt+_***�]p	.��\\\�Ͻ�dp\�:�$�К\�x��\�:�,\\�@p	.�%��6\�\�i\�r	.\0���\n�X\'��\�Z\Z3����4c�\�\\�\�Z2�b�P\\�(\��\\\0�kp��mMz���\rw\',\\넒\�\\�\�\\\0�2�b\���=\r�+�I�\�H,]�4M�0!�1\"�\�\�/&&�ݛ(.><�?>UWW.��\�(\�\�z�ʹ\�)\rw\',\\넒\�j�7\�x#M�4)UUU�f\�Q\'�&O��v\�\�%�@xxނ�<�kϮmi��\�%�\�uq�$��\�g?�Y\�۷o�B��RYY�f͚%�@xxނ�כo�\�\�\�f_Y2��%n�5\�%��\Z\�\Z=zt�]c8p`��\�[Ӓ%KҶm۲ۅ}�������z�\�4eʔ4hР\�5r\�\�\�\�.��\�\�6�u�Q-�]��%\�y]t\�Eubiذai�\�\�i���ͺ��f�M|]��\�1^��\�\�!�\0h�\�jΨVS�]\�Ip�lՏ�\�ӧ�zd*F�f̘\� �\�\\ <<o�\�-�����/\�Ip\�b7\�\�8�9sf��\��\n.��\�\��e\\m!&\�(>f��b��g�8\�\�c\"\r�\�Cp �W���@\�n�\�x�����\�\\ <\0�Kpu9q��\�	2\�k6�8��x\"��n�Ip����ಔwp�\�8f#l\�\���bT�-\'\�\\ <\0�\Z<xpz\�\'�\�\�🫥K�\�9\�Vs�~o��2�\�/�}\�\�\�j�\�\��\\\0\�+\���\r\�6@�\�j럫	&\�\�.Nj\�n���\�\�?~�\�\�\�y.��\�0ΗhldBp	����\Z1bD\��e˖u\���z�\�:\�\�\\ <<o�С\�\�#\�ȂKp��\�U�~�j�߾}{�|_555��Ǐ	.��\�\�\r\�⑉\�%Lp	����*�\�^�\��?�\�\�\�y.@\0u�Epu������v\��c���\�-��\\]!��|��ک���������0\�.�г��~h\�\n�8�\�G>�t\�Ǧ�������2mܸ�\�ph#��\�͹}{-.L\�sN�>\�\�wߝN?��\\��\\9�\\��\�W�iƌ%O[*�n�\�lc�_�B6z�裏f�?�\�Ov\�\�j\�\�رcG:餓�)\�{Bp5�se�B@p	.���R#Z\�\r����\�Gy�\�����Z\Z:th:��\�\�q\���\r�v\�\�\�dp\�(ө������|�\�وP�mb����x\�^x�ُ#Wg�yf\�ǈ�\�o\�\��՜\�3fL:\�\��\����\����\�1nܸ\�v�=�XYWs~�&N�\�<\\�\�\\\0\�\\\�U*�\"X\�6��KJ�����\�C=�}�\�TpE-_�<mݺ5�\�\�O�s�E\�G\��\����81\�\�+��Ҭ\�hlī9�\����\�g�\�HV�@ݳgOYWs,]��\�H\����\���<XgvĦN�-�@xxނ\\]\"��>�\�lc3F\Z[��\Z\�\�\�q]S��iӦ4v\�\�l4��\�4v_\�y��>����Ws�K~9^�R�Z\�f�d$,�ٳg��\�p�X}��=쨮\�\�\�y.@puzpűZM\�R�\�Տ�\�宩\�:\�S�\�gΜy\�\���o\�\�\�\�\���\�j\�cU\�X�<\�ן�\�?���-l�\�\n\�\�+F(�Ǌ�^ڒ\�\�!�\0W�\�ԩS��\��\�;/ۨ}�ᇳ\��\�ǲ���X�\��b����+��U�V5z��6�\�=�\�=N���P�.�yT\�\�Z���묳Ϊ�f�\�\�\�L\�Q.���MyM�>�]\'&\�\�#f\�ܵk�\�\�\�y.@pu�\��%&��c�bw��\�\���|���\�\"\'��\�\�F\�|�4hP�����x�]۰aC��xv\�\�㮻\�ʎ��\�#쎪7iFs�T0}\�[ߪ=Mp�ɬY�\�L!�\�\����\���� �\�5�,-��}\�{_\�d=}�\�\�\�ѣ\�%�\"���\�_{�#G�l�\�_p��\\\0�Kpu�\�{�^p�I<���\�\�\�c�\�ֈ�+ލ0?\�V{#&�@x.\0�%�\�h)�\�ʣ��d\��D\Z1{aL\�\�q�\�*� #���>nKp��� ��\�\�v\�U�\��<]S�LI+V�H۷o���������f͚\�\�h��6F\�\�kdKp��� ��\�\�v\��\�\�[�\�l�\�1A�\�\�\�y.@p	.�\�\�ŨԤI�RUUU�B+B-γ՞�\n.��\��\�\\ecѢEi\�ĉ\�1^����Xdq�\�5\�\\�����ק�	.�@p	.��\�\�\�y.@p	.�\�\\�\�\\\0�\�\"�\\ <�\�\\��\�\��\\�\�\\�%�\0�%�\0�Ep!�@xx\�~\0�Kp	.\�[p.�\�\\�\�\\\0�\�\"�\\ <<o�.�%�\\ <<o�Х����Z\�.\�[p��=,^�8\�\�Ԉ�.�\�ر#`.\�[p�Ipmܸ1-X� ��ꫢ�\�\���\��g\\ �<o�P.��G\����\�\�,���-��Kp	.�2\r.@p��� �\0�\�\��\\\0� ��\�\�[p�\\ <<o� �@p�KpѶ�lْ�.]�Mml�\�_\�͛�-Z�6l\�\��Qp���\�-�\�-�/^�jjj�����;wf\'�u.�.��\�*#1�%��Nt\�(#�\\ <<o�U&b_\�t�%v1Dp���\�-�\�Dl\���\��.�E\'\�\�ܞ^\\1-��w]�\�\�q�H\\�\\ ��\�\��kϮm\��9\�ҳ�]^g�\�b�P\\�\\ �<o�E+�k\�\�_4��|yy\�L�$� �@pyނ�\�׺\'o,\\�N(	.�.\\��࢕���\�kKW�J�Kp��\�-�\\���\\���\\1+a�\��uBIp��͛7.@p���Wy׆%���X\'�W{���\�\r��(�\0�ո\�\�\�\�\�U\�VTT\�(||��\���²\�\�\�\n\��}��9[ �],�^۶&=�\������uBIp��o�1�ٟ�Y:\�3��\�\\s�\�\�!|w!�F\"\�w�\�YK\�k�)|ֻw\��(�\�W,����Ap\�u\"Ip�wl\�#\\\�z׻:%����Y�ZX6�$�\ZY��^j�%�\�Ė-[Ҍ3���Q�F��fo6UUUi��\�iܸqi\�ԩ\�\�_\\��7\�L��\�pw\�\�u�N(	����\�]/���\\1�UxO�V���\��\�5�\�zkZ�dIڶm[z\�7�\�a߾}���&�^�:M�2%\r\Z4���7\�W5 �W�̞=;�\��\�ѣ\�\�ߞ�-[��\�P�\�ʕ+\��\�\�\�׾��t\�e��iӦ	�²g׶�~\�\�\�pź��X\\m%��6U���<�Kp�\�\�\nz�\�uL\��\�Wű4lذl[g���\�z]<������]\�\��%�Zd\�ƍi\�ĉ\��\�/\�b*\�`�+�\nt\�W�K/�4�Y��gכo�\�\�\�f_Y2��%n�5\�%�\�*�S=\�%�@pu���:�(\�G�Z*�\�{�ԏ��:��\�\\�5k֬\�/73g\�lQh56:�կ~��G�\Z�Íj\�\\\�!��\�\\����W7߮�VG��\�V\�}����{�z@p	�&-Z�(�92�_��M\�/\���\�w��\�jΨVS�]\�Ip�6�Z:b\�Q\�%�@pu�Cdl\�\�*\��7\�\�KA �Wɑ���8&�-\��\r2$\�y\�=\"�Z[�\"�WG\�V[}�\��\�\�w%,��0v#l�v/\�\�x.�\�j �ي���\Z\�jl����\�g�)�\���r�	2:�~��&γU<AFk�\�:�8��\�D\ZcT�Kp\�q\�u׵�{c#hqL�\������\��=G��Nܝ���\�qly{o\�&h ��\��.�!\�-,�\�\��7�����S������v-\\��3\�?�\�\�\�N�\�>�D��k�c��\�\�n���<��<[��]|�ŵ\�էO�����=\��?g��\�?h���<�~\�\�>�lY�r	.�\�Y���DE,}�\�\�6�\�cs��\�׵Et\�޽;=�\�\�\�k�M]tQ�ޖ��\\�\�TXm~�8�qG�s��r]�$\\]0���\�K�\�M\��lْM�q$ӿ�T\�/�Х\�\�_��x\�	�%��tl\�?��6��]ű�/1�M�aZ�{a��*�weǏ��g\�[� �:|��pyF�~ٲe�ŹH�\�˥$\\];�j�rS\�\r�M\�bV�;C\�\�\'O��n�\�.��&�cc���Zp	�NW*�\Z�������o\�.���W�\�\�\�\��\�o\�\�!�[\�\�\\���S�n\\\��94d\�\�1憎�\�.]��\�-�+_b�\�\�F��\�j��\�R�Uj7�\�FTK\�8��\�\\\�\�M�\��r{\�NX_\�>]�=\�S�#��\�)K[רQ�:\�>�;v�\�\�\�n\\\�#^\�̂Kp�\�\�ic\�s�c�S-��ܷ��\�����w\�\�z���\�ڥ�^;%�\�\����O�>\�M-ڦo\n1kOG̞���;����\�`\\��=FNaj�RQu\���V\�Vn	\�~rd�W[o7>\�c��ESo�C�]�\�\��)���	���t��z65rښ\�j*���\���ձu�\� �:k��p�\�p!�h\�ciEEſ7q��6}c0`@��p\�ݻ�ێp\�\��\��f�Apu\���\\�GN[:K`s�\�Hb�~t��y�\0�\�\�Mf)DpQ�u.5�ծ�5bĈ?�+��\�U?�rG\\��\�\'k7�7m\�\�\�c&�^[w�\�w�\�O?�\�u_�\�K޾+WW]\�8\�#��\�\�l\�\��H\����y�f[� ���vS\�6W;��\�h\�7��u��g)|�\�\'�\�,�q�[L�_?��4��~�\�:\�S�N\�����t\�Iل\nqy͚5\�s��\\��\�����p�\Z\�zzp5Gee\�\�ſ\��\�\�߮�Y�\�t�\��\�\�Y\�\� �zXp\�9�:�<\\q��~�R#Zm\\1;d�[\�/��x\�6�Xw��\�g#aq�\�\�;\�sҙg��]�\�k�eq�=\�\�Ұaòs(\���\�m����\��\�\�?�|\�}����SO=5{\�\�\�O\�F��\n�q\�\�e\�?�\�c���\�\\�9-�\�p�\�\�F\���\�ٳg�\�k���\�\�75c�%\\=!�^|�\�l�\���LG\�ׯ_	\�5�\�̽��\�O����ſiQ\\_6?�pv\��<F���.�z\�W�\�\"�\���z(�<�+\�\�\��\��\�\�#�Hvy\�֭Yl-_�<�<�;�\���ؕ0���\�\���\�\�\�%�Z7r\�\�%���������{o��k�\�\n\�wx\�w\�\�E�5\�&+�Kp\�\Z3fLZ�re���/Z�(;aj�hMpE,ſ\�رc�\������]\�\�+\� �7\�X\���jɺ��b]�۟v\�i\�\�\�\�3>Fh\��q<Y|o�G�JT��5v�\�j�\�ikF�\�\�<\\ӦMK\\pAv����\�\�/�\�,��\�\�\r8�\�1ڔ�\��\�\�\�\���?�\�\�\�\�{\�{l�\"�W���\�\'\�\�.\�Q���;ＳGח���F��\������\�+~�XW��\'�pB�n��\�\�\���\�>\�hX\\\�)�d�\��\�	�<\�W�9ܬ�͍��FW{�_~yZ�xqv�\��\��A�����l����cAcw\�\��\�7�>>\\\�-۫�ȃh֬Ym�Z͟?��.\�l�\"�W�[al`��8V,��%\�/�\��Q���>:\�\�.�\�\�~�\��\�\��\�sOm��w\�y\�^W�x�1bŻFhź�r>B\�]P�V�jVp�u\�Y\��qlXs��\��i��kp55\�\�҈j\�\��ǻ\�+J\�OV�VW�WX�XY�YZ�ZG�p\\Ml\�N+����������,�\�{m�\"�W�☪\�HZ�~}�\�l�\�\�\�3\�<SV��Z\Z\\�\'O\�~�\�D�u�\�\��/��R\�籯y\�Y\�ڗOߜuŏ�f\�Iu#�b�\�\�\�(>\�}\�\�\�ǝ;wf\�\�v\�m\�m\�\�91��o}+�>�)\\\�?\���w��NtſoKwl,��\�\���\�b�\�\��0vA�c6\��H9��W�XDGW\�^\�\�s�\�\�\�ۍ0;\�V\�\�hS�%�J�\�\�\�\�q����m۶l6�rڕ���u�\�\�\���3j����/��\�v\�\�\�\Z]\�i\�SK&\�(�u\�1�{W?\�9P���GW�ɐ�4b�\�\�V��Q�zdd�\�-�\�j�8a_����F�bd+b\����\��R{W>\Z\�\�u��\�.��T��\�߽0b)�߶����_w�\��\\ ��\�H״\�c��\�c�L��V�X��o\�^�+t�d\��\����T�w\Z9�\�F�\\��EbV�\�\r\�\�?��M�#Z�a�A���.�\�jMt�\�\�Y�\��2޾\�U<{a+��&\�@p	�V�\�\�/ߗ\\rI�����\�\���� �܎\�\\�����Oj,�@puE1*էO����\r-��1v!Dp	�6q\��f\���?��?iɒ%\�\�_�=\�t\�޽\�\�{�_릛n\�F\�\�1�\��\\���\�n�\��\��\�Ͷw?UX��c�\n�L\��}�\�*>��c�\n\�]Xwv\�hs�%�\�\�ƍ\�-�ܒ\�r׷o\�:\�\�\�\��#c=�\�\\])�Z:B\�d.\\�\�\\.�UvZ�[`{\�F(�@p�Kp!�W����U���\Z.@p�\�\\.�\�j\�\�\�\�g#\�\�\\ �\0�%�\\��G�tu\�n�� ��Kp��\�\�\�\\ �\0�%�\\����\�3\�\�\�\\ �\0�%�\\��l\�1[�\�\�S�.\\�\�\\.�\�#m޼�S_p�\��\�Bp	. �@p!��Ep	.@p�\�Bp	.�\�Bp�\��ࢵ�����\�Bp�\��\�=,^�8\�\�Ԉ�.�\�ر#` �@p!�\�\�ƍӂҫ��*z�@l�_�\��\�.W�E\����\�\�,���-�.\\.@p�\\�@p�\��\�\\�\���\� �\0�%�\0.\� ��\�. �\0�.� �\0��Kp.@p�\�Bp�\\�\�\\\0�\\ ��\�. �.@p	.\0�.\\�-\0.@p�\�Bp.\\�\�\\\0�\\ �\\�\�.�\��.� �\0���.@p�\�Bp.\\�\�\\\0�\\ �\\�\�.�\��.� �\0���.@p�\�Bp.\\�\�\\\0�\\ �\\�\�.�\��.� ����K��	&�#F�~������\���%.><�?>UWW{�\\ �\\�\�\�p\�x\�4iҤTUUUW\�Y\"�&O��v\�\�\�EDp�\�Bp���~�����}��(�\�/���i֬Y^L. �z��;�7����:K�\�\Z=zt�]c8p`��\�[Ӓ%KҶm۲ۅ}�������ԯWս\�\�ͫ�ڑ#G\�޾1o�u }�\���\��\�\\\�\�}s֦�\�_^\"|\�J]tQ�\�\Z6lX�={vڿ���\�s\�\�\�ק���s\�f_W|?q�W�]\�,۔��s�.� ���qw�*��^��C\Z��\�iȕ�ӥ�=#��eV�\�\�H\��\���\�\'~�\�ܶ ��\�W\�\r��id\�\�\��*�t�o\���2\��\�5\�7�~_{1�5cƌ4p\�Ui\�ͿH#n�Y6\�5\�g��x�=�ה�\�\�秛�?3V�\�Ap�\�\\\0���z�\�\�N�\�R8\�ʛҥ\�~0U]44\r>6]=un�\��F6j�p�\��\�;珞v\�\�\"+<_���g,\�n\�.��\�F\�wʌy\��V��(\r��\�t鄻�믿���Г�\�>�0\���E�!�@p	.\0�\�}U�\�\�\�{1A\�\�17�\��\�5�|\�٭ٺ\�� 8�v����f�R\�\�ko�\�-Hw>�\\���c\��\��\\1z#^1�FY��׊u;�!�@p	.\0�\�}\�n{�\�y�\�u1�E\�Fx\��;Ӏa��\�ӧ�i�x\�w�b\�ld\�\�\�I�ْn�kvv}�mY�!-y\�\�Fs\�\�W��\�ve����4`\�7�\�GO���{qg��o^\�\�+F\�@p�\�\\\0��ۺ\�\rv��\�wf�i&���e�d��Y�űZ��ֳ��I\�\�\\�\�5\�Ϥʪ�\�^�s���wY��\�\'\�;ua:X�]\�5z\�\�TQQ�=\�7ޙEW\��h �@p!�\0�Uv�Oj�6���:�\�7��l6\�Éc��\�\��cŨZ̊��\\\�\�\���\�O<\�\�m�.]Z\�<[���}ҤI�\�\�\�\'\�\�U,\"\�\�/�}\�8\\ �\\�\�\�\�=��Ra3a\�\�\�I��\�X��+Fƶo\�^��\�>�l��\�\\�\�\�\�\���\���\"�@p!�\0�\�}�+_bd���׈#j\�/[��\��[�~}�����믿�\�\��\�HC�i�>W�^]\�d\� �@p!�\0�\�탫x\�+�~��\�^\�\�hU�\�OZ�;a�hѢ:������\�\�޽���\�\�\�\�%�����	�\��\�\�1;aSƍ\� �\��W��մgϞ\�\�\���ٺ1c\�4z?1[a�}�\���\�\�4:,\����\�F��\�:ujv��+W\�\�nڴi\��w���P6�9`���\��fS�GTS#\\����ko\'-����.X��Τ\Z˗/7\���\�\��UZ�\�\�����6�\Z\�ʯ+�X��a1\�p!�@p!�\0\�&�\��Z3f\�h�$\�͝���v<�@�\�[�\�\���\�//y_f)Dp�\�Bpt{��h\�7q\�\�Þ�+F��\�|�\�\�N^\��\�۷dpM�>�\�c:���GX�ti������7�͜9sjwI,\�\�0&\�(5\���\�O7�xkų#�:!3�\�&.�@Y��\�h�\�\�\r\�\�|�\�ٺ\'�|�\��q�VL�\�\�T�&\��;wn\�\�b���\�7 �\0\�\�~��\�\Z6lX�X����4iR�_��_��Al�;�\�\�\�\�C���\�M7\�\�\�Gp�\�Bp���\�㱊��Z�vm6�\�믿\�\�\�\�.��^zi�\�	\��\�FowO-�k\�./>����͚5�\�HU\\1#aDWS�,YR\�kW�Z\�\�6�\�\�o��Ap�\�Bp��G�nE1�\�\��\�;\�\�+��\�ڻwo�\�\�߿\���9ҋ�\���\�\�Yb���\�芙\�ث\�y\��\�Gx\�\�\�w#\�ϻUjB\r\\ �\\\0e]\�\'9\�\'҈\�c��|\�;\�I?��\�ŨV�yl9n���\�㣫�\��y��L��V�X���+��������`��t\�\r7d�V�kc\�\�\����C\��\�\�[�\�l�&\�@p�\�BpЈ��spUUU�(�\"\�\�<[v!Dp�\�Bp\��-J\'N̎�\�ׯ_��� �c���\�T]]�\���\0\\ �\\\0�\��\�\0\\ �\\\0���7fS\�\�mۖgǝ�;6;3�\\�\0Z`\�ʕ\�\�\�&\�\��\Z�\�\��e˖\�\�6oޜ�-[vؓ:#�@p!�\0\�Ѿ��\�8�֯_����\�4nܸ,�\\ �\\\0pH�\'�-̞=;]|�\�i��\�^T���\03g\�L\�Ǐop��\�ܹsӠA�ҧ>���\�w�;߀O��rJ\Z<xp�>nW\�������\0b\���#Gf\�d�	1>����3\�<3�(\�Ȏ\�\�ClŊ\�\�oNg�}vv�Rh�\�\����n%\"+&\�(��\"����*�z��\�Suuu\\�G�N��\�o�~b�\�\�N\�n�w\�\�:�_W|�.\\.\0z��\�8�\�?����\�>\�ܹ3�nҤI���YL=�\��%\�gϞ=\�מw\�y�#ay�\�D\Zf/\\ �\\\0�h1���\�~�\�\����\�\�\��n��8\�\�[�jU�\���8+�\�.�.\\.\0z�\�ͯx\�)���\��S�\��Ò%KҮ]����0aBz\�w\Z\�\����4dȐ\�Dɱ{a�1]k׮Mk֬�.\\.\0\�\�ƍ��\��c�b���\"�\�*�ӟ�4UTT�ݻwg�c��؞x�\�\'\�\�.F\�\"\��\�\�\�\��\�\�^�\��E�W�>\�\0\�Qb\Z�;�r\�駟\�\�v\�\\sM�\�7�Y{9F�⺘>����$�\�/�������~�ѱ\n��Kp�\�\�>�я\�?;\0�\��\��~6|nĈ\��믯s��ν��2��w��]�?~v�֭[S߾}\�m�ݖ]�]cd+�3�M�V��1e|�Y.va,5u<\�c\�ʕO696\�\��\�#�r\�)S\�=�\\�Z\0\�\�z\�올\\�\�x�\�\�un�\�_�:��\�F{\Z5jT\Z:th\�\�a�.�&�ۊ\�4\���\�\�k�>��Ǆ\�b\n�\�0\�݁|\�ՅM�o\�\��\�S��`\�g?�ٝ˖-\�e?w\0:\�1\�\�`7��\�G颋.\�F\�b+�\�u0ı_q~�ض�\�\�z\�\��|v\�lk��{�\�\����\�\�\�n\�\�:p`W�l��u��a�W���\�r\�7\�d�X,KG,��\�wT#9ŨV~��\�0v!�˯��Z���\�\�\�=�\�S\�\�cǎmp�\��ж����؍�f��\0\��\�\��xJ��#\\۷o\�\�(�8�V\�����}6B\�\�\�\�\�1\�\�O�>��HK�\�ڻw\�\��\��\��\0(k�\\r\�[U��\�3gN[Hŷ���\�up�\�͵\�\�9�\�O?�t�\�\�+���\�\�\��\��\0(kW^y\�\�իW\�\�P�Y\nc��\�η�f\�$\'N�3GDX\�jX��,��\�\��e\�>�\��\0(k\����\�)����<\\��`L�1iҤF\'e\�G��y\�\����\�뜫+W�<\\�x��O�>\�{��\0���#G��<���x��}\�cY �[�.\r><���\�W\�7��4f̘l\�+����\�{\�\�&.\�hr�x��\�+.\0�G(\�\�ő#^q\�UL~36%�ϊ\�\�~��\�\�U�Vծ��\�O;\��\'9�\�+.\0�\'׻cB\�\�*�Ѫ�\�;�\���J�0aB[����\'D���\�??��Ȯ\��Ϋ��8ū.\0�\�(D\�ݳgϮsr\��\���i׮]M\�ƍ�\�2��\�ڑ��k����\���7��\r��W�^\�x\��\0��{��ؠA��nٲ�Nt\�HW\�^X<\�Ec���\���\�\�1[�alk\�\�\�~���\���<ݫ\r.\0�\�\�߿��/�x_����c�b⋘�0����t\�1�\�q\\1=���˿d��w\�V6w\�\���/-l�*�\0\���\�;h�\�\�\�/�����t\�ɑ�9\�ؖȖ��8\�V��\�F��VX\�\�\0�!�H:��\�_�}L�\�J���\�\�\�aT\\\0\0�\�߿��C�\��\�SO\�ۿsCk\�\�ٳRUU�����\�1[�\�\0(������,0`�k/��\�}���sm\���q\�K/������\�Ł�f\��?�팥1�e6B@p\04/�N8p໋�%�\��Da9PX6�\�\��C^%\0�\0؞\0�	\0؞\0�	\0؞\0�$\0`{�$\0`{�$\0`{\0o�\0�\�	\0o�\0�\�	\0o�\0�\�	\0\Z{��X,�\�b9\�\�V\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���\�\�)�yl�\0\0\0\0IEND�B`�','');
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
