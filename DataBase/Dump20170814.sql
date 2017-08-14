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
INSERT INTO `act_ge_bytearray` VALUES ('250059',1,'JOURNAL___userdynamic-model.bpmn','250058','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"com.da\">\n  <process id=\"JOURNAL___user\" isExecutable=\"true\">\n    <startEvent id=\"start\"></startEvent>\n    <subProcess id=\"DYNAMIC_SUB_PROCESSJournal_Subprocess\" name=\"Dynamic Document SubprocessJournal_Subprocess\">\n      <startEvent id=\"dynamic_sub_process_start_eventJournal_Subprocess\" name=\"Start Dynamic SubProcessJournal_Subprocess\"></startEvent>\n      <endEvent id=\"dynamic_sub_process_end_eventJournal_Subprocess\" name=\"End Dynamic SubProcessJournal_Subprocess\"></endEvent>\n      <endEvent id=\"rejectedErrorEndEventJournal_Subprocess\" name=\"ErrorEndJournal_Subprocess\">\n        <errorEventDefinition errorRef=\"ERROR_DOC_REJECTEDJournal_Subprocess\"></errorEventDefinition>\n      </endEvent>\n      <sequenceFlow id=\"sequenceFlow-d13a3e9f-7179-4e13-823a-2a8043b112af\" sourceRef=\"dynamic_sub_process_start_eventJournal_Subprocess\" targetRef=\"TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_2\"></sequenceFlow>\n      <userTask id=\"TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_2\" name=\"Submit_Document(2 / 2 / DYNAMIC_SUB_PROCESSJournal_Subprocess )\" activiti:candidateUsers=\"System\">\n        <extensionElements>\n          <activiti:taskListener event=\"create\" expression=\"${docWorkflowListener.onCreateGenricTask(execution, task)}\"></activiti:taskListener>\n          <activiti:taskListener event=\"complete\" expression=\"${docWorkflowListener.onCompleteGenricTask(execution, task)}\"></activiti:taskListener>\n        </extensionElements>\n      </userTask>\n      <sequenceFlow id=\"dynamic_collab_subflow_2_2_DYNAMIC_SUB_PROCESSJournal_Subprocess\" name=\"Collaboration SubFlow 2 of 2 of DYNAMIC_SUB_PROCESSJournal_Subprocess\" sourceRef=\"TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_2\" targetRef=\"APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESSJournal_Subprocess\"></sequenceFlow>\n      <exclusiveGateway id=\"exclusivegateway_approval_1_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\" name=\"Exclusive Approval Gateway 1 of 2 of DYNAMIC_SUB_PROCESSJournal_Subprocess\"></exclusiveGateway>\n      <sequenceFlow id=\"sequenceFlow-4125be13-1b63-4610-ae1e-33014b595ff2\" sourceRef=\"APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESSJournal_Subprocess\" targetRef=\"exclusivegateway_approval_1_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\"></sequenceFlow>\n      <sequenceFlow id=\"docRejectedSubFlow_1_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\" name=\"Doc Rejected 1 of 2 of DYNAMIC_SUB_PROCESSJournal_Subprocess\" sourceRef=\"exclusivegateway_approval_1_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\" targetRef=\"rejectedErrorEndEventJournal_Subprocess\">\n        <extensionElements>\n          <activiti:executionListener event=\"take\" expression=\"${docWorkflowListener.onRejected(execution)}\"></activiti:executionListener>\n        </extensionElements>\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${approved == false}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"docApprovedSubFlow_1_of_2_DYNAMIC_SUB_PROCESSJournal_Subprocess\" name=\"Doc Approved 1 of 2 of DYNAMIC_SUB_PROCESSJournal_Subprocess\" sourceRef=\"exclusivegateway_approval_1_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\" targetRef=\"APPROVE_REJECT_DOC_USER_TASK_2DYNAMIC_SUB_PROCESSJournal_Subprocess\">\n        <extensionElements>\n          <activiti:executionListener event=\"take\" expression=\"${docWorkflowListener.onApproved(execution)}\"></activiti:executionListener>\n        </extensionElements>\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${approved == true}]]></conditionExpression>\n      </sequenceFlow>\n      <userTask id=\"APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESSJournal_Subprocess\" name=\"Approval (1 / 2 /DYNAMIC_SUB_PROCESSJournal_Subprocess)\" activiti:candidateUsers=\"arun\" activiti:candidateGroups=\"Approver\">\n        <extensionElements>\n          <activiti:taskListener event=\"create\" expression=\"${docWorkflowListener.onCreateApproval(execution, task)}\"></activiti:taskListener>\n        </extensionElements>\n      </userTask>\n      <exclusiveGateway id=\"exclusivegateway_approval_2_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\" name=\"Exclusive Approval Gateway 2 of 2 of DYNAMIC_SUB_PROCESSJournal_Subprocess\"></exclusiveGateway>\n      <sequenceFlow id=\"sequenceFlow-9d7a3173-ad9f-4e31-91c3-4da5ed92b6f7\" sourceRef=\"APPROVE_REJECT_DOC_USER_TASK_2DYNAMIC_SUB_PROCESSJournal_Subprocess\" targetRef=\"exclusivegateway_approval_2_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\"></sequenceFlow>\n      <sequenceFlow id=\"docRejectedSubFlow_2_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\" name=\"Doc Rejected 2 of 2 of DYNAMIC_SUB_PROCESSJournal_Subprocess\" sourceRef=\"exclusivegateway_approval_2_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\" targetRef=\"rejectedErrorEndEventJournal_Subprocess\">\n        <extensionElements>\n          <activiti:executionListener event=\"take\" expression=\"${docWorkflowListener.onRejected(execution)}\"></activiti:executionListener>\n        </extensionElements>\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${approved == false}]]></conditionExpression>\n      </sequenceFlow>\n      <sequenceFlow id=\"docApprovedSubFlow_2_of_2_DYNAMIC_SUB_PROCESSJournal_Subprocess\" name=\"Doc Approved 2 of 2 of DYNAMIC_SUB_PROCESSJournal_Subprocess\" sourceRef=\"exclusivegateway_approval_2_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\" targetRef=\"COLLABORATE_DOC_USER_TASK_1\">\n        <extensionElements>\n          <activiti:executionListener event=\"take\" expression=\"${docWorkflowListener.onApproved(execution)}\"></activiti:executionListener>\n        </extensionElements>\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${approved == true}]]></conditionExpression>\n      </sequenceFlow>\n      <userTask id=\"APPROVE_REJECT_DOC_USER_TASK_2DYNAMIC_SUB_PROCESSJournal_Subprocess\" name=\"Approval (2 / 2 /DYNAMIC_SUB_PROCESSJournal_Subprocess)\" activiti:candidateUsers=\"gaurav\" activiti:candidateGroups=\"Approver\">\n        <extensionElements>\n          <activiti:taskListener event=\"create\" expression=\"${docWorkflowListener.onCreateApproval(execution, task)}\"></activiti:taskListener>\n        </extensionElements>\n      </userTask>\n      <userTask id=\"COLLABORATE_DOC_USER_TASK_1\" name=\"Collaboration (1 / 1)\" activiti:candidateUsers=\"arun\" activiti:candidateGroups=\"Approver\">\n        <extensionElements>\n          <activiti:taskListener event=\"create\" expression=\"${docWorkflowListener.onCreateCollaborate(execution, task)}\"></activiti:taskListener>\n          <activiti:taskListener event=\"complete\" expression=\"${docWorkflowListener.onCompleteCollaborate(execution, task)}\"></activiti:taskListener>\n        </extensionElements>\n      </userTask>\n      <sequenceFlow id=\"dynamic_collab_subflow_1_1\" name=\"Collaboration SubFlow 1 of 1\" sourceRef=\"COLLABORATE_DOC_USER_TASK_1\" targetRef=\"TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_3\"></sequenceFlow>\n      <userTask id=\"TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_3\" name=\"Publish_Document(3 / 2 / DYNAMIC_SUB_PROCESSJournal_Subprocess )\" activiti:candidateUsers=\"System\">\n        <extensionElements>\n          <activiti:taskListener event=\"create\" expression=\"${docWorkflowListener.onCreateGenricTask(execution, task)}\"></activiti:taskListener>\n          <activiti:taskListener event=\"complete\" expression=\"${docWorkflowListener.onCompleteGenricTask(execution, task)}\"></activiti:taskListener>\n        </extensionElements>\n      </userTask>\n      <sequenceFlow id=\"dynamic_collab_subflow_3_2_DYNAMIC_SUB_PROCESSJournal_Subprocess\" name=\"Collaboration SubFlow 3 of 2 of DYNAMIC_SUB_PROCESSJournal_Subprocess\" sourceRef=\"TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_3\" targetRef=\"dynamic_sub_process_end_eventJournal_Subprocess\"></sequenceFlow>\n    </subProcess>\n    <sequenceFlow id=\"sequenceFlow-8a9e3d1e-f1e4-4e08-84ed-5ecbc85e41ab\" sourceRef=\"start\" targetRef=\"DYNAMIC_SUB_PROCESSJournal_Subprocess\"></sequenceFlow>\n    <boundaryEvent id=\"REJECTED_ERROR_BOUNDARY_EVENT\" name=\"Rejected Error Event\" attachedToRef=\"DYNAMIC_SUB_PROCESSJournal_Subprocess\">\n      <errorEventDefinition errorRef=\"ERROR_DOC_REJECTEDJournal_Subprocess\"></errorEventDefinition>\n    </boundaryEvent>\n    <sequenceFlow id=\"sequenceFlow-959f383a-819b-4cb5-8a67-83a54119b006\" name=\"Rejected\" sourceRef=\"REJECTED_ERROR_BOUNDARY_EVENT\" targetRef=\"start\"></sequenceFlow>\n    <endEvent id=\"end\"></endEvent>\n    <sequenceFlow id=\"sequenceFlow-432c1210-ba11-4690-b25e-91ccbab11285\" sourceRef=\"DYNAMIC_SUB_PROCESSJournal_Subprocess\" targetRef=\"end\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_JOURNAL___user\">\n    <bpmndi:BPMNPlane bpmnElement=\"JOURNAL___user\" id=\"BPMNPlane_JOURNAL___user\">\n      <bpmndi:BPMNShape bpmnElement=\"APPROVE_REJECT_DOC_USER_TASK_2DYNAMIC_SUB_PROCESSJournal_Subprocess\" id=\"BPMNShape_APPROVE_REJECT_DOC_USER_TASK_2DYNAMIC_SUB_PROCESSJournal_Subprocess\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"570.0\" y=\"135.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway_approval_1_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\" id=\"BPMNShape_exclusivegateway_approval_1_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"480.0\" y=\"83.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"COLLABORATE_DOC_USER_TASK_1\" id=\"BPMNShape_COLLABORATE_DOC_USER_TASK_1\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"810.0\" y=\"150.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"rejectedErrorEndEventJournal_Subprocess\" id=\"BPMNShape_rejectedErrorEndEventJournal_Subprocess\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"845.0\" y=\"20.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_3\" id=\"BPMNShape_TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_3\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"960.0\" y=\"147.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"dynamic_sub_process_start_eventJournal_Subprocess\" id=\"BPMNShape_dynamic_sub_process_start_eventJournal_Subprocess\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"100.0\" y=\"94.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESSJournal_Subprocess\" id=\"BPMNShape_APPROVE_REJECT_DOC_USER_TASK_1DYNAMIC_SUB_PROCESSJournal_Subprocess\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"330.0\" y=\"77.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"dynamic_sub_process_end_eventJournal_Subprocess\" id=\"BPMNShape_dynamic_sub_process_end_eventJournal_Subprocess\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"1110.0\" y=\"162.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_2\" id=\"BPMNShape_TASK_ID_DOC_GENRIC_TASKDYNAMIC_SUB_PROCESSJournal_Subprocess_2\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"180.0\" y=\"79.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway_approval_2_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\" id=\"BPMNShape_exclusivegateway_approval_2_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"720.0\" y=\"135.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"0.0\" y=\"100.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"1210.0\" y=\"100.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"DYNAMIC_SUB_PROCESSJournal_Subprocess\" id=\"BPMNShape_DYNAMIC_SUB_PROCESSJournal_Subprocess\" isExpanded=\"true\">\n        <omgdc:Bounds height=\"230.0\" width=\"1080.0\" x=\"80.0\" y=\"0.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"REJECTED_ERROR_BOUNDARY_EVENT\" id=\"BPMNShape_REJECTED_ERROR_BOUNDARY_EVENT\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"929.0\" y=\"215.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"dynamic_collab_subflow_1_1\" id=\"BPMNEdge_dynamic_collab_subflow_1_1\">\n        <omgdi:waypoint x=\"910.0\" y=\"180.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"922.0\" y=\"180.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"922.0\" y=\"177.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"960.0\" y=\"177.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"docRejectedSubFlow_1_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\" id=\"BPMNEdge_docRejectedSubFlow_1_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\">\n        <omgdi:waypoint x=\"520.0\" y=\"95.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"532.0\" y=\"95.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"532.0\" y=\"35.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"845.0\" y=\"35.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"docApprovedSubFlow_1_of_2_DYNAMIC_SUB_PROCESSJournal_Subprocess\" id=\"BPMNEdge_docApprovedSubFlow_1_of_2_DYNAMIC_SUB_PROCESSJournal_Subprocess\">\n        <omgdi:waypoint x=\"520.0\" y=\"110.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"532.0\" y=\"110.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"532.0\" y=\"165.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"570.0\" y=\"165.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"dynamic_collab_subflow_2_2_DYNAMIC_SUB_PROCESSJournal_Subprocess\" id=\"BPMNEdge_dynamic_collab_subflow_2_2_DYNAMIC_SUB_PROCESSJournal_Subprocess\">\n        <omgdi:waypoint x=\"280.0\" y=\"109.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"292.0\" y=\"109.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"292.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"330.0\" y=\"107.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-9d7a3173-ad9f-4e31-91c3-4da5ed92b6f7\" id=\"BPMNEdge_sequenceFlow-9d7a3173-ad9f-4e31-91c3-4da5ed92b6f7\">\n        <omgdi:waypoint x=\"670.0\" y=\"165.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"682.0\" y=\"165.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"682.0\" y=\"155.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"720.0\" y=\"155.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"dynamic_collab_subflow_3_2_DYNAMIC_SUB_PROCESSJournal_Subprocess\" id=\"BPMNEdge_dynamic_collab_subflow_3_2_DYNAMIC_SUB_PROCESSJournal_Subprocess\">\n        <omgdi:waypoint x=\"1060.0\" y=\"177.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1110.0\" y=\"177.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"docRejectedSubFlow_2_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\" id=\"BPMNEdge_docRejectedSubFlow_2_of_2_of_DYNAMIC_SUB_PROCESSJournal_Subprocess\">\n        <omgdi:waypoint x=\"760.0\" y=\"147.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"772.0\" y=\"147.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"772.0\" y=\"35.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"845.0\" y=\"35.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-4125be13-1b63-4610-ae1e-33014b595ff2\" id=\"BPMNEdge_sequenceFlow-4125be13-1b63-4610-ae1e-33014b595ff2\">\n        <omgdi:waypoint x=\"430.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"442.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"442.0\" y=\"103.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"480.0\" y=\"103.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-d13a3e9f-7179-4e13-823a-2a8043b112af\" id=\"BPMNEdge_sequenceFlow-d13a3e9f-7179-4e13-823a-2a8043b112af\">\n        <omgdi:waypoint x=\"130.0\" y=\"109.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"180.0\" y=\"109.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"docApprovedSubFlow_2_of_2_DYNAMIC_SUB_PROCESSJournal_Subprocess\" id=\"BPMNEdge_docApprovedSubFlow_2_of_2_DYNAMIC_SUB_PROCESSJournal_Subprocess\">\n        <omgdi:waypoint x=\"760.0\" y=\"162.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"772.0\" y=\"162.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"772.0\" y=\"180.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"810.0\" y=\"180.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-8a9e3d1e-f1e4-4e08-84ed-5ecbc85e41ab\" id=\"BPMNEdge_sequenceFlow-8a9e3d1e-f1e4-4e08-84ed-5ecbc85e41ab\">\n        <omgdi:waypoint x=\"30.0\" y=\"115.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"42.0\" y=\"115.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"42.0\" y=\"115.00000000000007\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"80.0\" y=\"115.00000000000007\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-959f383a-819b-4cb5-8a67-83a54119b006\" id=\"BPMNEdge_sequenceFlow-959f383a-819b-4cb5-8a67-83a54119b006\">\n        <omgdi:waypoint x=\"944.0\" y=\"245.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"944.0\" y=\"255.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"15.0\" y=\"255.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"15.0\" y=\"172.5\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"15.0\" y=\"130.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sequenceFlow-432c1210-ba11-4690-b25e-91ccbab11285\" id=\"BPMNEdge_sequenceFlow-432c1210-ba11-4690-b25e-91ccbab11285\">\n        <omgdi:waypoint x=\"1160.0\" y=\"115.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"1210.0\" y=\"115.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>','\0'),('250060',1,'JOURNAL___userdynamic-model.JOURNAL___user.png','250058','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\‚\0\0	\0\0\09=à†\0\0H®IDATx\⁄\Ì\›	pTeæ˜q\∆e\‘r,_´Ù:S◊π3Œµ\∆\Îı\¬\\≠\◊\—ÚZN\›k°5\◊Òe2ùçCÇò((»ñ∞∏\0„ÑÅ∞π∞âADå@XBBb√æ\n&aMbÜâÅ¿ÛˆˇÅ\”s∫\”\À\ÈN˜\È%\ﬂO\’St˜9Ω?\'\…˘ÒûßKtÿ¶Mõ˛oø~˝\Í~Òã_\\p^U4\ZçF£\—h4\ZçF£\—h±\ﬁ\Ó∏„é≥w\ﬂ}˜l\Á\Âê\Ó nB8ß∂ßûzJmﬁºYµ∂∂*\0\0\0\0\0ÄXv\·\¬µ{˜nı\Ï≥\œ^∫È¶õj	\„˙˜\Ô@B8\0\0\0\0\0ÄxÙõ\ﬂ¸\Êdó.]^\'\ÂAÃì\·®R	\0\0\0\0\0èˆ\Ó\›˚˜.]∫‘ëÚ 0\0\0\0\0\0\ƒ-¶ze\ﬁ8 ˆÉ8\0\0\0\0\0ÄxFÇ8\0\0\0\0\0\0\ƒ!°Ç∏.¶\ÂÅo∫\È&ı\¬/\Ë\“\œ8»Ç\ﬁ?ñ\ﬁCGlÿ∞A=ˆ\ÿc^∑mﬂæ]=˙\Ë£\Í∫\ÎÆS7\‹pÉ˙ıØ≠6m\⁄ˆ\œ4N0\«\Õk\·{\0\0\0Ä†Œ±Ä\ƒ\n\‚ƒî)SÙ\Â!CÜ\ƒmØ\Ô¡j\ÿÚÛüˇ\\o€∑oü^\ŒY.ˇÀø¸Kßp\‚-à\„{\0\0\0Ä†Œ±Ä\ƒ\‚Œù;\Á\n§B\«\nÑ¸+\◊z\Ë!\◊}$\Ï∫Ò\∆\’?˝\”?©Y≥f\È˝§ö\Î\ﬂ˛\Ì\ﬂ‘µ\◊^´~¯\√™˘Û\Áª=\œ˛\Á\ÍmRπ6f\Ãı\Ï≥\œ\Í™ \Ÿw\·¬Ö\Ì^”â\'\‘\„è?Æ\ÔÛã_¸BmŸ≤\≈Ú{---\Í˘\Áü\◊UGÚ<˝˚˜w-b\·\Î±=\√Ûı`\ﬁ\«\È”ßUFFÜ´\Í©gœû™©©\…\Ìq<?C\Ÿ\◊\\\·\ÁIGn?p\‡@¿ê\∆\€\Î\Œ\Œ\Œ÷è—Ω{w\◊c\€233ı∂ˇ¯èˇh∑M*Ù~ı´_Ö¸ô˙˚,ñ/_Æ˛˝\ﬂˇ]\ﬂG∂\…s9r$\‡6_\Ô\›\ﬂ\Î≥Úô\ﬂkG˙∫?|èﬁøG\0\0\0\0 àCß	\‚å\Îr≤ºh\—\"}y‘®Q˙ˆ#F\Ë\ÎB˜)))Q_|ÒÖæ|\À-∑\Ë˝$òêawççç˙ˆõoæ\Ÿ\Ìyñ-[¶é;Ê∫æt\ÈRU__\Ôˆ\Ê\◊‘£G}YÇ\0˘W\¬´\ÔAH\– \◊\Â˝\»s\…e	¸=∂ï \ƒ\ ˚ê@DÆK\≈\”ﬁΩ{ı\Â\'ü|\“\Ìqº}Ü˛Çú7\ﬂ|SoìPh¿ÄÆ†\‘\Í\Îñ@Dö\ xæ\'c\€O<·∂≠≤≤R}˝ı\◊!¶˛>\È#r]>O\È;r\Ÿã¸mÛ\’¸Ω>+üë˘Ωv§Ø˚\√˜\Ë˝{\0\0\0\0Ç8t\  \Ó\‚≈ã\Íé;\ÓP?˝\ÈOı\Ì?˚\Ÿ\œt\0aTúy\ﬁ\ÁÍ´Ø÷ó\ÂD{ÿ∞a˙$\€[ÄL\ÿ å\n±PﬁÉ˘˛Ú~§\…eπ\Õ\ﬂc[}mÅÆ{V∑ôü\€\ﬂg(»ëπ\ƒ$ëGˆìP\«\Í\Îˆˆ9X\›f\Â3ı˜Y’óÚùI\04s\ÊL]yhõØ\Ô\Ã\ﬂ\Î≥˙˘˚~É\Ì\Î|è÷øG\0\0\0\0 àCßö*ï>BÜ\\\ ı\¬\¬B˝\Ô†AÉ2åM.Ø\\π2*Aú\Á{0Ü\0ö\√	>\Ï\‚\Ã\·G(\œ\·ãQâl\»d|Ú\ŸX\›f\ g\ÍÔ≥ê\€***Ù\"2§Xˆì9\‘mÛ¸<ç\’\ﬂ\ÎˆsG_\Á{¥˛=\0\0\0\0A:Mg;5Ü£\ \‹On\√\ dhû\’…òÄæ£Aú1DN™á¨Mı|\∆P:Û;\n\Ë\Ô±e0\„˝ÆZµ*\‰˜ëöö\Í\Z\Œk|≤Rf†˚R2_óg\‡aÑ?2ºo\ÁŒùnÅÜï\◊-Û\◊¡ëºÛ∂∏∂=˝Ù\”>úP>SüÖ1\Ô†ÉîaìrY™1mì\nMπ.sçÛˆz}¡|∑\·\Í\Î\ﬁ=˛c\0\0\0\0ƒ°\”q\“d\·£\Í\Õ ≥\À6ô∏\›J8!C\Œ$†\»\ \ \nK\'\√ˇ\‰$^Aô\Ï]Çã`ﬁÉLH/\€\Àkí&AÉ1!ΩØ«ñI˜%|îä!y¨P\ﬂ\«7\ﬂ|\„ö8_û[\Ê“íI\›oﬁºy:dí!ê\∆\¬ôóKÇy<\Ÿ.C˛åâÙ≠ºnôLﬁØ+2ßùyõ\Ã&è)C-\Â≥Ò\‡ÑÚô˙˚,\‰_Y\ÏB∂\…˝\‰˘e!Ñ@€ñ,Y¢´´\‰v	\·\‰≥	Ù˙Ç˘n\√\’◊Ω\·{¸\«6\0\0\0\0 àCß	\‚|ëJ,ô\√I&Ç7*Yê\–?\‘¯ ¯\0\0\0 V\œuÄ\ƒ\‚§\"G*^d∏úT\Ë qQà\‹g\Î\Ÿ¯\0\0\0¿\ZÇ8tä \0\0\0\0\0 \⁄\‚@\0\0\0\0\0`Ç8\ƒ\0\0\0à555jÙ\Ë\—*77W•••)á√°˛á?\Ë&\◊˚ı\ÎßÚÛÛUYYÄòCÇ8\0\0\0\01\ÌÃô3™∞∞P•¶¶∫B7+MÇπ)S¶®\Ê\Êf>D\01Å q\0\0\0\0b\÷G}§RRRÇ\n\‡<[rr≤Z±b&Ä®#àA\0\0\0\0\Ìh\„\ﬂU\ﬁ\‰un-Zè+Upyyy*99E˝Ò\œ+]°ZFFÜ***R\Âï\’j\ƒ[ïz?\—\⁄⁄™ööö‘é;\‘Ù\È\”Ufffª@n¿ÄÆ˝C5xjπ\⁄¯\ÎÄ˚}ÚŸó\Í≈¢\n˝^9\ÔS≤\·\0\0A\‚\0\0\0\0\\6\’^5a¡¶®?\Óπs\ÁT\ÔﬁΩux÷´\ÔK™o¡,’∑o_UZZ™Œü?Ø˜\Ÿ}§ö≥bè\œ\«hkkSk÷¨\—˜3áq2á\\®CU/^ºh9úÃõ≤N\Ì®˚J_ﬁºØQΩ<}=\0A\‚\0\0\0\0\\6Ú\›\œ‘™çá\⁄\›\ﬁ\‹“™^ò\\Æ\∆/¯´\Z2£\¬tyΩ\Z7∑FáS/LYßñV’∂\€®s_è˚Qeùz±®\\\rözπrl^\È]±ñô\›_ı\Ì5\œ+Tü°QØ\ŒX÷Æím’¶Cj\›\÷\√\ÍªÛm\Í˝’ü´¡\Œ\«˘\Œgj˚ï\ÎÎøùUØΩ∑QW\ \ÕY™rF\Ã\–Aú#%\Õ˘∏•\Íç˘uuõ\ÁÛ¶.\›\Ó™\ﬁ˚SÒf}€∂/æræüJKü•ºû\Ÿ+vª\›ˆ\Â\—oÙs\Ô]>;\0q\0A\0\0\0\–\…\’^ﬁÜêÆ¯\Î!ı“¥\n=$\”|Y™\‹f-ﬂ≠\Ô˚\◊\œO\Ë\Õsè;˝\„zø\∆o\Œ\Ë«ë¿KÜ£ˆ9Sı0RgØøªZm´˝™\›\Îù\Ì\‹ˇÛC_´%\Îk\’˙G’•Kó\‘\·\∆\”j\ƒ€ü\È\Ì[øh\‘ùê¿nZqôûkÆWø!™ˇ\Îã‘ÄA√Ω>øYK\Î9µvsΩ\Îıû\…p‹ÇYt\ÿWΩ˚òæ\Ì√ä/\\˜˚ìù™\Ë£\Ìt<Ä  à\0\0\0:õ≤≠G‘®w´Ωnõ∂tá´∫\À|Y™\÷sÙ\Â\”g\Œ\È·òû˚¯{\\	•$ú\Íç{ôr8ÍèìV;ˇMV%%%j^\È^u‰´ø∑ªØnmmuêv¡˘Øê\Í8c®á›≤øQ_û[∫Gáy2T5kï˘\¬XÚ\rù≤\“\Ì˘%h3\Ó+°\‚ãS\ uêˆ˙¸ç˙ˆâ\Œ}\ﬁ[µ\'®œµb\€a˝8b\Ïú\rjq˘\Â\Á=ª\⁄ı|\0\‚\0Ç8\0\0\0†ëj0_!S¡ª’Æ°•\Ê\À\ƒI%‹Ö’ªü\ÓRØΩW\”nè;¸≠*UµÛ\Ëï`≠Rı\Ó˜≤\»ñ™≥\ﬁ\◊n¥IµõTTÆ\Œ|wA<Ò75b\∆\Z}õï˝.^º§*∂Q\Àˆ\È€ãñlS_kVuGø\—AÿÅ\„ó\ÁÖ3cÖûwN\œ7væZΩÒr0&\√g%43ﬁóT\…\…<t2tUÜ§äQ¶˜\Âè\‹ﬂ∏OÂé£Æ \Ó\Ákï\ÎÚ<≤èÒ\ﬁ\ƒq\0\0\0@\'bÃìfnÉß]û\œL\Ê3*\ﬂÃóı †S\ ıæØ\Œ€®´\‚<˜Ò˜∏RAw\Ó\ ~yì\÷\Ë*8	\»˙yMΩ<ΩB\Õ\\∂SM,˛\«\"K+\ÎÙ\‹k˘\ÔV©Ù\Ï<µˇ~µÛ\À&\Áıj}{Ò\⁄}∫*NîT©É;πÕ®ûª¯U©\Á˚ıw~\„\«Oº¸ö\'ˇ\„µ\»\‹vÚ:e\Œ9Ûk|¡T\Ëè1˜ù~ØS\À]Å€§E[\\üïT‹ù≥X\0\‚\0Ç8\0\0\0\0aïöö\ÍZ\ŸTVGıß¨¨L\Ô˜\‚ã/\Í\’Q1*\Í2D\’x.ô7NVi\0;ƒÅ \0\0\0@\ƒ$\'\'´…ì\'˚›ß¶¶\∆åedd®Û\Á\œ˚›ø∞∞P\œ%\'˚Ù\—G_Cuµ˚u\ﬁı\È\”\«ıú\ÏC™\‰|-@\0˛ƒÅ \0\0\0@\ƒaórSßNı∫\œ\Ë—£]˚˘}<YÖµw\ÔﬁÆ˝•íÆ°°¡\Á˛;w\ÓTs\Ê\Ãiw˚Ãô3]èëüü\œ¿q à\0\0\01F\ÿe4©dÛ¨ê\À\Õ\Õumﬂ∏q£\ﬂ«´≠≠m˜xc«éı∫\Ô7\ﬂ|£≤≥≥Ω>\Êé;\\è—Ø_?æ(\0∂ àA\0\0\0ÄàÒ\‚\Ãr9Ø¸EÔìññ\Ê∫\›_uõ¯\√]\√RÕ≠≤≤\“m?©úìJ7\Ÿ˜Ù\È\”\Ìß©©…≠™\0\Ï@Ç8\0\0\0\0\„+à3W¥ôØü9s\∆\Ô\„ç9≤\›}\‰˙s\œ=ßZZZ\\˚-X∞@o<x∞\◊\«immu{\0∞A\‚\0\0HêìY\ZçFã˜ñí˛ú\ZÒˆgja\Ÿ>ı“¥\nUπÛ\Ë\Â\–\Ï‹ÖÀ∑Ø›´˙øV¨rF\ÃPú¥F\r¯”ß*#wò\Îæ√äV\Ë˚Ωˇiç\Á)©j\ÃÙej\‘\nïˇnµ\⁄s\Ëk\◊\œ\‘’õÍùè±Z\r|sÖ~1m\ÈΩ\Ë\¬ì\À\’“™Z~Ò\0 àA\0\0ù9à¿Òè\Ô\›k%\\r™zyXÅ\⁄Y{Tbr[\ÊG´…ã∑®o[œ´_´^ûæ^?Ühã7©µ\ÎkTˆ∞)*ÛÖqzhkzüÅ:Hì˚ˆ9Sı\Í;XïÆ©p>\ﬁ*}[ü°Q3¶.^º§ööœ®ÇYˇX=Uª\‰¥\ﬁ*5Ûy˝BB8y\ﬁ\›O\Í0\0¬ç q\0\0p\"Ä\„7¢\Ô›≥Ω8§@çz\Ár\»v˙\Ã9]›¶√¥ÇY™f«ó˙v	œÜŒ∏<\ÔõTØIu\‹\€oø≠C;Gr ïä∑4Wàßoø2d\’¯Wnìp\ÕhRg\ÿˆyΩ\ V§2ráªÊà´\ﬁ}LΩÒ˛_\’GïutZ\0AÇ8\0\08ë¿Ò\—˜nÑc£Fç\“Û∏˝©x≥\Z˘\Œgz˚§E[T\Ó∏yzüºø¨UÛ?©Ró.]R+7TW]\ƒf/ﬂ≠>?Ùµ^]u\‡üKUZ\÷\0U\\ºP\ŒS9#¶πB∑î^Y™Wø!™ˇk\Ë\ÁÀõT™+\·<\rô±^U\÷lUé\‘^˙~≤jjﬁîujˇ\·ØU\”\ﬂ\Œ\Ë\–\0\"Å q\0\0p\"Ä\„7¢ÔΩ††¿m!ÖAS+\‘‘•\€u\‡5\Ï≠JU0nºVö=|™zyÚ\n]πˆa\≈™≠\Ì¢\ﬁ_Bªc\«O\Ë\«\ \Ëˇäz°p•\ﬁgV\…6ïöûqyXk\ﬁh]Yó;~ân*A‹§w\È˚ æEK∂©cMó_√ñ˝çj\–\‰5:Ñ{n\–zu\’\≈\Â_\Ë\·®Úö¶ºÉN \"\‚@\0\0\'Ú\08~£™¶¶F\œ\Á&\’l\Í¸˘Û\ÌˆYµ\ÍÚºoΩzıR\r\r\rÆ\€gœû\›nU£mŸ≤\≈\ÎÛµµµ©>}˙∏ˆ+++\„K\0`Ç8\ƒ\0¿â<\0éﬂ®\ÀøT\œ˘&üUiiiª\Ì\'N\‘\€\ \À\À\›nóJªﬁΩ{∑\„\‰˙ô3gº>◊ö5k˛±RkJä:w\Ó_\0\0[ƒÅ \0\0N\‰p¸F›¥i\”\\\·Xﬂæ}\›B4©`ìJπ\¬\¬BØ˜˝\‰ìO⁄ÖpCÜÒ∫okk´\ \…\…q\Ì;a\¬>|\0∂!àA\0\0ú\»\‡¯ç:	ﬁ§:\Õ\»\ÊŒù\Î⁄∂w\Ô^Ω†¬∑\ﬂ~\Îıæ2îµˇ˛n´¶æ˜\ﬁ{^˜-..v=Grr≤jnn\Ê\√`Ç8\ƒ\0¿â<\0éﬂò∞b\≈\n∑\ 6π..\\®\√8™´´\›\Óªm€∂v˚¨[∑\Œ\Î\„Ä]\‚@\0\0\'Ú\08~cF^^^ª∞Ls\‰“•Kjÿ∞aÆä∏≥gœ∫mó.==\›ı∏\‡\√`;Ç8\ƒ\0¿â<\0éﬂò!\'HHf\„deTô\€-ê˝˚˜\Î˝%ê3\»˝\Ã\√Q•\…0W_9\0@$ƒÅ \0\0N\‰p¸\∆	\„rss\›\¬3Y¿AVSïÖ¸˘Ûüˇ¨\ﬁˇ}ΩüT¡ôf0B8\ÊÖ-q à\0Äy\0ø1G\¬8\œa™\“dı\‘\È”ß´Õõ7´ÜÜWeõTæ555©ää\nı\∆o\Ë\‡\ŒÛæRiG%Äh\"àA\0\0ú\»\‡¯çY2Gúy5\’Pö¨é\ \¬\0bA\‚\0\0\‡D\0\«oLì*∂\¬\¬Bïöö\ZT\0\'ﬁÑ	ä\n fƒÅ \0\0N\‰p¸∆ç\ \ J5n\‹8=á\\ZZö[&Aù\Ã7j\‘(UVV¶á∑@,!àA\0\0ú\»\‡¯\0ÿÄ q\0\0p\"Ä\„\0`Ç8\ƒ\0¿â<\0é_\0Ä\r\‚@\0\0\'Ú\08~\06 àA\0\0ú\»\‡¯\0ÿÄ q\0\0p\"Ä\„\0`Ç8\ƒ\0¿â<\0é_\0Ä\r\‚@\0\0\'Ú\08~\06 àA\0\0ú\»\‡¯\0ÿÄ q\0\0p\"Ä\„\0`Ç8\ƒ\0¿â<\0é_\0Ä\r\‚@\0\0\'Ú\08~\06 àA\0\0ú\»\‡¯\0ÿÄ q\0\0p\"Ä\„\0`Ç8\ƒ\0¿â<\0é_\0Ä\r\‚@\0\0\'Ú\08~\06 àA\0\0ú\»\‡¯\0ÿÄ q\0\0p\"Ä\„\0`Ç8\ƒ\0¿â<\0é_\0Ä\r\‚@\0\0\'Ú\08~\06 àA\0\0ú\»\‡¯\0ÿÄ q\0\0p\"Ä\„\0`Ç8\ƒ\0¿â<\0é_\0Ä\r\‚@\0\0\'Ú\08~\06 àA\0\0ú\»\‡¯\0ÿÄ q\0b∆ë#GTMMç*++Sk÷¨°\Ÿ\‹÷Æ]´*++U]]ùëy\0ø\0\0Ç8\ƒH\‰Æ™™J555©s\Á\Œ—¢\‘Nû<©***Tmm-ùíy\0ø\0\0Ç8\ƒ!VB*ó®\\\n\'\ÈOÑp±\∆…±\rN\‰p¸\0\‚@á\·®\\¢r)\‹$¯\·{çù&Å/8ë¿Ò\0 àA¢å\ %*ó\"AÇæSÇ8p\"p¸\0\‚\0Ç8òPπD`\Õ \Ó€ø5®Éõg´Ωk\«\Ë&ó\Â6˙˝\ ıııú\»\‡¯\0ƒÅ ±ò\–L\¬›ØZöè´=´F™ù\À_rkrõl£?–Ø\"i\Ïÿ±˙\'˘óy\0ø\0\0Ç8\ƒ!¶Ç8*óL\¬›Øé\Ó˝§]g¥c{K\ËÙ´à?~º˙\ﬁ˜æß∫w\ÔÆˇ5j\'Ú\08~\0q àCl&T.òD¢_\Ì+\Ô3àìmÙ˙U$C8#|ìä∏´Æ∫**a\'Ú\0A\0Ä  à#à£râ¿ƒñ~µgMÅ\œ~%\€\ËÙ´HápÅn\ÁD\0\«/\0Ä q∞=0°râ¿Ñ é~\Ô§Ú\Õ_\ÿfl∑s\Œ8N\‰Ç8\0\0A@GG`B`bKøíπ}ı+\ŸF†_Ö;Ñ≤\Ÿ]«â<@\0 à\‚\‚\‚Ll\ÈWu\’E>˚ïl£?–Ø\¬¡◊¨V∫ª?\'Ú\0A\0Ä  àCX*óL\"—ØNﬂ•ˆ¨\Œo\Ó:oìmÙ˙U∏B∏`+\‹\Ï\n\„8ë\‚\0\0q\0AAïK&∂Ù+iá∂\Ãk◊ß\‰6˙˝*Z!\\∏\Óœâ<@\0 à\‚R`B\ÂÅIDÇ∏\ÔæSu¶∑wù∑\…6˙˝*TÅf∞˚q8ë\‚\0\0q\0A¨&T.òÑπ_µ4Wµ\’S|VZ\ 6Ÿá>Aø\n5<◊∞\“HV\∆q\"\ƒ\0‚ÄÑ\r\‚é9¢äããıI\’¿ÅUFFÜ˛#*55Uı\Î\◊Oç9RÕò1C<xê é\ %ìHı+gi®[ßvóÛ\¬Mˆë}\ÈcÙ´`C3#ÑªxÒ¢\ \ \ \“ˇ\√Û~ëö3éyÄ \0@$\\WZZ™OûÚÚÚ\‘Ãô3\’∆ç\’Ò\„\«Ukk´\ﬁ.ˇ655©≠[∑™πs\Á™?˛Òèj–†Ajˆ\Ï\ŸqT.òÑ±_\ÍKÙ1˙U8B8£rMB¥ª\Ôæ[ˇq$ˇZ\r\„|\›/a\‹\È”ß’≤e\ÀTAAÅ\Í›ª∑>ë7~ à\0\ƒq\ƒ8p@ç7NΩÙ\“K:dkkk≥|\ﬂ;v®°Cá™˛˝˚´]ªvu\Œ é\ %ì0˜++}\…_£–Ø¨ÜpB*⁄Æ¸ad9å3ápF\À\Œ\Œvmv\Œ8\œ\‡\Õ\·p\ËÛÛÛUIIâjii\·ØWÄ \0@\ƒ∑b\≈\n’∑o_}¢L\0\ÁI™\Èû{ÓπÑÆé£râ¿ƒÆ~jg4˙˝\ _·ò∑P\Õ_gus\∆ºq\0\0Ç8†\”qïïïj¿Ä™∂∂6,èW__ØC=ô?Æ≥qT.òD¢_\—\ËWæHı\⁄\Í’´C\·|\rµ\ZÆ⁄ô\√8Ç7Ä \0@t\⁄ N*\·$Ñì9\ﬂ\¬IOÜ\'Ω˚Óªù\"à£râ¿Ñ é~e˜	≠4	\‰\ \ \ ,\›\«\ÍúmÅB∂`C8\√ÎØøÆ~˜ªﬂ©û={ºq\0\0Ç∏N!99πõÛw`Å\√\·(v˛ª\€\ŸZÆ¸-\ﬂz\Â˙bgõîîÙP4í¶\Îw\Ì⁄ï3w\Ó\‹ıoºÒ\∆\ÈÅ^0≠\“y\È˘\Áü?7|¯É\Œâ˘\ŒˆsÇ∏éì9\·§r-\\ïpû§2.==]mﬂæ=\·É8\ZÅ	˝ä~ç \Œh}˙ÙÒ[!\Áoxh0a‹ÖB\n\·£Gè\Íu\0 à\0\ƒ≈õåååÎìíír«óû∑˚k\Œ˚lw˛€∑gœû?àx\0∑d…íyc«éΩ\ƒ*ùó^x\·Ö˙\Ï\Ï\Ï,Ç∏–ç3FW$DíT\‹…úqq4Ç8˙˝*rAúπB\Œ3ê6ÑÛ\∆}ˇ˚\ﬂ9Ñ\Î\Ë\Î@\0 àãuá\„ú≠>ò\0\ŒK;\ÍlèE\‰n‹∏1s‹∏q\ﬂu`ïŒ∂úúú}={ˆºã .8≤®Ç|\Ó\Áœüè¯Å&+©&\“Uì`XùÀã~Eø\nGgÆêì!´¡ÆZj%å\ÎH\Á\∆\Z&Ä \0@/Up\Œ\ﬂu≥Gõ˘\Ôr\ÈYTT§™´´u¡Ÿô3gÙ\Á`úI∂5}˙tïôô\È\Ì\Ô˙˜\‰q√ï*]≥lŸ≤u\·Z•\”˘Ç\œ&xu\\\ÿ;øú¸H¯iáù;w&TUÅ	ÅI(ÅI†πº\ËWÒ›Ø:¯?^m›ªw\ÔPñ·®ûïpr]n\Ôy]ÚX2ç\0Ç8\0\0A\\ºz\Ï±«Æq˛û˚\Ã¸7∏\‰]íWY-~í\\L\ŒA\‰~\œ/\ÓPU	\·***6E`ïŒ≥\Œ\›˛qÅ9rD/\––ë\04X\ƒ\Ìﬂø?¶ PπD\… .\–\\^Ù´¯\‚¢ŸØå÷´W/µh\—\"˝åˇt\ÈH\Âq\0\‚\0\0q+\·\‹B8ôRÕ®|ñT\ ∑\„$\Ï˘EJ%\\W\Èlq8©q˛…ó˙\Œ;\Ô\ÿz∞Mô2EMò0!.*ó\‚\ÏL<É_˙A\\G˙ïg\0\Á-Ùbé8\0q\0\0Ç∏í\·®\Êø\À\√5øúè§§§∏\rS\ryN8V\Èlv8]	\‚¸ü…Çv™©©Q999qòPπD\… \Œs./˙A\\(˝JÊúêˇ\\Ò¿yø¨V†±j*\0Ç8\0\0Aú•Ö\⁄\¬¬ô≥èÛ\««ÇMíÆ3fÃπHØ“π|˘Ú≥)))5qæ\r8P544\ÿz∞566™\‰\‰\‰∏L®\\b./;\Z˝*∂Z(ﬂ°ù¸U¿\n\„Ö`æB8#l¥›óŸ≥g´gü}Vı\Ï\ŸSˇö8q¢˙Ù\”Oı\Ô\0q\0\0Ç∏xíj^UÜ£FÇ\«0’£A\Õ∑t\È\“˜\ÌZ•≥_ø~ç	6D5¨üèTP»∏c;\…Û\≈˙`T.QπdgøÚR\ËWTZ\⁄!\–*™VC∂`\√8#îø™™™‘å3\‘\À/ø¨Wár˛æ\÷ˇQ#U\”j˛¸˘\ÍÛ\œ?y˛9\0q\0\0Ç∏HKJJ\ 5/\Ã\ÍúpV≤è[ÆÜs˛Ò¡\∆U:\œ%XU\\B¸!À´\nRπD\Âí]˝\ﬁW%SG˙\’}˜\›\Á\nC:ÛﬂôÒZΩmõ3gé\Í÷≠õ\€mˇ˝\ﬂˇ\ÌsÇ∏\‡˘™å6\\≥∫øÒ|Cáı˘8ºI\0\'Aúr\ÃI@\'Aùv\‹IÄ©?p\0\ƒ\0\‚Çñ˙•qé\'´£Fí\«\’CñnÿµkWé›´t:ˇxotæ¿ü\∆¯∑\∆\Ÿ~mw\'AÄ\›qgœûç€ä8*ó®\\\nGø\n4óW®˝jÀñ-nAàÒ\Z\ƒ\…\≈[nπE\Â\Á\Á\Î\Î\Œ\ﬂ\ÍÒ\«˜\‹ƒÖF*„Æ∫\Í*∑0NÜ\·;\‹\‘[óùù\Ìˆ<°\Œ	\'˝AÜÆ\ V öññ¶è•`Ü\„ à\0ƒÖ;ßINN\Óf>œãÙ\»O\…\“dÑûÒúIII|#s\Á\Œ]o˜*ùÖÖÖ;,ó\ÏEou\r˝!\ \‡É\Îgìõõk˚qÚ|Ò6G\\$*óå∂i\”&ı\»#è®ÎÆªN\›p\√\r\Í\·áV\’\’\’™$\n5Yø~ΩzÙ\—G-\ﬂG\⁄M7›§Oå•:Ö .pme.ØP˚ï|Úù\»/\0˘˜˜øˇ}ª\ÔL∂I?ì π˝˚˜[\ﬁ&˝\‚Å–∑ù:uJW*…æ\“o•<˙Ù\È\”j¡Çz\ﬂ\‘\‘TΩ_zz∫æ.\’M“∑\Óπ\Áu\Ìµ◊™\€oø]Wª˘\Î\«#Gé‘∑/_æ‹µü<?A\\\‰\¬8Û\ÊP-ò|\›/\ÿ\"8ë\‚\0\0qÒê\”8∑˚\ŸÚπÕú9”úWå\r¯F\ﬁx\„ç\”vØ“πa\√ô4Ø$æ`S[\È#y\r\Îg#C\Ï˛>\ \À\À\„f\’\‘HU.ôõq\“*?€∂m”ó¸\„\€ƒÖÚò\Ê˝&Mö§/<ò .LB\ÈWR\Ÿz\€m∑©˝\ËG∫zHæ	\ \‰vÛw∂d\…µl\Ÿ2}Y*Ã¨nì9Oú8°oì\„Wnì\‡mÒ\‚\≈˙≤Ñq≤].ˇ\‰\'?\—˚\›y\Áù˙˙—£Gu\'°≥\\ñ\€næ˘fø}NÜ§\ \Ì---˙˙3\œ<\„z_që\·9LUB4©hv~6\œ˚yÜ|ú\»\‡¯\0\ƒS\Á/ßq^/6∂€ï≠\Ïÿ±\√¸ö|#ºÖU:õdEâ8˚Ç]…´\«\÷\œF™\ÌÆPú0aÇn±,“ïK\Ê&aâ|ØFíø`\Ã|›∏,C\»\‰1$∏¨b˙\Â/©+ê§jMÜ¯Iò!LRë$UJ\Ê}\Âvs•õ\’ NÇsx\Ë´Zä¿$≤AúÑhÚ=2D_ó\Ô^Æèe|g\ÃI3æÛ`∂\œeÙo˚\ﬂ{\ÔΩ˙∫\ÓÚØprª\ÃW\'ØÕ≥™\ÕWì~\Î\ÌvÇ8{√∏éÚ6\Ïïy\0ø\0Ä8\r\‚\⁄\Â4\ŒÎªç\€\Ì ∫öööÃØgüïe]£µJgk<~¡\Ê\‰ıJ)dX?õÉ\Í\·©v\Œ\Ÿ\'s˚H`\‘Y\œ&°§|Ø7\ﬁx£¨Ú´+\„Ç	‚§Ç…®b2Üïö+ú$\01ÆKıR]]ùæ,Ûo˘z\Ã`+\Á\‰≤\'˛™•L\"€Øû~˙i∑ \’hF0\Á-lì∞\‘\Í6o\·±yÈø≤M˙∞\\ˇ\Ìo´ˇï˛ ∑w\Ì\⁄U_/))±\‘Áå∞è .~√∏pázú\»q\0\0Ç∏X\Àiú\Ìúq›Æ\≈ƒÆd\\FkµÙF¢ı?Z∏É8!C\n\ÌZ≈∂≤≤Rı\Ó\›;a~pÑk±ôNBj	3\‰;ñp\ŒjÁØä)ò@/\\Aúøj)ì\»Ù+≤yı\’W\ÎäG\„∂Y≥f\È\œ\ﬁXu\‘¯\Œ\ÊÕõ\Á\n\√zÙ\Ëayõ˘˘å9\Ë\Ãa´p≤Õ∏nT¥}¡n˝\¬~®\œ=¯\‡É˙v\œjJ}¥£˝ö \Ó::ú4R\√Q9ë\‚\0\0âı˚ ëZ¥>ªÄA\\Ø^Ω.Eaï\Œ\∆8Æà€úîîÙîiI⁄∞>r¢<h\– [™\‚$Ñ{˜\›w	\‚|4c˛,+ÅZ0ULë‚å°©\∆D\’Rqë\ÈWS¶L—ü≥,p`\‹&Uß\∆˜t¯a\◊e©Nî\–NÜàJµ§˘˚Ù∑\Õ¸|2¸XÜDK?ï&!úò…øÚr˘˜\‰…ì˙ˆ©Sß\Í}333-ıπW_}\’UÒI\›0.ÿä∂H,\Ã¿â<@\0H<q\\\Á\ iúó[bæ\"n¿Ä\Á\Ïû#\Óƒâ_\ƒ\·qû\\óHqBÜßJ%L$\…\\t\ƒöw≠≥q∆ê=ô\»~Àñ-Æ\’eõLæ/\◊˜\ÏŸ£WèÙ.\»\\oF”ìO>Ÿ° Œ®»ì0\≈<\'òø¿„≠∑\ﬁ“óá∞Z*RA	CS;∂G4Ü{Z©Úªı\÷[m\÷L\Á?T≥\Z\∆Ez8*\'Ú\0A\0Ä .ñr\Z\Áı\Ì1?G\‹»ë#\Î\Ï^•s’™U+\‚h\’\‘\Zá\√Òø^∏àqR=#ï*µµµy¸\œ?ˇ\\%\'\'´\Ì€∑\'\‘ép&≤\‚\…#è<¢´Ö§Ç\Ë\·áV555z€ú9sÙ\ÍíReñóó\Á5ºí9∏d\‡}˜›ß\Á\ÎH\'\√e\Ó8y\∆b˛Çi≤Ñº6+\’Rq\—\‚å\Ô#\ÿm\—l2TV™Û\‚\‚#åì\ÔKˆ:t(\'Ú\08~\0â\ƒ˘\Ãi\‚b\’‘â\'æc˜*ù˘˘˘Àù/npå¡æ*\‡l	‚ÑÑ>\ÍH∫\ZN«èW©©©	5$5íÅ	ç¿Ñ~Eøä5Å\Ê|3VGµ+Ñ\„D à\0\ƒ\≈BN\„\‹gÑä\ŸÚπÕú9\”ƒç\r¯FFåÒØπππm\\•≥599˘ÄÛ\≈˝¥Kbà¯öùù∂\ 8©Ñì\Óµ\◊^K\»âòïRûç¿Ñ~E\◊˘¯™å≥s8*\'Ú\0A\0Ä .ñ$\'\'w3B1ô¶\È¸˘Û˝\Ã$K\À\  ∫d<gRR\“Cñ^\Ëã/æ¯•]´tÆZµjæÛ\≈UuIˇ\Ãfœû≠\“\“\“\‘\«‹°§NÜ£J∏ó®LL\ËWÙ´\Œ\∆E+Ñ\„D à\0\ƒ\≈R\ÂúåïññF¸\\\—T\rw\»¬®\ Àû{ÓπûÉ\r∫`CU\\srrÚ6á√ëJô3N*\„û˛˘†\Áu´™™\“Û\Õ\…\¬â6\'Å	Å	˝ä~Ew9|\ÎﬁΩ{\‘B8N\‰Ç8\0\0A\\¨p8YF8&ã\ÕEjıTYP1\'\'\Á¢)àn\n6\ÁùwEzïNôèN™\·,\'Ñq\Ìº˜\ﬁ{:êìP\ÌO˙ì™ÆÆV«é\”@ú={VØRYY©&Lò†+\Èd_©ÇK§\’Q	LL\ËWÙ+¸É\Ã	\'øè|\Õ«â<\0é_\0@g	\‚222Æó\Í4# õ;wnD>Ø\‚\‚bs5\‹—û={˛ \ÿ“Ωüfffûç\‘*ùªv\ÌZ\Ê|éá\√—µKbâ\ r\‡¿ı\Êõo\Í0SRR‹ñï·ß≤»ÉqRI◊ôòò–Ø\ËWùU}}=\'Ú\08~\0ù>àªíq=\Êlåúd≈äa˝¨÷≠[\Áñ\√\»ÛÖÙBSSSSrrrŒÑ{ï\Œc«é}ñúú|8¡Ü§F5àÅ	Å	˝ä~N\‰p¸\0\‚|Üq≥\ÕaY∏\¬8	\·\“\”\”\€Lè˝^á^hJJJfvvvK∏*\„§NB∏§§§°]G+Å	ç éFø\‚DûyÄ\„\0@CdZ4	\…\ÃaúS5¶ˆ\nñ\‹\œc8™¥\≈2∂\√/6))\È©©©ß?˛¯\„o;∞ÄCÛõoæ)\ÈcÉ≥etI\\≠&4Ç8\Z˝äyN\‰é_\0\0A\\Üqá£\ÿû\…≤ö™’ºKˆì*8èÖtÙºpÅ\ÊåKNN.s>Q\„∂m\€\ŒÆ^Ω∫855Uñã≠J¿9\·\‚Lhq4˙8ë8~\0qÒS7\€<gú¥åå5}˙tµyÛfΩË•±∫™Tæ…îmªv\Ì\“_\Ê\‰\‰\\Ú\‡Ùp‘∞T\¬˘\‰˛ür\Œ\'hz\„ç7ˆ~ˆ\Ÿgáè?\ﬁ`Z•≥Òƒâ_¨]ªˆ”ÇÇÇï)))%Äì*∏[ï é¿ÑFG£_ÅyÄ\„\0@ø8Ú™”éÜº0Cs\«\›\·p8Ú§Ù\Ó\ ?w\ÂE¥^y!%\Œ6X*\È∫t.≠&4Ç8\Z˝äyN\‰é_\0\0A\\åì*∂§§§\\\ÁÔæ∫ 8\…¡áu(jI¢o™ìTΩ\ƒò\–\‚hÙ+p\"p¸\0\‚ßB\Ó~g!s\»%%%møRhfú\ÌìB4\Á∂◊ù\€äzˆ%/\¬[\Î|QˇC\ZAç~≈â<\0é_\0\0A\"\ƒ-5ï\Ám&àÅ	ç éFø\‚D\0\«/\0Ä ë)\›s[i\"))\È)Ç8ò\–50)++\„˚§_Åy b\Í\Î\Î9~\0q?7úG\€‹â\Áä\„h%à£%x`RUU•óØ\Ê;ç~kll\‘¡(\‚Çq\‰\»USS£˚é¸\\¢\Ÿ\€÷Æ]´*++U]]äc«é\’\'>Ú/\«/\0Ä ´\·å\Êp8˛ó \—F\ÂA\\$8p@UTT®Øæ˙ä\Ô5B∏\⁄\⁄Z~\ÿ\ƒ\¬¶Gøù<yRˇ\Â¯u7~¸xıΩ\Ô}Ou\Ô\ﬁ]ˇ;j\‘(é_\0\0A‹Ç∏ï~ñr≠!àC¥q≤E\ÂR$√∏u\Î\÷Q\›\≈FG\n©Ñ\„˜B\ÏÑqT¥∂\·åM*‚Æ∫Í™®Ñqq\0\0Ç∏8´Ü\Î\‰s\≈q¥\∆XXB\ÂïK\0\‚TJS)!\\†\€	\‚\0\0q\Ã\r\Á´m&àC,ÑqT.QπÄ N0w(A\\¨ë\ 7aõ±\›\Œ9\„\‚\0\0qÒ\ŒÒ%\ƒ\0˜A‹∑kP7\œV{◊é\—M.\ÀmÑgqë\·ÖlvW\∆\ƒ\0\‚\‚\‚\0\0 à≥%àki>Æˆ¨\Z©v.…≠\…m≤ç\0ç .åp\Õj•[∞˚\ƒ\0\‚\‚\‚\0\0 àã˘ \Ó\Ë\ﬁO⁄ÖpF;∂∑Ñ\0ç .l!\\∞nvÖqq\0\0Ç8Ç8Ç8\0\0\‚l	\‚ˆïè˜\ƒ\…64Ç∏hÑp\·∫?A\0Ä é é \0\0Ç∏ò	\‚ˆ¨)\ƒ\…64Ç∏PZò¡\Ó\«!à\0\ƒ\ƒ\ƒ\0@GGó∞!\\∏ÜïF≤2é \0@GG\0\0Aú-Aú¨í\Í+àìmhq°ÜfFwÒ\‚Eïïï•ˇ\rÜ\Á˝\"5gA\0Ä é é \0\0Ç8[Ç∏∫\Í\"üAúl#@#à%Ñ3*\◊$Dª˚\Óªı…ç¸k5åÛuøpÑqßOüVÀñ-S™w\Ô\ﬁ˙¯mmm\Â:ç#Gé®öö\ZUVV¶.\—\Ïmk◊ÆUïïï™ÆÆé\ŒHÇ8Ç8\0\0:[w\Í¯.µgu~˚a©\Œ\€d\ZA\\®!úêä∂+\'6ñ\√8sg¥\Ï\Ïl\◊ˆ`\ÁåÛ\ﬁá˛7??_ïîî®ññ~à°SÖpUUU™©©âü\ÀQl\'OûT™∂∂ñNIÇ8Ç8\0\0:S\'\Ì–ñy\ÌÇ8πçì%Ç8´|Öc\ﬁB5aú\’˝˝\ÕG¯&ïpÑp±\∆IU\"\‚@G\0@g\n\‚æ˚N\’mò\ﬁ~X™Û6\Ÿ\∆\…R\Á	\‚§zmı\Í\’!ápæÜãZ\r◊Ç\r\Ì\Ãa\\¢o!da∏I_\‚\Á1ø@GG\0\0A\\Ç∏ñ\Ê„™∂zä\œ9\‚dõ\Ï\√\…R\Á8\·í~,M9´U\ZV\Ál≤\¬^˝uıª\ﬂ˝Nı\Ï\Ÿ3\·*\ﬁB\»¬®˝\rç\ﬂq à#à\0Ä .å\'\\\ﬂ}ß\Z\Í÷©›•\√|ÜpFì}d_™\„:Og¥>}˙¯≠êÛ7<4ò0\Ó¬Ö!ÖpÜ—£Gı:\‚CB\Õ \Ó€ø5®Éõg\Î’≥•\…eπç˛@GÇ8Ç8\0\0\‚Ç8\·\nTGuAúgÛ6d5\ÿ\Œ_˜˝\Ô?\‰Æ£Ø\'ñ1Ñê\„7ZAú¸¨ﬂ≥jd˚E|ú∑Ò{Ä~EÇ8Ç8\0\0\‚Ç8\·≤R\ÁØ:éß\Œƒô+\‰$\nv\’R+a\\GB8\œ0.\–0\ŸD\nLhøë\ËWG˜~\‚Û˜¿±Ω%Ù˙A\‚\‚\0\0 à≥z\¬jg4Nú\Ï;\·\nåE≥u\ÔﬁΩC}SÜ£zV\¬\…uπΩ#\‰u\…c\’\◊\◊wö é!Ñ&\·\ÓW˚\ \«˚¸ \€\ËÙ+Ç8\ƒ\ƒ\0@◊ÅyZ\Ïqv˜co≠WØ^j—¢E˙=à@´§BE\\¯é_ÜòD¢_\ÌYS\‡3àìmÙ˙A\‚\‚\0\0 à#à#às\Á¿yΩò#.∫\«/C	L\‚\ËW à#à#à\0Ä é é\«A\\FFÜ*..ˆ\Z¿yø¨V†±jj¯è_ÜòD¢_\…g_˝J∂\—\ËWq à#à\0Ä é é ÆÉ¸U¿\n\„Ö`æB8#l¥›óŸ≥g´gü}Vı\Ï\ŸS\r8PMú8Q}˙Èß™±±±S&T.òD¢_\’U˘\ÏW≤ç˛@ø\"àAA\0\0ù*à\À\ \ R´WØ&à#àã	ÅVQµ\Z≤\∆!\‡K/Ω§™™™‘å3\‘\À/ø¨233ï\√\·P\…\…\…*\'\'G®˘Û\Á´\œ?ˇ<\‰˘\Á\‚hù)à;u|ó⁄≥:ø}ür\ﬁ&\€\ËÙ+Ç8\ƒ\ƒ\0–©Ç8c°reeeqqQ\Á´2.\ÿp\Õ\Í˛\∆Û\r:\‘\Á\„H&úq\»I0\'ùu\ÿIp\'ﬁô3g\‚60a!ÅI$˙ï¥C[\Êµ\ÎSr}Å~\’555z:Å\‹\‹\\ïññ¶&\”\»ı~˝˙©¸¸|ø\€\ƒ\ƒÒ%\ƒ\0ıIı˚Ù\È\„µBé é \ŒNRw\’UWπÖq;\‹\‘[óùù\Ìˆ<°\Œ	\'CVe\Ë™aï°¨r\‚\'üs0\√qc)0a!ÅIDÇ∏\ÔæSu¶∑\ÔS\Œ\€d˝Å~˘œé\¬\¬Bïöö\ÍsunoM~>Oô2E577ƒÅ é \0Ä\ÿ\n\‚\Ãr\Ê@é é .\Zaúys®\Ãæ\Ó\ÏÒ¸93Ñê¿$\Z˝™•˘∏™≠û\‚3\‡ïm≤}Ç~e\≈G}§RRRÇ\n\‡<õT3ØX±Ç qq\0\0\ƒ^gÆêìaqq\—\‡9LUB4©hv~6\œ˚yÜ|q!$0	cø˙\Ó;\’P∑N\Ì.\Ê3Ñ3ö\Ï#˚RGøÚE™\‡ÚÚÚ‹Üû\Z´r©\Í\Íju¸¯q\◊\‘\0≠≠≠™©©I\Ìÿ±CMü>]O!\‡˘∑ÕÄ\">ï\0AAA\0\0q\ƒ\≈b#àã≠\ wØ¨Æ¶jï∑aØq!$0	Oø\nTGu˝*Úæz˜\Ó\Ìˆª¨oﬂæ™¥¥Tù?\ﬁ\“c¥µµ\È\œF\Óg~ôC.íCU	\‚\‚\‚\0\0@P¡_Ø^Ω‘¢Eã\\Û]\ƒq¬ïa\\∏CΩD	\‚B\»ÒÆ~e•\n\Œ_u˝É~eêä5\œn\Ó‹π!W≤I•\\qqqª0.RÛz\ƒ\ƒ\ƒ\0\0KAúg\0gıD\ﬁ_ª\Ôæ˚\\\Â:t(\ÊOfå\◊\Ím€ú9sT∑n\›Ù\Âï+W™{\ÔΩW]{\Ìµ\Íû{\Ó\—+∏q\¬9N\Z©\·®q\ƒ1Ñê¿$\Ã˝*\‘\ŒhÙ˙ïAÜ£öˇ>)))	[ø5\œ5\'\√T	\‚\‚\‚\0\0Ä\ÌAúÃµ\"ˇS\Ï\ÎÜC\r\‚∂l\Ÿ\‚∂b\Âå3\‚6àìU2oπ\ÂïüüØØw\Ì\⁄U]w\›ujˇ˛˝z	\Â8\·≤\'å∂¢-3\ƒ{\«Bìàº4˙U\…\¬\Ê9\·\¬¬ô˚Æ9\‰ã\ƒqqq\0\0¿+_p\·:\·\Z8p†˛cTÇ>˘˜˜øˇ}ª¿K∂\›p\√\r∫rNB-´\€}ÙQı¿\\^ÒÒ\‘)ïìì£˜ïpL\ÊÇ9}˙¥Z∞`Å\ﬁ755UÔóûûÆØœü?_≠_ø^W≤IE\€\Ì∑ﬂÆ´\›¸q#Gé‘∑/_æ\‹\ÌvôcFnó\Á\ÂÑ+ÚÇ^\Z\È\·®Ò\Z\ƒ1Ñê¿Ñ é~ãdË©πbMÜ£FÇyò™¨¶\Z\Ó˘\‚\‚\‚\‚\0\0Ä\Ì\'\\2\Àm∑›¶~Ù£\Èj2˘]/Aô\‹nºñ,Y¢ñ-[¶/?˛¯„ñ∑\…jÆ\'Nú–∑I\'∑I∂xÒb}Y\¬8\Ÿ.óÚìü\Ë˝\ÓºÛN}˝\Ë—£:Ñ€¥iìæ,∑\›|Û\Õ~É8í*∑∑¥¥∏\›.UVr{è=8·ä±0nﬁºyzø°Cá\⁄Ú∫\‚)àc!Å	A˝*∫-\Ã©\’M\ÂoÛ&L à#à#à\0\0Ò}\¬%!ö¸~2dàæ˛\À_˛R_7\Àº\‰èai\Ê™2´€å\Áímæˆó!£rΩºº\\ˇ+ú\‹.Û\’\…kì™:s¯\Ê+àì\ 9\œ€çêP\¬F;\Áø\Î\ÏAú4Áõ±:™]!\\ºq4˙˝*Iªé\…Í®ë\Ó\√\∆sI^8n à#à#à\0\0∂üp=˝Ù\”nÛ\√\ÕÊºÖmR1guõ˘πdõ\Á˛7\ﬁx£\ﬁ&´¢\…ı\ﬂ˛ˆ∑˙_©û3\Êxì\Î2˜åï \Œ˚\ÃÛ\ﬂ\…ÛJêw¯aN∏¢¿Weúù\√Q	\‚hâv¸fee©’´W”Ø\ËW∂˜+YÙ\»<w\Ì˘Û\Á#˙ö\⁄\⁄\⁄Tü>}\\\œ)ïˆqqq\0\0 .O\‰e(\Í\’W_≠ûy\Ê\◊m≥f\Õ\“ò\Z´é\ZÅó4\¬0cxßïm\Ê\Á3\Ê†3Mï\0N∂◊çä∂>¯¿-X€∂mõ• \Ó¡‘∑\À\‹sr˝\…\'ü\‘a£\ÁPU_?XyÇ∏éáq\—\n\·\‚hâr¸\Z°Ñ\'˛Ç	˙˝*\‹˝jÙ\Ë—Æ˝äääly]3g\Œt=ß,\∆DGG\0\0\‚ÚD~ î)˙èPY\‡¿∏\ÕX]TöTêóeé	Ì§≤\Ã\ﬁieõ˘˘d±˘\„^\¬5i\¬Åô¸+è!˜ëOû<©oü:u™\ﬁ733\”RHˆÍ´Ø\Í\€e8™\\óä;s•üú@\ƒE7å\ÎﬁΩ{\‘B8Ç8Z¢&Fìä!oïLÙ+˙U∏˚UnnÆk˚∆çmy];v\Ïp=ß¸\Ì@GG\0\0ˆD\ﬁ_\’—†*M™¸nΩıVr\¬{åE3|\ÕóàAC	L\ÏLÃïL\Ê˛Fø¢_Öª_•••πnohh∞\Âu555πûS\Êß#à#à#à\0\0	\ƒ\’k¡nãfì°≤Rù\«	Wl™ØØè˙âf4NlBH`bG`bÆdí˛Fø¢_Öª_ôØGjµTO2Ø¨˘y	\‚\‚\‚\0\0@\¬q4Ç∏D≠ é!Ñâ}¸\n0¢\’\ËW±\’bµüÑ⁄¢ı≥î é é \0\0\ƒ\—\‚\‚Ç\nhBòxA\\,Ù´^Ωz©Eã\È˜@ø\‚˜B$˙ï\√\·†\"qq\0\0Ä.N∏_Å	C	\‚\¬ŸØ<∏p˝^0/v#S\‹w\ﬂ}j”¶Maõ_\‘\Í\\£°\ÃIj~\Ì7\›tì\Z8p†é¯Ω–±~\≈q à#à\0\0qq[0\∆BZ®C£—è322Tqqqª\0.\‹Aú\\.//◊ó%å≥{°üé\ﬁg“§I˙Ú\‡¡É˘Ω\–¡~≈™© à#à\0\0qqàª\‡è!Ñø\·´.íAúq˝\⁄kØıπÕ≥\“MÜ`\ﬂp\√\r™[∑njˇ˛˝~+\‚ñ-[¶\ÓΩ˜^˝¯rüG}T8p¿m?	a§2\Ôˆ\€o\◊ÛX}\Ì---˙Úè¸c}˝‘©S*\'\'G?è<û¨¥}˙Ùi˙ïÖ~5n\‹8\◊œ±¢¢\"[^\◊Ãô3]œôüüOGG\0\0\‚hq∞ƒÖ2Ñp¬Ñ	\Í\Œ;\Ô\‘Ö±KNNvVÉ+E°T\€÷Ø_ØñH>\Áú9st\√Òôä8„≥µ\ƒI∏&M.ﬂªØ~yÛ\Õ7\ÎÀá\“\√_Â≤±∂˘Ò$–ìÀ∑\›v[\»!¢Ñpr}¡ÇjÒ\‚\≈˙≤Ñq¸^¨¶¶∆≠r\Ó¸˘Û}æ∂∂6∑\’Z˝≠>MGG\0\0\‚\‚@◊°!ÑSßN\’\'ãø˘\ÕoÙÑ\ÂF®\Ï¿X	\‚\"˝ççç\Íñ[n\—U3ø\·ù#\ÓÍ´ØV˜\‹sè™™™≤\ƒIüïf\Ã1\ÁØ_>¸√Æ∞\Ï\…\'ü\‘}ˇ\‰…ì>üK^O®Aúº_Øè\ﬂÅ\…(?\€JKK#ﬁáç\ÁJII	XJGG\0\0\‚\‚–âut°T\…\ﬂ\‡Kó.ı∫\›\ﬂ;_ÅáT•I†\"°ÑÒì\n≤@\√	≠<èT<Lﬁû\√?|Ω.+\œ!s|\›x„ç∫\ZÍ≠∑\ﬁj˜yå9R\Ô∑|˘ré_˛°©ÅÇ.Aú|Ø˛˙•\Ï\'ØWUê!§r˚\›w\ﬂπÇö*}RÆ\ÀkÒ|}“Ø¯Ω`Õ¥i\”\\\·òßëZ=Uæ˘ô`<óTáAAA\0\0 à#à«Ø[ì K˛˜5ïø!væ	#d\Ë\ﬂ—£Gım2$0\–pB+\œ#C\∆Nú8a\È9ºÖ%VûC\…={ˆ\Ë\ÀR˘\Ê+∏î\‡Ö\„7≤AúÑ°≤Mæ	>Ωı∑˘ÛÁ´íí}Y™\‹¸ı\À|P_ñ°è“è\‰Ú?ˇÛ?á%àì\–V.>\\_ó\nUœæ&Û\œ˘{}\·®\ÊLî~%¡õTß\Ÿ‹πs#Ú<REl<á\…onn&à#à#à\0\0q4Ç8D\Ó¯ï\·wÚ7∏Tãy\€\ÓoàùØA\Ê\‡\Z2dàÆ^≥:ú\–\ Û\»\Ì\∆\Î\nÙ\ﬁ\¬´\Ô\≈\ﬂ\–D#∏\‰¯ç|\'Ué∞JuY^^û\◊\ÔY\¬U˘Nd(u]]ù\ﬂ~y¯aı\Ã3\œ\Ë«ì˚Hﬂë\  éq\“dnEyç\ÊJR©¸î˛%MB∏@ï§q\ÓV¨X\·6ˇ•\\ßu\Î\÷EÙÒ	\‚\‚\‚\0\0\0AA8~\€5	0¸\rMı7\ƒ\ŒWà–µkW}Ÿ®T≤2ú\–\ÍÛ-\–sxTÇy_°à\Êq¸Ú{Å\ﬂë\'\·f$\¬2	\·\“\”\”]è;`¿Äàº~Ç8Ç8Ç8\0\0¿	\'\\\‡¯uk3f\Ã\–\'ã=zÙ\–\·‘í%KÙıª\Ó∫+\‰!vFXµm\€6\À\√	≠>èg \Ê˘¨Cmç∞\Õ\ÿ\Ãs¯\n\‚å\·ç≠n\"àãüfTµy6~/Dûº\'	\…\ÃaúSïc;r?ÛpTiÚ3 Rs\–\ƒ\ƒ\ƒ\0\0N∏\‚¿Ò€Æ\…¸V2˜ô◊ì™1ô∑M\Ê\—\nuàù¨F)˚fffZNhıyÃ´Ωz{éY≥f\Èπ\›dX©~ûã5X}_A⁄´Øæ\Íö\Áé é\ﬂ¸^∞\'å\À\Õ\Õu\œdnGYMµ≠≠\Õ\“c\»~Rg^ò¡\·\¬=/AAA\0\0\‡Ñã.Ä\„7L≠±±Q\›zÎ≠ÆEöJø\‚˜Ç=aú\Á0UiR\Â:}˙tµyÛf\’\–\–\‡™lì ∑¶¶&µk\◊.5s\ÊL}ºz\ﬁW*\Ì\"U	GGG\0\08\·\‚Ñø7ajÛ\Ê\Õ\”˝s¸“Ø¯Ω`/ô#Œºöj(MVGç\ƒ\¬qqq\0\0 \Ï\ \ \ 8\—\·Ñ&4é_˙˝*j§ä≠∞∞P•¶¶¿IÄ7a¬ÑàE%à#à#à\0\0aUUU•ázp≤\√\„$LL\ËW¥\Œ˙4ïïïj‹∏qzπ¥¥4∑\‡MÇ:ôn‘®QÆˇH¥AAA\0\0\Ëê®ää\nı\’W_q\¬!\\mm-ù&&Ù+\Zï\“1ä é é \0\0Ñ%åìï\«\‰è}Zt\Z!LL\ËW4Ç8Ç8\ƒ\ƒ\0\0\0&4Ç8\Z˝\nqqq\0\0\0\0Aç¿Ñ~EøA\‚\‚\0\0\0\0˙ç~EÇ8Ç8\0\0\0Ä¿ÑF`Bø¢_Å é é \0\0\0\0Å	Å	˝ä~EGÇ8Ç8\0\0\0Ä¿ÑFG£_ƒÅ é \0\0\0 à£ò–Ø\ËW à#à#à\0\0\0@`B`Bø¢\ƒƒÅ é \0\0\0 0°u\Í¿§¨¨å\Ôì~Ç8Ç8Ç8\0\0\0\0q&ëVUU•ööö¯Nc†566\Í`q à#à\0\0\0\‚h	\ƒ8p@UTT®Øæ˙ä\Ô5B∏\⁄\⁄Z~\ÿƒÅ é \0\0\0à6Ü\ƒE2å[∑nù~O¥\Ë4B8Ç8\ƒ\ƒ\0\0\01Ñ!Ñ!@Ç8Ç8\0\0\0¿!d!\0Ç8\ƒ\ƒ\0\0\06Üq!d!\0Ç8\ƒ\ƒ\0\0\0\0ÄÑAGG\0\0\0\0\0`Ç8Ç8Ç8\0\0\0\0\0\0\ƒ\ƒ\ƒ\0\0\0\0\0ÿÄ é é \0\0\0\0:)c\Â\\\√Ò\„«ïúÉ¶••©!CÜ®\‚\‚b>$ å\‚\‚\‚\0\0\0\0†ìŸ∫u´\Z3få\Í◊Øüö?~ªÌ≠≠≠™©©I9r\ƒu[}}Ω⁄∏q£jkk\„BDGG\0\0\0\0ù\Ã\‰…ìÉ\’jkk’∞a\√\‘»ë#u( xqqq\0\0\0\0\–	ú9s&,èSZZ™˙Ù\È£\Z\Z\Z¯PÅ \ƒ\ƒ\ƒ\0\0\0@Ç+))Q˘˘˘\Ìnøp\·ÇZ≥fç\ \Ã\ÃT˜\ﬂø∫˛˙Îç†@u\Ì\⁄Ueee\ÈÌ≤ü\Ÿ\ﬂˇ˛w>T qqq\0\0\0\0ê¿d\ÍÄÙúof≤\√]w›•x\‡Ω@\√¬Öı\‹pBÇ∑Õõ7´â\'™ázH\Ô\Ák\·ÜpU\⁄ùAAA\0\0\0\0$(	\ﬂdAÛ¢∂•¶¶Íä∑ï+W™≤≤2\ƒ\Â\Â\Â©Û\Á\œ{}©äª˜\ﬁ{ı~gœûu{,πü˘Ò¯FGG\0\0\0\0	\Ï¯Ò\„Æ\Àú=ı\‘S\Íâ\'ûP\'Oû‘∑™ÙÙt≤-Z¥\»\Á„¥¥¥\Ë˚ˆ\Ë\—\√U9\'$§ìXMå é é \0\0\0\0:	©ÑìNB5qÒ\‚E=?‹¥i\”‘§IìÙvsp\Ái€∂m\Í\Ÿgü’°ùô¨¶*CY¯GGG\0\0\0\0	HÜãö´\‘dé7éjT¬â\⁄\⁄Z™UWW´\Ê\Êf ç=Z]∫t©\›\„}Û\Õ7*;;[UTT\Ëa™\Ê9\„ˆ\Ó›´v\Ì\⁄≈á@GG\0\0\0\0	\Ê¿Å™Oü>Æ9\ﬂdÒYpA\ÊÑ3˚\√ï\√\·PßOü\÷\◊eò©úÉñóóª\Ì\'ïs\–˚\ ~Úxû´©è é .nÇ8Û\0\0\0\0\0\ﬂJJJ\‘;\Ôº\„∫.¡Y∑n\›\⁄\Ì7j\‘(ı\ +Ø∏ÆK%ú‹ñïï\Â\n\Á\ƒ|†∫ó^z\…uõ¨¶\Í\Ï\Ì¬Ö\Õqqq\·g?˚YÛ\r\0\0\0\0Ä5ì\'OV7nt]\œ\Õ\ÕUc«éu\€\ÁÃô3*99Y-\\∏P}˘\Âój›∫u˙ˆ£Gè™îî5u\ÍT}]ÜúJ%úúõŒû=\€uˇâ\'\Í¿\Œ Ca\Õ\√U∏€∫u\Îñ.]∫‘ët\ƒ≈ºÆ]ª\ŒxÚ\…\'©y\0\0\0\0/^¨\Á|3\‹ˇ˝™™™\ müø˛ıØ:\\€∫u´\Z8p†\ \…\…Qgœû\’\€$úìmrôNqê\Îõ6mr\›_ä%d\Œ9CSSì[\≈\07~¯\√ñu\È\“\Âuí.Ç∏xßΩè<Ú\»…ç763\0\0\0\0Xw\Õ5◊¥õ\Ó\Á\Ì∑\ﬂVΩ{˜\÷\’sRÒ&MÜ†\nô[.//Oáo≤OQQë\ﬁn¨∂™S\Áyôy>oy¸¥¥4>l¿DÜ£J%‹ïnü\‰D<qq\∆9[¡ïé´h4\ZçF£\—h4\Zç\ÊΩy/tÒ≤\0ûT¡•ßß\Î∞MÜî\ PTπ~\Í\‘)Ω}˜\Ó\›z€Ü\rÙ∞\÷!CÜ¥{\œ«Ωr˛J£\—‹õGùHG\0\0\0\0H@\Î÷≠;\’\÷\÷\Ê≥\"Æ°°Aáf“Ü\r¶dﬂØø˛ZW¥Mõ6Õµü[ï\Í8π}\Ó‹πûï>nA\‹Ÿ≥gùè\◊ ß Æ\ƒ\0\0\0\0ÇÒ¸Ûœüì∞\Õ\‡9G‹™U´t◊´W/e\ﬁO*\„dj}}ΩÎ∂Ω{˜\Í}∑l\Ÿ\‚\ƒy\Œw\‚ƒâ/ú˚\Ì\Ê\”\◊\‚\0\0\0\0\0¡6lÿÅ;v∏B2\œUSe\≈S9\◊,//w\◊d±Yúa‹∏qÆ\€d\·	\ÁdïU3\œUS◊Æ]˚©Û1Û\Èàkq\0\0\0\0Ä`º˛˙\ÎÛ§∫Õ∞f\Õ\Z’≠[7}YÜ°\ ÖÖÖ^\'ó7™\Â∂oﬂÆØ\Á\Á\Á´W^y•\›~=ÙêZπr•\Îzyy˘§§§ß¯Ù\ƒ5Ç8\0\0\0\0@0´Ö∂ö\ÁsªÎÆªtp∂o\ﬂ>’Ø_?ı\Ì∑\ﬂz\r\‚$®{Ò\≈\’\‡¡ÉuÖ\\jj™z\ÔΩ˜\‹ˆë`Oœ¥(Ñ<\◊ˇ\·ì˜\‚\0\0\0\0\0¡RJç0ágR!\'s∫…¢≤\"™?2ˇõúãNö4Iˇªm\€6◊∂ññu\ÔΩ˜*s≈ù\”X>q\0	Å \0\0\0\0,•\‘ı≤@™9-ì\Í∂=z\Ë0-ê—£G\Î.99YW\∆ïuO=ıîæ›§\Ÿ˘∏kGW>u\0qè \0\0\0\0ä—£G\œ)--u%f≠≠≠:H{\‚â\'Tss≥\ﬂ \Ó¿ÅzëÜ\·√áª*\·å˚\ \„˛ÚóøLwû∑n~\Ï±«Æ\·˜\‚\0\0\0\0\0°\ËŸ≥\Á]ôôôgè9\‚\∆IeúS5/∂\‡\Õ\‰…ì\’˚ÔøØÁÑì\·®r~j\·æ¸Ú\À%\Œ\€N&\'\'w\„\”ê\‚\0\0\0\0\0°JOOO\Í”ßOkCÉ\€(U=«õ,∏ ´©é;VUUUπB6Ç*Ûƒç7N˝\◊˝ó\ﬁ\œcN8ΩfCVVV\Á9kü2ÄÑA\0\0\0\0Ëàîîî\Ã˙˙˙≈ûIönRÌñõõ´\Óøˇ~u\Õ5\◊\»˘ßnæeee\È™9\”Í®Ü\Ÿ\Œˆ>Y\0	á \0\0\0\0J©ßæ˝ˆ€Ø\€\⁄\⁄Tàö\'MöÙUp\0A\0\0\0\0 \\\“\”\”rrr\Z7l\ÿ\–z˛¸y´\\kii\È©©©õù\Á®U\Ã	 a\ƒ\0\0\0\0\¬\…\·p§:[uØ^ΩN<xpæRj∑≥5Ç9ÁøçáÆu˛;\”y5c≈äˇ\Í<7≠ëJ8VGê\–\‚\0\0\0\0\0ë\‡p8∫fdd\\o:ˇ<*\Á†\Œv¡\Ÿ\ÍRRR\Ó\‡S–©\ƒ\0\0\0\08\0~\0\0\0\08\0~\0\0\0\0¿9(\0C\0\0\0\0¿9(\0C\0\0\0\0¿9(\0C\0\0\0\0\0\ŒAÄÇ\0\0\0\0\0\ŒAÄÇ\0\0\0\0\0p\n\0¸\0\0\0\0p\n\0Q˚!H£\—h4\ZçF£\—h4ö]ç3q\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 HˇjK\Z>álo\0\0\0\0IENDÆB`Ç','');
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
