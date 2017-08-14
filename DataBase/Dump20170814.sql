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
INSERT INTO `act_ge_bytearray` VALUES ('250059',1,'JOURNAL___userdynamic-model.bpmn','250058','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"com.da\">\n  <process id=\"JOURNAL___user\" isExecutable=\"true\">\n    <startEvent id=\"start\"></startEvent>\n    <subProcess id=\"DYNAMIC_SUB_PROCESSJournal_Subprocess\" name=\"Dynamic Document SubprocessJournal_Subprocess\">\n      <startEvent id=\"dynamic_sub_process_start_eventJournal_Subprocess\" name=\"Start Dynamic SubProcessJournal_Subprocess\"></startEvent>\n      <endEvent id=\"dynamic_sub_process_end_eventJournal_Subprocess\" name=\"End Dynamic SubProcessJournal_Subprocess\"></endEvent>\n      <endEvent id=\"rejectedErrorEndEventJournal_Subprocess\" name=\"ErrorEndJournal_Subprocess\">\n        <errorEventDefinition errorRef=\"ERROR_DOC_REJECTEDJournal_Subprocess\"></errorEventDefinition>\n      </endEvent>\n      <sequenceFlow id=\"sequenceFlow-d13a3e9f-7179-4e13-823a-2a8043b112af\" sourceRef=\"dynamic_sub_process_start_eventJournal_Subprocess\" targetRef=\"TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_2\"></sequenceFlow>\n      <userTask id=\"TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_2\" name=\"Submit_Document(2 / 2 / DYNAMIC_SUB_PROCESSJournal_Subprocess )\" activiti:candidateUsers=\"System\">\n        <extensionElements>\n          <activiti:taskListener event=\"create\" expression=\"${docWorkflowListener.onCreateGenricTask(execution, task)}\"></activiti:taskListener>\n          <activiti:taskListener event=\"complete\" expression=\"${docWorkflowListener.onCompleteGenricTask(execution, task)}\"></activiti:taskListener>\n        </extensionElements>\n      </userTask>\n      <sequenceFlow id=\"dynamic_collab_subflow_2_2_DYNAMIC_SUB_PROCESSJournal_Subprocess\" name=\"Collaboration SubFlow 2 of 2 of DYNAMIC_SUB_PROCESSJournal_Subprocess\" sourceRef=\"TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_2\" targetRef=\"APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESSJournal_Subprocess\"></sequenceFlow>\n      <exclusiveGateway id=\"exclusivegateway_approval_1_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\" name=\"Exclusive Approval Gateway 1 of 2 of DYNAMIC_SUB_PROCESSJournal_Subprocess\"></exclusiveGateway>\n      <sequenceFlow id=\"sequenceFlow-4125be13-1b63-4610-ae1e-33014b595ff2\" sourceRef=\"APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESSJournal_Subprocess\" targetRef=\"exclusivegateway_approval_1_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\"></sequenceFlow>\n      <sequenceFlow id=\"docRejectedSubFlow_1_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\" name=\"Doc Rejected 1 of 2 of DYNAMIC_SUB_PROCESSJournal_Subprocess\" sourceRef=\"exclusivegateway_approval_1_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\" targetRef=\"rejectedErrorEndEventJournal_Subprocess\">\n        <extensionElements>\n          <activiti:executionListener event=\"take\" expression=\"${docWorkflowListener.onRejected(execution)}\"></activiti:executionListener>\n        </extensionElements>\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${approved == false}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"docApprovedSubFlow_1_of_2_DYNAMIC_SUB_PROCESSJournal_Subprocess\" name=\"Doc Approved 1 of 2 of DYNAMIC_SUB_PROCESSJournal_Subprocess\" sourceRef=\"exclusivegateway_approval_1_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\" targetRef=\"APPROVE_REJECT_DOC_USER_TASK_2DYNAMIC_SUB_PROCESSJournal_Subprocess\">\n        <extensionElements>\n          <activiti:executionListener event=\"take\" expression=\"${docWorkflowListener.onApproved(execution)}\"></activiti:executionListener>\n        </extensionElements>\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${approved == true}]]></conditionExpression>\n      </sequenceFlow>\n      <userTask id=\"APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESSJournal_Subprocess\" name=\"Approval (1 / 2 /DYNAMIC_SUB_PROCESSJournal_Subprocess)\" activiti:candidateUsers=\"arun\" activiti:candidateGroups=\"Approver\">\n        <extensionElements>\n          <activiti:taskListener event=\"create\" expression=\"${docWorkflowListener.onCreateApproval(execution, task)}\"></activiti:taskListener>\n        </extensionElements>\n      </userTask>\n      <exclusiveGateway id=\"exclusivegateway_approval_2_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\" name=\"Exclusive Approval Gateway 2 of 2 of DYNAMIC_SUB_PROCESSJournal_Subprocess\"></exclusiveGateway>\n      <sequenceFlow id=\"sequenceFlow-9d7a3173-ad9f-4e31-91c3-4da5ed92b6f7\" sourceRef=\"APPROVE_REJECT_DOC_USER_TASK_2DYNAMIC_SUB_PROCESSJournal_Subprocess\" targetRef=\"exclusivegateway_approval_2_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\"></sequenceFlow>\n      <sequenceFlow id=\"docRejectedSubFlow_2_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\" name=\"Doc Rejected 2 of 2 of DYNAMIC_SUB_PROCESSJournal_Subprocess\" sourceRef=\"exclusivegateway_approval_2_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\" targetRef=\"rejectedErrorEndEventJournal_Subprocess\">\n        <extensionElements>\n          <activiti:executionListener event=\"take\" expression=\"${docWorkflowListener.onRejected(execution)}\"></activiti:executionListener>\n        </extensionElements>\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${approved == false}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"docApprovedSubFlow_2_of_2_DYNAMIC_SUB_PROCESSJournal_Subprocess\" name=\"Doc Approved 2 of 2 of DYNAMIC_SUB_PROCESSJournal_Subprocess\" sourceRef=\"exclusivegateway_approval_2_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\" targetRef=\"COLLABORATE_DOC_USER_TASK_1\">\n        <extensionElements>\n          <activiti:executionListener event=\"take\" expression=\"${docWorkflowListener.onApproved(execution)}\"></activiti:executionListener>\n        </extensionElements>\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${approved == true}]]></conditionExpression>\n      </sequenceFlow>\n      <userTask id=\"APPROVE_REJECT_DOC_USER_TASK_2DYNAMIC_SUB_PROCESSJournal_Subprocess\" name=\"Approval (2 / 2 /DYNAMIC_SUB_PROCESSJournal_Subprocess)\" activiti:candidateUsers=\"gaurav\" activiti:candidateGroups=\"Approver\">\n        <extensionElements>\n          <activiti:taskListener event=\"create\" expression=\"${docWorkflowListener.onCreateApproval(execution, task)}\"></activiti:taskListener>\n        </extensionElements>\n      </userTask>\n      <userTask id=\"COLLABORATE_DOC_USER_TASK_1\" name=\"Collaboration (1 / 1)\" activiti:candidateUsers=\"arun\" activiti:candidateGroups=\"Approver\">\n        <extensionElements>\n          <activiti:taskListener event=\"create\" expression=\"${docWorkflowListener.onCreateCollaborate(execution, task)}\"></activiti:taskListener>\n          <activiti:taskListener event=\"complete\" expression=\"${docWorkflowListener.onCompleteCollaborate(execution, task)}\"></activiti:taskListener>\n        </extensionElements>\n      </userTask>\n      <sequenceFlow id=\"dynamic_collab_subflow_1_1\" name=\"Collaboration SubFlow 1 of 1\" sourceRef=\"COLLABORATE_DOC_USER_TASK_1\" targetRef=\"TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_3\"></sequenceFlow>\n      <userTask id=\"TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_3\" name=\"Publish_Document(3 / 2 / DYNAMIC_SUB_PROCESSJournal_Subprocess )\" activiti:candidateUsers=\"System\">\n        <extensionElements>\n          <activiti:taskListener event=\"create\" expression=\"${docWorkflowListener.onCreateGenricTask(execution, task)}\"></activiti:taskListener>\n          <activiti:taskListener event=\"complete\" expression=\"${docWorkflowListener.onCompleteGenricTask(execution, task)}\"></activiti:taskListener>\n        </extensionElements>\n      </userTask>\n      <sequenceFlow id=\"dynamic_collab_subflow_3_2_DYNAMIC_SUB_PROCESSJournal_Subprocess\" name=\"Collaboration SubFlow 3 of 2 of DYNAMIC_SUB_PROCESSJournal_Subprocess\" sourceRef=\"TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_3\" targetRef=\"dynamic_sub_process_end_eventJournal_Subprocess\"></sequenceFlow>\n    </subProcess>\n    <sequenceFlow id=\"sequenceFlow-8a9e3d1e-f1e4-4e08-84ed-5ecbc85e41ab\" sourceRef=\"start\" targetRef=\"DYNAMIC_SUB_PROCESSJournal_Subprocess\"></sequenceFlow>\n    <boundaryEvent id=\"REJECTED_ERROR_BOUNDARY_EVENT\" name=\"Rejected Error Event\" attachedToRef=\"DYNAMIC_SUB_PROCESSJournal_Subprocess\">\n      <errorEventDefinition errorRef=\"ERROR_DOC_REJECTEDJournal_Subprocess\"></errorEventDefinition>\n    </boundaryEvent>\n    <sequenceFlow id=\"sequenceFlow-959f383a-819b-4cb5-8a67-83a54119b006\" name=\"Rejected\" sourceRef=\"REJECTED_ERROR_BOUNDARY_EVENT\" targetRef=\"start\"></sequenceFlow>\n    <endEvent id=\"end\"></endEvent>\n    <sequenceFlow id=\"sequenceFlow-432c1210-ba11-4690-b25e-91ccbab11285\" sourceRef=\"DYNAMIC_SUB_PROCESSJournal_Subprocess\" targetRef=\"end\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_JOURNAL___user\">\n    <bpmndi:BPMNPlane bpmnElement=\"JOURNAL___user\" id=\"BPMNPlane_JOURNAL___user\">\n      <bpmndi:BPMNShape bpmnElement=\"APPROVE_REJECT_DOC_USER_TASK_2DYNAMIC_SUB_PROCESSJournal_Subprocess\" id=\"BPMNShape_APPROVE_REJECT_DOC_USER_TASK_2DYNAMIC_SUB_PROCESSJournal_Subprocess\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"570.0\" y=\"135.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway_approval_1_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\" id=\"BPMNShape_exclusivegateway_approval_1_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"480.0\" y=\"83.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"COLLABORATE_DOC_USER_TASK_1\" id=\"BPMNShape_COLLABORATE_DOC_USER_TASK_1\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"810.0\" y=\"150.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"rejectedErrorEndEventJournal_Subprocess\" id=\"BPMNShape_rejectedErrorEndEventJournal_Subprocess\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"845.0\" y=\"20.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_3\" id=\"BPMNShape_TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_3\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"960.0\" y=\"147.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"dynamic_sub_process_start_eventJournal_Subprocess\" id=\"BPMNShape_dynamic_sub_process_start_eventJournal_Subprocess\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"94.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESSJournal_Subprocess\" id=\"BPMNShape_APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESSJournal_Subprocess\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"330.0\" y=\"77.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"dynamic_sub_process_end_eventJournal_Subprocess\" id=\"BPMNShape_dynamic_sub_process_end_eventJournal_Subprocess\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"1110.0\" y=\"162.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_2\" id=\"BPMNShape_TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_2\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"180.0\" y=\"79.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway_approval_2_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\" id=\"BPMNShape_exclusivegateway_approval_2_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"720.0\" y=\"135.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"0.0\" y=\"100.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"1210.0\" y=\"100.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"DYNAMIC_SUB_PROCESSJournal_Subprocess\" id=\"BPMNShape_DYNAMIC_SUB_PROCESSJournal_Subprocess\" isExpanded=\"true\">\n        <omgdc:Bounds height=\"230.0\" width=\"1080.0\" x=\"80.0\" y=\"0.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"REJECTED_ERROR_BOUNDARY_EVENT\" id=\"BPMNShape_REJECTED_ERROR_BOUNDARY_EVENT\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"929.0\" y=\"215.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"dynamic_collab_subflow_1_1\" id=\"BPMNEdge_dynamic_collab_subflow_1_1\">\n        <omgdi:waypoint x=\"910.0\" y=\"180.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"922.0\" y=\"180.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"922.0\" y=\"177.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"960.0\" y=\"177.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"docRejectedSubFlow_1_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\" id=\"BPMNEdge_docRejectedSubFlow_1_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\">\n        <omgdi:waypoint x=\"520.0\" y=\"95.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"532.0\" y=\"95.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"532.0\" y=\"35.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"845.0\" y=\"35.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"docApprovedSubFlow_1_of_2_DYNAMIC_SUB_PROCESSJournal_Subprocess\" id=\"BPMNEdge_docApprovedSubFlow_1_of_2_DYNAMIC_SUB_PROCESSJournal_Subprocess\">\n        <omgdi:waypoint x=\"520.0\" y=\"110.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"532.0\" y=\"110.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"532.0\" y=\"165.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"570.0\" y=\"165.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"dynamic_collab_subflow_2_2_DYNAMIC_SUB_PROCESSJournal_Subprocess\" id=\"BPMNEdge_dynamic_collab_subflow_2_2_DYNAMIC_SUB_PROCESSJournal_Subprocess\">\n        <omgdi:waypoint x=\"280.0\" y=\"109.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"292.0\" y=\"109.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"292.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"330.0\" y=\"107.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-9d7a3173-ad9f-4e31-91c3-4da5ed92b6f7\" id=\"BPMNEdge_sequenceFlow-9d7a3173-ad9f-4e31-91c3-4da5ed92b6f7\">\n        <omgdi:waypoint x=\"670.0\" y=\"165.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"682.0\" y=\"165.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"682.0\" y=\"155.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"720.0\" y=\"155.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"dynamic_collab_subflow_3_2_DYNAMIC_SUB_PROCESSJournal_Subprocess\" id=\"BPMNEdge_dynamic_collab_subflow_3_2_DYNAMIC_SUB_PROCESSJournal_Subprocess\">\n        <omgdi:waypoint x=\"1060.0\" y=\"177.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1110.0\" y=\"177.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"docRejectedSubFlow_2_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\" id=\"BPMNEdge_docRejectedSubFlow_2_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\">\n        <omgdi:waypoint x=\"760.0\" y=\"147.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"772.0\" y=\"147.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"772.0\" y=\"35.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"845.0\" y=\"35.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-4125be13-1b63-4610-ae1e-33014b595ff2\" id=\"BPMNEdge_sequenceFlow-4125be13-1b63-4610-ae1e-33014b595ff2\">\n        <omgdi:waypoint x=\"430.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"442.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"442.0\" y=\"103.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"480.0\" y=\"103.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-d13a3e9f-7179-4e13-823a-2a8043b112af\" id=\"BPMNEdge_sequenceFlow-d13a3e9f-7179-4e13-823a-2a8043b112af\">\n        <omgdi:waypoint x=\"130.0\" y=\"109.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"180.0\" y=\"109.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"docApprovedSubFlow_2_of_2_DYNAMIC_SUB_PROCESSJournal_Subprocess\" id=\"BPMNEdge_docApprovedSubFlow_2_of_2_DYNAMIC_SUB_PROCESSJournal_Subprocess\">\n        <omgdi:waypoint x=\"760.0\" y=\"162.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"772.0\" y=\"162.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"772.0\" y=\"180.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"810.0\" y=\"180.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-8a9e3d1e-f1e4-4e08-84ed-5ecbc85e41ab\" id=\"BPMNEdge_sequenceFlow-8a9e3d1e-f1e4-4e08-84ed-5ecbc85e41ab\">\n        <omgdi:waypoint x=\"30.0\" y=\"115.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"42.0\" y=\"115.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"42.0\" y=\"115.00000000000007\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"80.0\" y=\"115.00000000000007\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-959f383a-819b-4cb5-8a67-83a54119b006\" id=\"BPMNEdge_sequenceFlow-959f383a-819b-4cb5-8a67-83a54119b006\">\n        <omgdi:waypoint x=\"944.0\" y=\"245.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"944.0\" y=\"255.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"15.0\" y=\"255.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"15.0\" y=\"172.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"15.0\" y=\"130.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-432c1210-ba11-4690-b25e-91ccbab11285\" id=\"BPMNEdge_sequenceFlow-432c1210-ba11-4690-b25e-91ccbab11285\">\n        <omgdi:waypoint x=\"1160.0\" y=\"115.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1210.0\" y=\"115.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>','\0'),('250060',1,'JOURNAL___userdynamic-model.JOURNAL___user.png','250058','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\�\0\0	\0\0\09=��\0\0H�IDATx\�\�\�	pTe��q\�e\�r,_��:S׹3ε\�\��\�\\�\�\��ZN\�k�5\��e2��C��((Ȗ��\0㄁����AD�@XBBbþ\n&aMb��������\�s�\�\�\�N�\�%\�O\�St�9�?\'\�����KtئM��o�~�\�~�_\\p^U4\Z�F�\�h4\Z�F�\�h�\�\�㎳w\�}�l\�\��\� nB8����zJm޼Y���*\0\0\0\0\0�Xv\�\��{�n�\�\�^�馛j	\���\�@B8\0\0\0\0\0�x��\��\�d�.]^\'\�A̓\�R	\0\0\0\0\0��\�\���.]�ԑ� 0\0\0\0\0\0\�-�ze\�8 ��8\0\0\0\0\0�xF�8\0\0\0\0\0\0\�!���.�\�o�\�&�\�/\�\�\�8Ȃ\�?�\�CGlذA=�\�c^�m߾]=�\�\�\�S7\�p�����6m\��\�4N0\�\�k\�{\0\0\0��α�\�\n\�Ĕ)S�\�!C�\�m�\��j\����\\o۷o�^\�Y.�˿�K�p\�-�\�{\0\0\0��α�\�\�Ν;\�\n�B\�\n��+\�z\�!\�}$\��\�\�?�\�?�Y�f\����\�\��\�\�Ե\�^�~�\����\�=\��\�\�mR�6f\��\�\�\� \�w\�\�^Ӊ\'\�\�?�\��_�Bmٲ\��{---\��\�\�UG�<���w-b\�\�=\���`\�\�\�ӧUFF��\�gϞ���\�\�q<?C\�\�\\\�\�IGn?p\�@��\�\�\�\�\�\�֏ѽ{w\�c\�233������h�M*�~��_�����,�/_���\��]\�G�\�s9r$\�6_\�\�\�\���\�kG��?|�޿G\0\0\0\0 �C�	\�\�r��h\�\"}yԨQ��#F\�\�B�)))Q_|�|\�-�\��$��aw������o�\�\�y�-[��;溾t\�RU__\��\�\�ԣG}Y�\0�W\��\�AH\� \�\��\�s\�e	�=�� \�\���@D�K\�\�޽{�\�\'�|\�\�q�}����7\�|So�Ph����\�\�\�@D�\�x�\'c\�O<ᶭ��R}��\�!��>\�#r]>O\�;r\���m�\���>+����v���\��\��{\0\0\0\0�8t\� \�\�ŋ\�;\�P?�\�O�\�?�\�\�t\0aT�y\�\�ꫯ֗\�D{ذa�$\�[�L\� �\n�Pރ���~�\�e�\�\�c[}m��{V���\�\�g(ȑ�\�$�G��P\�\�\���9X\�f\�3��Y՗�I\04s\�L]yh��\�\�\�\����~�\�\�|�ֿG\0\0\0\0 �C��*�>B�\\\��\�\�B�\�A�2�M.�\\�2*A�\�{0�\0�\�	>\�\�\�\�G(\�\�Q�l\�d|�\�X\�f\�g\�ﳐ\�***�\"2�X��9\�m��<��\�\�\��sG_\�{��=\0\0\0\0A:Mg;5��\�\�On\�\�dh�\��ɘ���A�1DN���M�|\�P:��;\n\�\�e0\���Z�*\�����\�\Z\�k|�Rf��R2_�g\�a�?2�o\�Νn���\�-�\�������=��\�>�P>S��1\���a�rY�1m�\nM�.s���z}�|�\�\�\�\��=�c\0\0\0\0ġ\�q\�d\��\�\� �\�6��\�J8!C\�$�\�\�\�\nK\'\��\�$^A�\�]��`ރLH/\�\�k�&A�1!��ǖI�%|��!y�P\�\�7\�|\�8_�[\�ҒI�\�o޼y:d�!�\�\���K�y<\�.C������n�Lޯ+2��y�\�&�)C-\��\�����,\�_Y\�B�\��\��e!�@ۖ,Y���\�v	\�\�	����n\�\�׽\�{�\�6\0\0\0\0 �C�	\�|�J,�\�I&�7*Y�\�?\�� �\0\0\0 V\�u�\�\�\"G*^d��T\� qQ�\�g\�\��\0\0\0�\Z�8t� \0\0\0\0\0 \�\�@\0\0\0\0\0`�8\�\0\0\0�555j�\�\�*77W���)�á���?\�&\���\����UYY��C�8\0\0\0\01\�̙3���P����B7+M��)S��\�\�f>D\01� q\0\0\0\0b\�G}�RRR�\n\�<[rr�Z�b&��#�A\0\0\0\0\�h\�\�U\�\�un-Z�+Upyyy*99E��\�+]�ZFF�***R\�\�j\�[�z?\�\�ڪ���Ԏ;\��\�\�Ufff�@n����C5xj�\��\��}�ٗ\�Ţ\n�^9\�S�\�\0\0A\�\0\0\0\0\\6\�^5a���?\�s\�T\�޽ux֫\�K�o�,շo_UZZ�Ο?��\�}𤚳b�\�\�hkkSk֬\��3�q2�\\�CU/^�h9�̛�N\��J_޼�Q�<}=\0A\�\0\0\0\0\\6�\�\�Ԫ��\�\�\�\�Ҫ^�\\�\�/��\Z2�\�ty�\Z7�F�S/LY��Vն\��s_��Qe�z��\\\r�z�rl^\�]���\�_�\�5�\�+T��Q�\�X֮�mզCj\�\�\�\��m\��՟��\�\��\�gj���\�뿝U���QW\�\�Y�rF\�\�A�#%\����\��uu�\���.\�\�\��S�f}۶/�r��JK����\�+v�\��\�\�o�s\�]>;\0q\0A\0\0\0\�\�\�^ކ���\�!�Ҵ\n=$\�|Y�\�f-߭\��\�\�O\��\�s�;�\�z�\�o\�\�Ǒ�K���9S�0Rg���Zm���\�\�\�\���C_�%\�k\��GեK�\�\�\�\�j\�۟\�\�[�h\����nZq��k�W�!��\�ԀAý>�YK\�9�vs�\���\�p܂Yt\�W����\�Ê/\\�����\�\�t<�  �\0\0\0:���GԨw��n��t���\�|Y�\�s�\�\�g\�\�ᘞ��{\\	�$�\�{�r8ꏓV;�MV%%%j^\�^u䫿���nmmu�v����\�8c��ݲ�Q_�[�G�y2T5k���\�X�\r��\�\��%h3\�+�\�S\�u��������\�}\�[�\'�ϵb\�a�8b\�\rjq�\�\�=�\��|\0\�\0�8\0\0\0��j0_!S��ծ��\�\�\�I%܅ջ�\�R��W\�n�;��*U��\�`�R�\���\����\�\�n�I��TT�\�|wA<�75b\�\Z}���.^��*�Q\��\�ۋ�lS_kVuG�\�A؁\�\�3c��wN\�7v�Z��r0&\�g%43ޗT\�\�<t2tU���Q��\�\�߸O厣� \�\�k�\��<���\�\�q\0\0\0@\'b̓fn��]�\�L\�3*\�̗�ʠS\����\�ۨ�\�<����RAw\�\�~y�\�\�*8	\��yM�<�B\�\\�SM,�\�\"K+\��\�k�\�V��\�<��~��\�&\��j}{�\�}�*N�T��;�ͨ���U�\���w~\�\�O���\'�\�\�\�v�:e\�9�k|�T\�1��~�S\�]�ۤE[\\��Tܝ��X\0\�\0�8\0\0\0\0a���\�Z\�TVG����L\��\�/\�\�Q1*\�2D\�x.�7NVi\0;ā \0\0\0@\�$\'\'�ɓ\'�ݧ��\��edd��\�\��ݿ��P\�%\'��\�G_Cu��u\��\�\�\���\�C�\�|-@\0�ā \0\0\0@\�a�rS�N��\�\�ѣ]��}<Y��w\�ޮ�������\��;w\�Ts\�\�iw�̙3]����\��q �\0\0\01F\�e4�d�\�\�\�um߸q�\�ǫ��m�xcǎ��\�7\�|�����>\�;\\�ѯ_?�(\0� �A\0\0\0���\�\�r9��E�\�\�_u���\�]\�Rͭ��\�m?���J7\���\�\�\����ɭ�\0\�@�8\0\0\0\0\�+�3W����9s\�\�\�9�\�}\��s\�=�ZZZ\\�-X�@o<x�\�\�immu{\0�A\�\0\0H��Y\Z�F������\Z��gja\�>�Ҵ\nU��\�\�\�\�܅˷�ݫ��V�rF\�P��F\r�ӧ*#w�\�ÊV\����i�\�)�j\��ej�\�\n��n�\�s\�k\�\�\�՛ꝏ�Z\r|s�~1m\��\�\��\�\�ҪZ~�\0 �A\0\0�9����\�\�k%\\r�zyX�\�Y{Tbr[\�G�ɋ��o[ϫ_�^��^?�h�7��\�kT��)*�qzhkz��:H���9S�\�;X���p>\�*}[��Q3�.^����Ϩ�Y�X=U�\�\�*5�y�BB8y\�\�O\�0\0 q\0\0p\"�\�7�\�ݳ�8�@�z\�r\�v�\�9]ݦô�Y�fǗ�v	φθ<\�T�Iu\�\�o��C;Grʕ��4W��o�2d\��Wn�p\�hRg\��y�\�V�2r��戫\�}L���_\�G�utZ\0A�8\0\08���\��n�c�F�\����x�\Z�\�gz��E[T\�yz����U�?�R�.]R+7TW]\�f/߭>?��^]u\��KUZ\�\0U\\�P\�S9#��B��^Y�W�!��k\�\�˛T�+\�<\r��^U\�lU�\�^�~�jjޔuj�\�U\�\�\�\�\�\0\"� q\0\0p\"�\�7�｠��m!�AS+\�ԥ\�u\�5\�JU0n�V�=|�zy�\n]��a\���\�\�_B�c\�O\�\�\�\���z�p�\�gV\�6���qyXk\�h]Y�;~�n*Aܤw\��ʾEK��cM�_Ö��j\�\�5:�{n\�zu\�\�\�_\�\����N \"\�@\0\0\'�\08~����F\�\�&\�l\����\��Y�\��o�z�R\r\r\r�\�gϞ\�nU�mٲ\�\�󵵵�>}���+++\�K\0`�8\�\0��<\0�ߨ\��T\��&�Uiii�\�\'N\�\�\�\�\�\�n�J�޽{�\�\���3g�>ך5k��RkJ�:w\�_\0\0[ā \0\0N\�p�Fݴi\�\\\�X߾}\�B4�`�J�\�\�B���\�OڅpC��okk�\�\�\�q\�;a\�>|\0�!�A\0\0�\�\���:	ޤ:\�\�\�Ν\�ڶw\�^��·\�~\���2����n����\�{^�-..v=Grr�jnn\�\�`�8\�\0��<\0�ߘ�b\�\n�\�6�..\\�\�8���\�\�m۶v��[�\�\�\��]\�@\0\0\'�\08~cF^^^��Ls\�ҥKjذa����gϺm�.==\���\�\�`;�8\�\0��<\0�ߘ!\'HHf\�deT�\�-����\��%�3\��\�\�Q�\�0W_9\0@$ā \0\0N\�p�\�	\�rss\�\�3Y�AVS�������\��}��T��f0B8\�-q �\0�y\0�1G\�8\�a�\�d�\�\�ӧ�͛7���We�T�555���\n�\�o\�\�\��RiG%�h\"�A\0\0�\�\���Y2G�y5\�P���\�\�\0bA\�\0\0\�D\0\�oL�*�\�\�B���\ZT\0\'ބ	�\n fā \0\0N\�p�ƍ\�\�J5n\�8=�\\ZZ�[�&A�\�7j\�(UVV���@,!�A\0\0�\�\��\0؀ q\0\0p\"�\�\0`�8\�\0��<\0�_\0�\r\�@\0\0\'�\08~\06 �A\0\0�\�\��\0؀ q\0\0p\"�\�\0`�8\�\0��<\0�_\0�\r\�@\0\0\'�\08~\06 �A\0\0�\�\��\0؀ q\0\0p\"�\�\0`�8\�\0��<\0�_\0�\r\�@\0\0\'�\08~\06 �A\0\0�\�\��\0؀ q\0\0p\"�\�\0`�8\�\0��<\0�_\0�\r\�@\0\0\'�\08~\06 �A\0\0�\�\��\0؀ q\0\0p\"�\�\0`�8\�\0��<\0�_\0�\r\�@\0\0\'�\08~\06 �A\0\0�\�\��\0؀ q\0\0p\"�\�\0`�8\�\0��<\0�_\0�\r\�@\0\0\'�\08~\06 �A\0\0�\�\��\0؀ q\0bƑ#GTMM�*++Sk֬�\�\�֮]�*++U]]��y\0�\0\0�8\�H\����J555�s\�\�Ѣ\�N�<�***Tmm-��y\0�\0\0�8\�!VB*��\\\n\'\�O�p�\�ɱ\rN\�p�\0\�@�\�\\�r)\�$�\�{��&�/8���\0 �A��\�%*�\"A��S�8p\"p�\0\�\0�8�P�D`\� \�ۿ5���g��k\�\�&�\�6��\�����\�\��\0ā ��\�L\�ݯZ���=�F��\�_rkr�l�?Я\"i\�ر�\'��y\0�\0\0�8\�!��8*�L\�ݯ�\���]g�c{K\����?~��\�����w\��5j\'�\08~\0q �Cl&T.�D�_\�+\�3��m��U$C8#|������**a\'�\0A\0�  �#��r��Ė~�gM�\�~%\�\���H�p�n\�D\0\�/\0� q�=0�r��� �~\��\�_\�fl�s\�8N\��8\0\0A@GG`B`bK���}�+\�F�_�;��\�]ǉ<@\0 �\�\�\�Ll\�Wu\�E>��l�?Я\��׬V��?\'�\0A\0�  �CX*�L\"ѯNߥ��\�o\�:o�m��U�B�`+\�\�\n\�8�\�\0\0q\0AA�K&��+i��\�kק\�6��*Z!\\�\�ω<@\0 �\�R`B\��ID��\�Su��w��\�6��*T�f��q8�\�\0\0q\0A�&T.���_�4W�\�S|VZ\�6ه>A�\n5<װ\�HV\�q\"\�\0 \r\�9�����I\���UFF��#*55U�\�\�O�9R͘1C<x� �\�%�H�+gi�[�v��\�M��}\�c��`C3#��x�\�\�\�\��\��~��3�y� \0@$\\WZZ�O����\�̙3\�ƍ\��\�\�Ukk�\�.�655��[���s\�?��jРAj�\�\�qT.���_\�K�1�U8B8�rMB��\�[�q$�Z\r\�|\�/a\�\�ӧղe\�TAA�\�ݻ�>�7~ �\0\�q\�8p@�7N��\�K:dkkk�|\�;v��C������]�vu\� �\�%�0�++}\�_�Я��pB*ڮ�ad9�3�pF\�\�\�vmv\�8\�\�\�\�p\����UII�jii\�W� \0@\��b\�\nշo_}�L\0\�I�\�{���r��Į~jg4��\�_ᘷP\�_gus\��q\0\0�8�\�q���j�����6,�W__�C=�?��qT.�D�_\�\�W�H�\�\�իC\�|\r�\Z�ڙ\�8�7� \0@t\� N*\�$��9\�\�IO�\'��\"��r��� �~e�	�4	\�\�\�\�,\�\�\�m�B�`C8\�믿�~��ߩ�={�q\0\0��N!99���w`�\�\�(v��\�\�Z��-\�z\��bg����P4��\�w\�ڕ3w\�\��o��\�\�^0�\�y\��\�?7|���\���\��s����9\�r-\\�p��2.==]m߾=\�8\Z�	��~� \�h}���[!\�oxh0a܅B\n\��G�\�u\0 �\0\�ś���듒�rǗ���k\��lw�۷gϞ?�x\0�dɒycǎ�\�*��^x\��\�\�\�,��Ѝ3FW$D�T\�ɜqq4�8��*rA��B\�3�6��\�}��\�9�\�\�\�@\0 ��u�\���>�\0\�K;\�l�E\�nܸ1sܸq\�u`�ζ���}={��� .8���|\�\�ϟ���&+�&\�U�`X�ˋ~E�\nGg���!���Zj%�\�H\�\�\Z&� \0@/Up\�\�u�G��\�r\�YTT����u�ٙ3g�\�`�I�5}�t���\�\�\���\�qÕ*]�lٲu\�Z�\���\�&xu\\\�;���H�i��;w&TU�	�I(�I���\�W�ݯ:�?^mݻw\�P�᨞�pr]n\�y]�X2�\0�8\0\0A\\�z\�Ǯq���\��7�\�]�WY-~�\\L\�A\�~\�/\��PU	\�***6E`�γ\�\��q�9rD/\�Б\04X\�\�߿?� P�D\� .\�\\^���\�ٯ�֫W/�h\�\"���t\�H\�q\0\�\0\0q+\�\�B8�Rͨ|�T\��\�$\��EJ%\\W\�lq8�q�ɗ�\�;\�\�z�M�2EM�0!.*�\�\�L<�_�A\\G��g\0\�-�b�8\0q\0\0���\�\�\�\�5�������\rS\ryN8V\�lv8]	\���ɂv���Q999q�P�D\� \�s./�A\\(�J朐�\\��y��V��j*\0�8\0\0A���\�\����\�ǂM��3f̹H�ҹ|��)))5q�\r8P544\�z�566�\�\�\�L�\\b./;\Z�*�Z(ߡ��U�\n\��`�B8#l�ݗٳg�g�}V�\�\�S��8q���\�O�\�\0q\0\0��x�j^U��F�\�0գA\��t\�\��\�Z��_�~�	6D5���TPȸc;\��\��`T.Q�dg��R\�WTZ\�!\�*�VC�`\�8#�����Ԍ3\�\�/��W�r��\��Q#U\�j���\��\�?y�9\0q\0\0��HKJJ\�5/\�\�pV��[��s���\�U:\�%XU\\B�!˫\nR�D\�]�\�W%SG�\�}�\�\�\nC:�ߙ�Z�m�3g�\�֭�\�m��\��\�s��\����6\\����|C���8�I\0\'A�r\�I@\'A�v\�I��?p\0\�\0\����q�\'��F�\�\�C�nصkW�ݫt:�xot���\���\�\�~mw\'A�\�qgϞ�ۊ8*��\\\nG�\n4�W��j˖-nA��\Z\�\�\�[n�E\�\�\�\�\�\�\�\��\��\�ąF*㮺\�*�0N�\�;\�\�[���\��<�\�	\'�A��\�Vʚ�����`�\� �\0ą;�INN\�f>ϋ�\�O\�\�d���III|#s\�\�]o�*����;,�\�Eou\r�!\�\��\�g���k�q�|�6G\\$*���i\�&�\�#��뮻N\�p\�\r\�\�V\�\�\��$\n5Y�~�z�\�G-\�G\�M7ݤO��:� .p�me.�P��|�\�/\0�����}�\�L�I?�ʹ���[\�&�\�з�:uJW*ɾ\�o�<��\�\�j��z\�\�\�T�_zz��.\�Mҷ\�\�u\�ת\�o�]W��\�\�#G�Է/_�ܵ�<?A\\\�\�8�\�P-�|\�/\�\"8�\�\0\0q�\�8��\��͜9ӜW�\r�F\�x\�\�v�ҹa\��4�$�`S[\�#y\r\�g#C\��>\�\�\�\�f\�\�HU.��q\�*?۶mӗ�\�\�ą�\��&M��/<� .LB\�WR\�z\�m���\�G�zH�	\�\�v�w�d\��l\�2}Y*̬n�9O�8�o�\�Wn�\�m�\�\����q�].�\�\'?\��\�y\���ѣGu\'��\\�\�n��f�}N��\�\�---��3\�<\�z_q�\�9LUB4�hv~6\��y�|�\�\��\0\�S\�/�q^/6�ە�\�ر\���|#��U:�dE�8��]ɫ\�\�\�F�\�P�0a�n�,ҕK\�&a�|�F��`\�|ݸ,C\�\�1$��b�\�/�+��jM��I�!LR�$UJ\�}\�vs��\� N�sx\�Z��$�A��h�=2D_�\�^��e|g\�I3��`�\�e�o�\�{\���\��pr�\�W\'�ͳ�\�W�~\�\�v�8{ø��6\�y\0�\0�8\r\�\�\�4\�뻍\�\�ʺ���̯g��e]��Jgk<~�\�\��J)dX?��\�\�v\�\�\'s�H`\�Y\�&��|�7\�x���+\�	⤂ɨb2���+�$\01�K�R]]��,�o�z\�`+\�\�\'���L\"ۯ�~�i� \�hF0\�-l��\�\�6o\�y鿲M��\\�\�o���� �w\�\�U_/))�\�猰� .~øp�z�\�q\0\0��X\�i�\�qݮ\�Įd\\Fk��F��?Z��8!C\n\�ZŶ��R�\�\�;a~p�k��NBj	3\�;�p\�j篊)�@/\\A��j)�\��+�y�\�W\�G\�Y�f\�\�\�Xu\��\�\�͛\�\n\�z�\�ay����9\�\�a�p�͸nT�}��n�\�~�\�=�\���v\�jJ}���� \�::�4R\�Q9�\�\0\0��� �Z�>��A\\�^�.Ea�\�\�8��ۜ����iIڰ>r�<h\� [�\�$�{�\�w	\�|4c�,+�Z0UL�⌡�\�D\�Rq�\�WS�Lџ�,p`\�&U�\��t��a\�e�N�\�N��J������\��|2�X�DK?�&!��ɿ�r��\�ɓ���S�\�}333-��W_}\�U�I\�0.؊�H,\���<@\0H<q\\\�\�i��[b�\"n��\�\�#\�ĉ_\�\�q�\\�HqB��J%L$\�\\t\��w��qƐ=�\�~˖-�\�e�L�/\��\�٣W��.\�\\oFӓO>١ Ψȓ0\�<\'���㭷\�җ��Z*RA	CS;�G4�{Z���\�[m\�L\�?T�\Z\�Ez8*\'�\0A\0� .�r\Z\��\�1?G\�ȑ#\�\�^�sժU+\�h\�\�\Z�\��^��qR=#�*���y�\�?�\\%\'\'�\�۷\'\��p&�\�\�#�<�����\�\�V555zۜ9s�\�Re���\�5��9�d\�}�ݧ\�\�H\'\�e\�8y\�b��i���6+\�Rq\�\�\�#\�m\�l2TV��\�\�#��\�K�:t(\'�\08~\0�\��\�i\�b\�ԉ\'�c�*����˝/np���*\�l	℄>\�H�\ZNǏW���	5$5��	���~E��5�\�|3VG�+�\�D �\0\�\�BN\�\�g��\��͜9\�č\r�FF�񯹹�m\\��599���\���Kb������\�8���\�\�^K\����R����~E\������s8*\'�\0A\0� .�$\'\'w3B1��\�����\�$K\�\�ʺd<gRR\�C�^\�/���]�t�Z�j��\�UuI�\�fϞ�\�\�\�\�\�ܡ�N��J���LL\�W��\�\�E+�\�D �\0\�\�R\�����F�\\\�T\rw\�¨\�˞{�\r�`CU\\srr�6�ÑJ�3N*\����\�u���\��\�\�\��6\'�	�	��~Ew9|\�޽{\�B8N\��8\0\0A\\�p8YF8&�\�Ej�TYP1\'\'\�)�n\n6\�wEz�N��N�\�,\'�q\��\�{:��P\�O�����Vǎ\�@�={V�RYY�&L��+\�d_��K�\�Q	LL\�W�+��\�	\'��|\�ǉ<\0�_\0@g	\�222��\�4# �;wnD>�\�\�bs5\�ў={� \�ҽ�fff��\�*��v\�Z\�|��\�ѵKb�\�r\���\�o\�0SRRܖ�᧲ȃqRIי��Я\�W�U}}=\'�\08~\0�>���q=\�l��dŊa��֭[\�\�\���BSSSSrrr΄{�\�cǎ}���|8���F5��	�	��~N\�p�\0\�|�q�\�aY�\�8	\�\�\�\�\�L��^�^hJJJfvvvK�*\�NB�����]G+�	� �F�\�D�y�\�\0@CdZ4	\�\�a�S5��\n�\�\�c8��\�2�\�/6))\�����?��\�o;��C�o�)\�c��etI\\�&4�8\Z��yN\��_\0\0A\\�q��\��\����ռK��*8��t��p�\�KNN.s>Q\�m\�\��^��855U���J�9\�\�Lhq4�8�8~\0q�S7\�<g����5}�t�y�f�襱��T�ɔm�v\�\�_\�\�\�\\�\��p԰T\��\���r\�\'hz\�7�~�\�g��?\�`Z���ĉ_�]��ӂ���)))%��*�[� ���FG�_�y�\�\0@�8��ӎ��0Cs\�\�\�p8��\�\�?w\�E�^y!%\�6X*\�t.�&4�8\Z��yN\��_\0\0A\\��*����\\\�ﾺ 8\���u(jI�o��T�\��\�\�h�+p\"p�\0\��B\�~g!s\�%%%m�Rhf�\�B4\�ם\��z�%/\�[\�|Q�C\ZA�~ŉ<\0�_\0\0A\"\�-5�\�m&��	� �F�\�D\0\�/\0� �)\�s[i\"))\�)�8�\�50)++\���_�y b\�\�\�9~\0q�?7�G\�܉\�\�h%��%x`RUU���\�;�~kll\��(\�q\�\�USS����\\�\�\�֮]�*++U]]�cǎ\�\'>�/\�/\0� �\�\�p8�� \�F\�A\\$8p@UTT�����\�5B�\�\�Z~\�\�\��G��<yR�\��u7~�x��\�}Ou\�\�]�;j\�(�_\0\0A܂��~�r�!�C�q�E\�R$øu\�\�Q\�\�FG\n��\��B\�qT��\��M*⮺ꪨ�qq\0\0��8��\�\�s\�q�\�XXB\��K\0\�TJS)!\\�\�	\�\0\0q\�\r\�m&�C,�qT.Q�� N0w(A\\��\�7a��\�\�9\�\�\0\0q�\��%\�\0�AܷkP7\�V{׎\�M.\�m�gq�\��lvW\�\�\0\�\�\�\0\0 ��%�ki>���\Z�v.ɭ\�m��\0� .�p\�j�[��\�\0\�\�\�\0\0 ��� \�\�\�OڅpF;���\0� .l!\\�nv�qq\0\0�8�8�8\0\0\�l	\�����\�\�64��h�p\�?A\0� � � \0\0���	\���)�\�\�64��PZ��\�\�!�\0\�\�\�\0@GG��!\\���F�2� \0@GG\0\0A�-A���\�+��mhq��fFw�\�E�����\r�\��\"5gA\0� � � \0\0�8[���\�\"�A�l#@#�%�3*\�$D��\��ɍ�k5��u�p�q�O�V˖-S�w\�\���mmm\�:�#G����\ZUVV�.\�\�mk׮U�������\�H�8�8\0\0:[w\��.�gu~�a�\�\�d\ZA\\�!����+\'6�\�8sg�\�\�l\��`\��\���7??_������~��S�pUUU�����\�Ql\'O�T����NI�8�8\0\0:S\'\�Жy\�8���%�8�|�c\�B5a�\���\�G��&�p�p�\�IU\"\�@G\0@g\n\��N\�m�\�~X��6\�\�\�R\�	\�zm�\�\�!�p���Z\rׂ\r\�\�a\\�o!da�I_\�\�1�@GG\0\0A\\���\�㪶z�\�9\�d�\�\�\�R\�8\�~,M9�U\ZV\�l�\�^�u��\��N�\�\�3\�*\�B\�¨�\r�\�q �#�\0� .�\'\\\�}�\Z\�֩ݥ\�|�pF�}d_�\�:Og�>}�����7<4�0\�!�p�ѣG�:\�CB\� \�ۿ5���g\�ճ�\�e���@G�8�8\0\0\�8\�\nTGuA�g�6d5\�\�_��\�?\����\'�1��\�7ZA���߳jd�E|���{�~E�8�8\0\0\�8\�R\�:��\�ę+\�$\nv\�R+a\\GB8\�0.\�0\�D\nLh��\�WG�~\������%��A\�\�\0\0 ��z\�jg4N�\�;\�\n�E�u\�޽C}S��zV\�\�u��#\�u\�c\�\�\�w� �!�&\�\�W�\�\��� \�\��+�8\�\�\0@ׁyZ\�qv�co�W�^jѢE�=�@��BE\\��_��D�_\�YS\�3��m��A\�\�\0\0 �#�#�s\��y��#.�\�/C	L\�\�W �#�#�\0� � �\�A\\FF�*..�\Z�y��V��jj��_��D�_\�g_�J�\�\�Wq �#�\0� � � ���U�\n\��`�B8#l�ݗٳg�g�}V�\�\�S\r8PM�8Q}�駪���S&T.�D�_\�U�\�W���@�\"�AA\0\0�*�\�\�\�R�W�&�#��	�VQ�\Z�\�!\�K/�����Ԍ3\�\�/��233�\�\�P\�\�\�*\'\'G���\�\�?�<\��\�\�h�)�;u|�ڳ:�}�r\�&\�\��+�8\�\�\0Щ�8c�reeeqqQ\�2.\�p\�\��\��\r:\�\�\�H�&�q\�I0\'�u\�Ip\'ޙ3g\�60a!�I$���C[\�\�Sr}�~\�555z:�\�\�\\����&\�\��~�����|�\�\�\��%\�\0�I���\�\�B� � \�NRw\�UW��q;\�\�[���\��<�\�	\'CVe\�a���r\�\'�s0\�qc)0a!�ID��\�Su��\�S\�\�d��~�ώ\�\�B���\�sunoM~>O�2E577ā � \0�\�\n\�\�r\�@� � .\Za�ys�\��\�\���93���$\Z��������\�3\��m�}�~e\�G}�RRR�\n\�<�T3�X�� qq\0\0\�^g���aqq\�\�9LUB4�hv~6\��y�|q!$0	c��\�;\�P�N\�.\�3�3�\�#�RG��E�\����܆�\Z�r�\�\�ju��q\�\�\0������I\�رCM�>]O!\���̀\">�\0AAA\0\0q\�\�b#���\�w����j��a�q!$0	O�\nTGu�*�z�\�\����o߾���T�?\�\�c���\�\�F\�g~�C.�CU	\�\�\�\0\0@P�_�^�ԢE�\\�]\�qa\\�C�D	\�B\���~e�\n\�_u��~e��5\�n\�ܹ!W�I�\\qqq�0.R�z\�\�\�\0\0KA�g\0g�D\�_�\��\\\�:t(\�Of�\�\�mۜ9sT�n\��\�+W�{\�W]{\�\�{\�\�+�q\�9N\Z�\�q\�1���$\��*\�\�h���A����>)))	[�5\�5\'\�T	\�\�\�\0\0�\�A�̵\"�S\�\��C\r\�l\�\�b\�3\�6��U2o�\������w\�\�U]w\�uj���z	\�8\�\'���-3\�{\�B���4�U\�\�\�9\�\���9\�\�qqq\0\0�+_p\�:\�\Z8p��cT�>�����}��K�\�p\�\r�rNB-�\�}�Q��\\^��\�)������pL\�9}��Z�`�\�755U���ϟ?_�_�^W�IE\�\�߮�\��q#G�Է/_�\�\�v�cFn�\�\�+�^\Z\�\��\Z\�1���� �~�d詹bM��F�y����\Z\��\�\�\�\�\0\0�\�\'\\2\�m�ݦ~��\�j2�]/A�\�n��,Y��-[�/?��㖷\�j�\'N�зI\'�I�x�b}Y\�8\�.��\��\��N}�\�ѣ:�۴i��,�\�|�\�~�8�*�����\�.UVr{�=8኱0n޼yz��C�\��\�)�c!�	A�*�-\��\�M\�o�&L �#�#�\0\0�}\�%!��~2d���\�_�R_7\��\�ai\�2�ی\�m���!�r���\\�+�\�.�\�\�k��:s�\�+��\�9\�ۍ�P\�F;\�\�\�A�4盱:�]!\\�q4��*I��\�ꨑ\�\�\�sI^8n �#�#�\0\0��p=��\�n�\�\�漅mR1gu���d�\��7\�x�\�&��\��\�����_��3\�x�\�2��� \��\��\�\��J�w��aN���We��\�Q	\�h�v�fee�իWӯ\�W��+Y�\�<w\���\�#��\�\�\�T�>}\\\�)��qqq\0\0 .O\�e(\�\�W_��y\�\�m�f\�\��\Z��\Z��4\�0cx��m\�\�3\�3M�\0N�׍��>��-X۶m�� \��Է\�\�sr�\�\'�\�a�\�PU_?Xy����q\�\n\�\�h�r�\Z��\'��	��*\��j�\�Ѯ����ly]3g\�t=�,\�DGG\0\0\��D~ʔ)��PY\���\�X]T�T��e�	�\�\�ie���d��\�^\�5i\����+�!��O�<�o�:u�\�733\�RH�ꫯ\�\�e8�\\��;s���@\�E7�\�޽{\�B8�8Z�&F��!o�L�+�U��Unn�k�ƍmy];v\�p=��\�@GG\0\0�D\�_\�Ѡ*M��n��Vr\�{�E3|\���AC	L\�L̕L\��F��_��_����nohh�\�u555��S\�#�#�#�\0\0	\�\�k�n�f���R�\�	Wl������f4NlBH`bG`b�d��F��_��_��Gj�TO2���y	\�\�\�\0\0@\�q4��D� �!��}�\n0�\�\�W�\�b���ڢ��� � � \0\0\�\�\�\�\nhB�xA\\,��^�z�E�\��@�\��B$��\�\�\"qq\0\0�.N�_�	C	\�\�ٯ<�p�^0/v#S\�w\�}jӦMa�_\�\�\\��\�Ij~\�7\�t�\Z8p����б~\�q �#�\0\0qq[0\�BZ�C�я322Tqqq�\0.\�A�\\.//ח%��{���\�gҤI��\�����\��~Ū� �#�\0\0qq��\��!��\�.�A�q�\�k���ͳ\�M�`\�p\�\r�[�nj���~+\�-[�\��^��r�G}T8p�m?	a�2\��\�o\��X}\�---���c}�ԩS*\'\'G?�<���}��i���~5n\�8\�ϱ��\"[^\�̙3]ϙ��OGG\0\0\�hq�ą2�p	\�\�;\�\���KNNvV�+E�T\�֯_��H>\�9st�\����8㳵\�I�&M.߻�~y�\�7\�ˇ\�\�_岱���$Г˷\�v[\�!��pr}��j�\�\����q�^���ƭr\����}���6�\�Z��>MGG\0\0\�\�@ס!�S�N\�\'���\�o�\�F�\���X	\�\"����\�[n\�U3�\�#\�ꫯV�\�s�����\�I��f\�1\�_>��î�\�\�\'�\�}�\�ɓ>�K^O�A��_��\��\�(?\�JKK#އ�\�JII	XJGG\0\0\�\�Љut�T\�\�\�K�.��\�\�;_��T�I�\"���\n�@\�	�<�T<Lޞ\�?|�.+\�!s|\�x㍺\Zꭷ\�j�y�9R\�|�r�_�����.A�|����\�\'�WU�!�r�\�w\���*}R�\�k�|}ү��`ʹi\�\\\���Z=U���`<�T�AAA\0\0 �#�ǯ[� K��5��!v�	#d\�\�ѣG�m2$0\�pB+\�#C\�N�8a\�9��%V�C\�={�\�\�R�\�+��\��\�7�A����M�	>�����竒�}Y�\���\�|P_���ҏ\��?��?�%��\�V.>\\_�\nUϾ&�\��{}\�\�L�~%��T�\�ܹs#�<REl<�\�onn&�#�#�\0\0q4�8D\���\�w�7�T�y\�\�o���A\�\�\Z2d��^�:�\�\��\�\�\�\�\n�\�\��\�\�\�\�D#�\���|\'U��JuY^^�\�\�Y\�U�Nd(u]]�\�~y��a�\�3\�\�Ǔ�Hߑ\�ʎq\�dnEy�\�JR����%MB�@��q\�V�X\�6��\\�u\�\�E��	\�\�\�\0\0\0AA8~\�5	0�\rM�7\�\�W�еkW}٨T�2�\�\��-\�sxT�y_��\�q��{�\��\'\�f$\�2	\�\�\�\�]�;`����~�8�8�8\0\0�	\'\\\��uk3f\�\�\'�=z�\�\�Ԓ%K���\�+\�!vFX�m\�6\�\�	�>�g \���Cm��\�\�\�s�\n\�\��n\"���fT�y6~/D��\'	\�\�a�S�c;r?�pTi�3 Rs\�\�\�\�\0\0N�\���ۮ\��V2��ד�1��M\�\�\nu���F)�fffZNh�y̫�z{�Y�f\�\�dX�~��5X}_Aګ��\�\� �\��^�\'�\�\�\�u\�dnGYM���\�\�c\�~Rg^��\�\�=/AAA\0\0\���.�\�7L���Q\�z뭮E�J�\���=a�\�0UiR\�:}�t�y�f\�\�\�\�l�ʷ��&�k\�.5s\�L}�z\�W*\�\"U	GGG\0\08\�\��7aj�\�\�\��s�ү��`/�#μ�j(MVG�\�\�qqq\0\0 \�\�\�\�8\�\�&4�_��*j�����P����I�7a�E%�#�#�\0\0aUUU��zp�\�\�$LL\�W�\��4���jܸqz���4�\�M�:�nԨQ��H�AAA\0\0\����\n�\�W_q\�!\\mm-�&&�+\Z�\�1� � � \0\0�%���\�\�}Zt\Z!LL\�W4�8�8\�\�\0\0\0&4�8\Z�\nqqq\0\0\0\0A���~E�A\�\�\0\0\0\0��~E�8�8\0\0\0���F`B��_� � � \0\0\0\0�	�	��~EG�8�8\0\0\0���FG�_ā � \0\0\0 ���Я\�W �#�#�\0\0\0@`B`B��\�ā � \0\0\0 0�u\������\�~�8�8�8\0\0\0\0q&�VUU�����Nc�566\�`q �#�\0\0\0\�h	\�8p@UTT�����\�5B�\�\�Z~\�ā � \0\0\0�6�\�E2�[�n�~O�\�4B8�8\�\�\0\0\01�!�!@�8�8\0\0\0�!d!\0�8\�\�\0\0\06�q!d!\0�8\�\�\0\0\0\0��AGG\0\0\0\0\0`�8�8�8\0\0\0\0\0\0\�\�\�\0\0\0\0\0؀ � � \0\0\0\0:)c\�\\\��\�Ǖ������!C��\�\�b>$ �\�\�\�\0\0\0\0��ٺu�\Z3f�\�ׯ��?~������I9r\�u[}}�ڸq�jkk\�BDGG\0\0\0\0�\�\�ɓ�\�jkkհa\�\�ȑ#u( xqqq\0\0\0\0\�	�9s&,�SZZ���\�\Z\Z\Z�P� \�\�\�\0\0\0@�+))Q���\�n�p\�Z�f�\�\�\�T�\�����덠@u\�\�Ueee\��\�\���w>T qqq\0\0\0\0��d\���of�\�]wݥx\��@\��\�pB��͛7��\'��zH\�\�k\�pU\��AAA\0\0\0\0$(	\�dA�����ꊷ�+W���2\�\�\�\��\�\�{}����\�{�~gϞu{,�����FGG\0\0\0\0	\���\�\��=�\�S\�\'�P\'O�Է���t�-Z�\�\�㴴�\���\�\�\�U9\'$��XM� � � \0\0\0\0:	���NB5q�\�E=?ܴi\�ԤI��vsp\�i۶m\�\�g�ա����*CY�GGG\0\0\0\0	H����\�d�7�jT\�\�Z�UWW�\�\�fʍ=Z]�t�\�\�}�\�7*;;[UTT\�a�\�9\��\�ݫv\�\�Ň@GG\0\0\0\0	\����O�>�9\�d�YpA\�3��\��\�\�P�O�\�\�e��������\�\'�s\��\�~�x����� � .n�8�\0\0\0\0\0\�JJJ\�;\�\�.�Y�n\�\�\�7j\�(�\�+���K%�ܖ��\�\n\�\�|���^z\�u���\�\��\�\�qqq\�g?�Y�\r\0\0\0\0�5�\'OV7nt]\�\�\�Ucǎu\�\�̙3*99Y-\\�P}�\�jݺu���G����5u\�T}]��J%���Ξ=\�u��\'\��\� Ca\�\�U�ۺu\�.]�ԑt\�ż�]�\�x�\�\'�y\0\0\0\0/^�\�|3\������\�m�����:\\ۺu�\Z8p�\�\�\�QgϞ\�\�$��mr�Nq�\�6mr\�_�%d\�9CSS�[\�\07~�\��u\�\�\�u�.��x����<�\�ɍ763\0\0\0\0Xw\�5״�\�\�\�\�V�{�\�\�sR�&M��\n�[.//O�o�OQQ�\�n���S\�y�y>oy���4>l�D��J%ܕn�\�D<qq\�9[����h4\Z�F�\�h4\Z�\�y/t�\0�T����\�M��\�PT�~\�\�)�}�\�\�zۆ\r��\�!C��{\�ǽr�J�\�ܛG�HG\0\0\0\0H@\�֭;\�\�\�\�\"���A�f҆\r�d߯��ZW�M�6͵�[�\�8�}\�ܹ��>nA\�ٳg��\�ʧ �\�\0\0\0\0����ϟ��\�\�9GܪU�t׫W/e\�O*\�dj}}�붽{�\�}�l\�\�\�y\�w\�ĉ/��\�\�\�\�\�\0\0\0\0\0�6l؁;v�B2\�USe\�S9\�,//w\�d�Y�aܸq�\�d\�	\�d�U3\�US׮]���1�\��kq\0\0\0\0�`���\��Ͱf\�\Zխ[7}Y��\����^\'�7�\�o߮�\�\�\�W^y�\�~=��Z�r�\�zyy�𤤤���\�5�8\0\0\0\0@0���\�s�뮻tp�o\�>կ_?�\�\�z\r\�$�{�\�\�\���u�\\jj�z\��\���`Oϴ(�<\��\��\�\0\0\0\0\0�RJ�0�gR!\'s�ɢ�\"�?2����N�4I��m\�6׶��u\��*sŝ\�X>q\0	� \0\0\0\0,�\���@�9-�\�=z\�0-�ѣG\�.99YW\��uO=���ݤ\���kGW>u\0q� \0\0\0\0�ѣG\�)--u%f���:H{\�\'Tss�\� \���z��\�Ç�*\��\�\���Lw��n~\�Ǯ\��\�\0\0\0\0\0�\�ٳ\�]���g�9\�\�Ie�S5/�\�\�\�ɓ\��￯焓\�r~j\���\�%\�\�N&\'\'w\�\��\�\0\0\0\0\0�JOOO\�ӧOkC�\�(U=Ǜ,� ���;VUUU�B6�*�č7N�\���\�\�cN8�fCVVV\�9k�2��A\0\0\0\0舔��\����ŞI�nR햛��\��~u\�5\�\���n�eee\�9\�ꨆ\�\��>Y\0	� \0\0\0\0J�����ۯ\�\�\�T��\'M��Up\0A\0\0\0\0 \\\�\�\�rrr\Z7l\�\�z��y�\\kii\������\�U\�	 a\�\0\0\0\0\�\�\�p�:[u�^�N<xp�Rj��5�9翍��u�;\�y5cŊ�\�<7��J8VG�\�\�\0\0\0\0\0�\�p8�fdd\\o:�<*\�\�v�\�\�RRR\�\�SЩ\�\0\0\0\08\0~\0\0\0\08\0~\0\0\0\0�9(\0�C\0\0\0\0�9(\0�C\0\0\0\0�9(\0�C\0\0\0\0\0\�A��\0\0\0\0\0\�A��\0\0\0\0\0p\n\0�\0\0\0\0p\n\0Q�!H�\�h4\Z�F�\�h4�]�3q\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 H�jK\Z>�lo\0\0\0\0IEND�B`�','');
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
INSERT INTO `act_ge_property` VALUES ('next.dbid','252501',102),('schema.history','create(5.17.0.2)',1),('schema.version','5.18.0.0',1);
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
INSERT INTO `act_hi_actinst` VALUES ('250064','JOURNAL___user:1:250061','250062','250062','start',NULL,NULL,NULL,'startEvent',NULL,'2017-08-14 12:19:47','2017-08-14 12:19:47',1,''),('250066','JOURNAL___user:1:250061','250062','250065','DYNAMIC_SUB_PROCESSJournal_Subprocess',NULL,NULL,'Dynamic Document SubprocessJournal_Subprocess','subProcess',NULL,'2017-08-14 12:19:47','2017-08-14 12:19:47',NULL,''),('250067','JOURNAL___user:1:250061','250062','250065','TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_2','250068',NULL,'Submit_Document(2 / 2 / DYNAMIC_SUB_PROCESSJournal_Subprocess )','userTask',NULL,'2017-08-14 12:19:47','2017-08-14 12:19:47',NULL,''),('250088','JOURNAL___user:1:250061','250062','250065','APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESSJournal_Subprocess','250089',NULL,'Approval (1 / 2 /DYNAMIC_SUB_PROCESSJournal_Subprocess)','userTask',NULL,'2017-08-14 12:20:00','2017-08-14 12:20:00',NULL,''),('250098','JOURNAL___user:1:250061','250062','250065','exclusivegateway_approval_1_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess',NULL,NULL,'Exclusive Approval Gateway 1 of 2 of DYNAMIC_SUB_PROCESSJournal_Subprocess','exclusiveGateway',NULL,'2017-08-14 12:20:36','2017-08-14 12:20:36',13,''),('250099','JOURNAL___user:1:250061','250062','250065','APPROVE_REJECT_DOC_USER_TASK_2DYNAMIC_SUB_PROCESSJournal_Subprocess','250100',NULL,'Approval (2 / 2 /DYNAMIC_SUB_PROCESSJournal_Subprocess)','userTask',NULL,'2017-08-14 12:20:36','2017-08-14 12:20:36',NULL,''),('250109','JOURNAL___user:1:250061','250062','250065','exclusivegateway_approval_2_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess',NULL,NULL,'Exclusive Approval Gateway 2 of 2 of DYNAMIC_SUB_PROCESSJournal_Subprocess','exclusiveGateway',NULL,'2017-08-14 12:22:27','2017-08-14 12:22:27',4,''),('250110','JOURNAL___user:1:250061','250062','250065','COLLABORATE_DOC_USER_TASK_1','250111',NULL,'Collaboration (1 / 1)','userTask',NULL,'2017-08-14 12:22:27','2017-08-14 12:22:27',NULL,''),('250118','JOURNAL___user:1:250061','250062','250065','TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_3','250119',NULL,'Publish_Document(3 / 2 / DYNAMIC_SUB_PROCESSJournal_Subprocess )','userTask',NULL,'2017-08-14 12:29:23','2017-08-14 12:29:23',NULL,'');
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
INSERT INTO `act_hi_identitylink` VALUES ('250063',NULL,'starter','santosh',NULL,'250062'),('250069',NULL,'candidate','System','250068',NULL),('250070',NULL,'participant','System',NULL,'250062'),('250090','Approver','candidate',NULL,'250089',NULL),('250091',NULL,'candidate','arun','250089',NULL),('250092',NULL,'participant','arun',NULL,'250062'),('250101','Approver','candidate',NULL,'250100',NULL),('250102',NULL,'candidate','gaurav','250100',NULL),('250103',NULL,'participant','gaurav',NULL,'250062'),('250112','Approver','candidate',NULL,'250111',NULL),('250113',NULL,'candidate','arun','250111',NULL),('250120',NULL,'candidate','System','250119',NULL);
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
INSERT INTO `act_hi_procinst` VALUES ('250062','250062','3','JOURNAL___user:1:250061','2017-08-14 12:19:47','2017-08-14 12:19:47',NULL,'santosh','start',NULL,NULL,NULL,'',NULL);
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
INSERT INTO `act_hi_taskinst` VALUES ('250068','JOURNAL___user:1:250061','TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_2','250062','250065','Submit_Document(2 / 2 / DYNAMIC_SUB_PROCESSJournal_Subprocess )',NULL,NULL,NULL,'santosh','2017-08-14 12:20:00','2017-08-14 12:19:47','2017-08-14 12:20:00',12078,'completed',50,'2017-08-14 12:19:47',NULL,NULL,''),('250089','JOURNAL___user:1:250061','APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESSJournal_Subprocess','250062','250065','Approval (1 / 2 /DYNAMIC_SUB_PROCESSJournal_Subprocess)',NULL,NULL,NULL,'arun','2017-08-14 12:20:36','2017-08-14 12:20:00','2017-08-14 12:20:36',1072,'completed',50,'2017-08-14 12:20:00',NULL,NULL,''),('250100','JOURNAL___user:1:250061','APPROVE_REJECT_DOC_USER_TASK_2DYNAMIC_SUB_PROCESSJournal_Subprocess','250062','250065','Approval (2 / 2 /DYNAMIC_SUB_PROCESSJournal_Subprocess)',NULL,NULL,NULL,'gaurav','2017-08-14 12:22:28','2017-08-14 12:20:36','2017-08-14 12:22:27',827,'completed',50,'2017-08-14 12:20:36',NULL,NULL,''),('250111','JOURNAL___user:1:250061','COLLABORATE_DOC_USER_TASK_1','250062','250065','Collaboration (1 / 1)',NULL,NULL,NULL,'arun','2017-08-14 12:29:23','2017-08-14 12:22:27','2017-08-14 12:29:23',732,'completed',50,'2017-08-14 12:22:27',NULL,NULL,''),('250119','JOURNAL___user:1:250061','TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_3','250062','250065','Publish_Document(3 / 2 / DYNAMIC_SUB_PROCESSJournal_Subprocess )',NULL,NULL,NULL,NULL,'2017-08-14 12:29:23','2017-08-14 12:29:23','2017-08-14 12:29:23',NULL,NULL,50,'2017-08-14 12:29:23',NULL,NULL,'');
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
INSERT INTO `act_re_deployment` VALUES ('250058','Dynamic process deployment',NULL,'','2017-08-14 12:18:33');
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
INSERT INTO `act_re_procdef` VALUES ('JOURNAL___user:1:250061',1,'com.da',NULL,'JOURNAL___user',1,'250058','JOURNAL___userdynamic-model.bpmn','JOURNAL___userdynamic-model.JOURNAL___user.png',NULL,'\0','',1,'');
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
INSERT INTO `act_ru_execution` VALUES ('250062',1,'250062','3',NULL,'JOURNAL___user:1:250061',NULL,NULL,'\0','\0','','\0',1,0,'',NULL,'2017-08-14 12:19:48'),('250065',7,'250062',NULL,'250062','JOURNAL___user:1:250061',NULL,'TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_3','','\0','','\0',1,2,'',NULL,'2017-08-14 12:29:23');
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
INSERT INTO `act_ru_identitylink` VALUES ('250063',1,NULL,'starter','santosh',NULL,'250062',NULL),('250070',1,NULL,'participant','System',NULL,'250062',NULL),('250092',1,NULL,'participant','arun',NULL,'250062',NULL),('250103',1,NULL,'participant','gaurav',NULL,'250062',NULL),('250120',1,NULL,'candidate','System','250119',NULL,NULL);
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
INSERT INTO `act_ru_task` VALUES ('250119',1,'250065','250062','JOURNAL___user:1:250061','Publish_Document(3 / 2 / DYNAMIC_SUB_PROCESSJournal_Subprocess )',NULL,NULL,'TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_3',NULL,NULL,NULL,50,'2017-08-14 12:29:23','2017-08-14 12:29:23',NULL,1,'',NULL);
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
INSERT INTO `act_ru_variable` VALUES ('250074',1,'integer','processUserFormId','250062','250062',NULL,NULL,NULL,1,'1',NULL),('250076',1,'boolean','approved','250062','250062',NULL,NULL,NULL,1,NULL,NULL),('250078',1,'string','workFlowId','250062','250062',NULL,NULL,NULL,NULL,'3',NULL),('250080',1,'string','docType','250062','250062',NULL,NULL,NULL,NULL,'JOURNAL',NULL),('250082',1,'string','initiator','250062','250062',NULL,NULL,NULL,NULL,'santosh',NULL),('250084',1,'string','businessKey','250062','250062',NULL,NULL,NULL,NULL,'3',NULL),('250086',1,'string','docAuthor','250062','250062',NULL,NULL,NULL,NULL,'santosh',NULL);
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
INSERT INTO `alert` VALUES ('11815e83-6253-4ed6-9ae5-1a32a80883ea','arun','JOURNAL entitled \'null\' has been collaborated on. ',1,'santosh','2017-08-14 12:29:23',0),('22732c71-562e-4a80-b484-1f7ead05592d','santosh','JOURNAL entitled \'WAITING_FOR_DOCUMENT_TO_SUBMIT\' has been JOURNAL Document on.',1,'santosh','2017-08-14 12:30:22',1),('61c76b83-fb48-4534-9ecf-3bade97572f1','arun','JOURNAL entitled \'3\'  has been approved. ',1,'santosh','2017-08-14 12:20:36',0),('990c962e-89d6-4a97-b31d-866e6a22d4bb','gaurav','JOURNAL entitled \'3\'  has been approved. ',1,'santosh','2017-08-14 12:22:27',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process`
--

LOCK TABLES `process` WRITE;
/*!40000 ALTER TABLE `process` DISABLE KEYS */;
INSERT INTO `process` VALUES (4,'Journal','TestDesc','userCT1','Form Sumission','1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'JOURNAL','user','CT,FC'),(5,'Journal_Subprocess','test Desc','userFC1',NULL,'1',NULL,'4',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_department_mapping`
--

LOCK TABLES `process_department_mapping` WRITE;
/*!40000 ALTER TABLE `process_department_mapping` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `userform_name_UNIQUE` (`userform_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_userfom`
--

LOCK TABLES `process_userfom` WRITE;
/*!40000 ALTER TABLE `process_userfom` DISABLE KEYS */;
INSERT INTO `process_userfom` VALUES (1,0,'user','SYSTEM_USER','JOURNAL','userCT1','[{\"name\":\"date-1501004302939\",\"label\":\"Posting Date\",\"required\":\"true\",\"type\":\"date\",\"value\":null,\"subtype\":null,\"fieldId\":null,\"userFromId\":null,\"jsonData\":\"null\",\"values\":null,\"class\":null},{\"name\":\"text-1501004346172\",\"label\":\"period\",\"required\":\"true\",\"type\":\"text\",\"value\":null,\"subtype\":\"text\",\"fieldId\":null,\"userFromId\":null,\"jsonData\":\"null\",\"values\":null,\"class\":null},{\"name\":\"select-1501004387965\",\"label\":\"Doc Type\",\"required\":\"true\",\"type\":\"select\",\"value\":null,\"subtype\":null,\"fieldId\":null,\"userFromId\":null,\"jsonData\":\"[{\\\"value\\\":\\\"SA\\\",\\\"label\\\":\\\"SA - G/L Account Document\\\"},{\\\"value\\\":\\\"ZJ\\\",\\\"label\\\":\\\"ZJ - Non-Cost Transfer\\\"},{\\\"value\\\":\\\"ZK\\\",\\\"label\\\":\\\"ZK - Cost Transfer\\\"},{\\\"value\\\":\\\"ZV\\\",\\\"label\\\":\\\"ZV - Cost Transfer Over 90 Days\\\"}]\",\"values\":[{\"value\":\"SA\",\"label\":\"SA - G/L Account Document\"},{\"value\":\"ZJ\",\"label\":\"ZJ - Non-Cost Transfer\"},{\"value\":\"ZK\",\"label\":\"ZK - Cost Transfer\"},{\"value\":\"ZV\",\"label\":\"ZV - Cost Transfer Over 90 Days\"}],\"class\":null},{\"name\":\"select-1501004741318\",\"label\":\"Referances\",\"required\":\"true\",\"type\":\"select\",\"value\":null,\"subtype\":null,\"fieldId\":null,\"userFromId\":null,\"jsonData\":\"[{\\\"value\\\":\\\"Select\\\",\\\"label\\\":\\\"Select\\\"},{\\\"value\\\":\\\"G/L Adjustment\\\",\\\"label\\\":\\\"G/L Adjustment\\\"}]\",\"values\":[{\"value\":\"Select\",\"label\":\"Select\"},{\"value\":\"G/L Adjustment\",\"label\":\"G/L Adjustment\"}],\"class\":null},{\"name\":\"text-1501004836404\",\"label\":\"Company Code\",\"required\":\"true\",\"type\":\"text\",\"value\":null,\"subtype\":\"text\",\"fieldId\":null,\"userFromId\":null,\"jsonData\":\"null\",\"values\":null,\"class\":null},{\"name\":\"text-1501004838844\",\"label\":\"Document Header\",\"required\":\"true\",\"type\":\"text\",\"value\":null,\"subtype\":\"text\",\"fieldId\":null,\"userFromId\":null,\"jsonData\":\"null\",\"values\":null,\"class\":null},{\"name\":\"text-1501004895256\",\"label\":\"Debit Amount\",\"required\":\"true\",\"type\":\"text\",\"value\":null,\"subtype\":\"text\",\"fieldId\":null,\"userFromId\":null,\"jsonData\":\"null\",\"values\":null,\"class\":null},{\"name\":\"text-1501004896976\",\"label\":\"Credit Amount\",\"required\":\"true\",\"type\":\"text\",\"value\":null,\"subtype\":\"text\",\"fieldId\":null,\"userFromId\":null,\"jsonData\":\"null\",\"values\":null,\"class\":null},{\"name\":\"text-1501004945288\",\"label\":\"Author\",\"required\":\"true\",\"type\":\"text\",\"value\":null,\"subtype\":\"text\",\"fieldId\":null,\"userFromId\":null,\"jsonData\":\"null\",\"values\":null,\"class\":null},{\"name\":\"file-1501004973224\",\"label\":\"Upload Evidence\",\"required\":\"true\",\"type\":\"file\",\"value\":null,\"subtype\":\"file\",\"fieldId\":null,\"userFromId\":null,\"jsonData\":\"null\",\"values\":null,\"class\":null}]','Journal');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (13,'Submit_Document','test desc','userFC1','USERTASK',NULL,NULL,'CONFIGURED',NULL,NULL,NULL,NULL,NULL,5,'System'),(14,'Approver_1','test desc','userFC1','APPROVE_REJECT',NULL,NULL,'CONFIGURED',NULL,NULL,NULL,NULL,NULL,5,'arun'),(15,'Approver_2','test desc','userFC1','APPROVE_REJECT',NULL,NULL,'CONFIGURED',NULL,NULL,NULL,NULL,NULL,5,'gaurav'),(16,'Collabration_Task','test desc','userFC1','COLLABORATION',NULL,NULL,'CONFIGURED',NULL,NULL,NULL,NULL,NULL,5,'arun'),(17,'Publish_Document','test desc','userFC1','SYSTEMTASK',NULL,NULL,'CONFIGURED',NULL,NULL,NULL,NULL,NULL,5,'System');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_from_mapping`
--

LOCK TABLES `user_from_mapping` WRITE;
/*!40000 ALTER TABLE `user_from_mapping` DISABLE KEYS */;
INSERT INTO `user_from_mapping` VALUES (1,'date-1501004302939','date',NULL,'true','Posting Date',NULL,1,'null'),(2,'text-1501004346172','text','text','true','period',NULL,1,'null'),(3,'select-1501004387965','select',NULL,'true','Doc Type',NULL,1,'[{\"value\":\"SA\",\"label\":\"SA - G/L Account Document\"},{\"value\":\"ZJ\",\"label\":\"ZJ - Non-Cost Transfer\"},{\"value\":\"ZK\",\"label\":\"ZK - Cost Transfer\"},{\"value\":\"ZV\",\"label\":\"ZV - Cost Transfer Over 90 Days\"}]'),(4,'select-1501004741318','select',NULL,'true','Referances',NULL,1,'[{\"value\":\"Select\",\"label\":\"Select\"},{\"value\":\"G/L Adjustment\",\"label\":\"G/L Adjustment\"}]'),(5,'text-1501004836404','text','text','true','Company Code',NULL,1,'null'),(6,'text-1501004838844','text','text','true','Document Header',NULL,1,'null'),(7,'text-1501004895256','text','text','true','Debit Amount',NULL,1,'null'),(8,'text-1501004896976','text','text','true','Credit Amount',NULL,1,'null'),(9,'text-1501004945288','text','text','true','Author',NULL,1,'null'),(10,'file-1501004973224','file','file','true','Upload Evidence',NULL,1,'null');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow`
--

LOCK TABLES `workflow` WRITE;
/*!40000 ALTER TABLE `workflow` DISABLE KEYS */;
INSERT INTO `workflow` VALUES (3,'JOURNAL',1,'santosh','COLLABORATED','user');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_mapping`
--

LOCK TABLES `workflow_mapping` WRITE;
/*!40000 ALTER TABLE `workflow_mapping` DISABLE KEYS */;
INSERT INTO `workflow_mapping` VALUES (17,'text-1501004896976','13000',3),(18,'date-1501004302939','2017-08-16',3),(19,'text-1501004838844','headr',3),(20,'text-1501004836404','test',3),(21,'text-1501004346172','1200',3),(22,'text-1501004945288','santosh',3),(23,'isSubmit','on',3),(24,'text-1501004895256','120000',3);
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

-- Dump completed on 2017-08-14 19:40:37
