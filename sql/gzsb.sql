/*
SQLyog Ultimate v8.32 
MySQL - 5.5.36 : Database - gzsbdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gzsbdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `gzsbdb`;

/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_evt_log` */

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('157502',1,'D:\\Idea\\GzsbOa\\target\\classes\\processes\\leaveProcess.bpmn','157501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1579345579984\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"leaveProcess\" isClosed=\"false\" isExecutable=\"true\" name=\"è¯·å‡æµç¨‹å®šä¹‰\" processType=\"None\">\r\n    <startEvent id=\"_2\" name=\"æµç¨‹å¼€å§‹\"/>\r\n    <userTask activiti:candidateUsers=\"${leaveCandidate.getDivisionManager()}\" activiti:exclusive=\"true\" id=\"_100\" name=\"é¡¹ç›®ç»ç†å®¡æ‰¹\"/>\r\n    <endEvent id=\"_5\" name=\"æµç¨‹ç»“æŸ\"/>\r\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"_13\" name=\"ExclusiveGateway\"/>\r\n    <sequenceFlow id=\"_14\" sourceRef=\"_100\" targetRef=\"_13\"/>\r\n    <userTask activiti:candidateUsers=\"${leaveCandidate.getPersonnelManager()}\" activiti:exclusive=\"true\" id=\"_101\" name=\"äººäº‹å®¡æ‰¹\"/>\r\n    <sequenceFlow id=\"_20\" sourceRef=\"_13\" targetRef=\"_101\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${judge == \'pass\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_21\" sourceRef=\"_13\" targetRef=\"_5\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${judge == \'reject\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"_24\" sourceRef=\"_101\" targetRef=\"_5\"/>\r\n    <sequenceFlow id=\"_8\" sourceRef=\"_2\" targetRef=\"_100\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"leaveProcess\">\r\n      <bpmndi:BPMNShape bpmnElement=\"_2\" id=\"Shape-_2\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"60.0\" y=\"120.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_100\" id=\"Shape-_100\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"370.0\" y=\"120.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"530.0\" y=\"385.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_13\" id=\"Shape-_13\" isMarkerVisible=\"false\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"510.0\" y=\"135.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_101\" id=\"Shape-_101\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"705.0\" y=\"125.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_24\" id=\"BPMNEdge__24\" sourceElement=\"_19\" targetElement=\"_5\">\r\n        <omgdi:waypoint x=\"705.0\" y=\"152.5\"/>\r\n        <omgdi:waypoint x=\"562.0\" y=\"401.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_14\" id=\"BPMNEdge__14\" sourceElement=\"_4\" targetElement=\"_13\">\r\n        <omgdi:waypoint x=\"455.0\" y=\"147.5\"/>\r\n        <omgdi:waypoint x=\"510.0\" y=\"151.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"_2\" targetElement=\"_4\">\r\n        <omgdi:waypoint x=\"92.0\" y=\"136.0\"/>\r\n        <omgdi:waypoint x=\"370.0\" y=\"147.5\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_20\" id=\"BPMNEdge__20\" sourceElement=\"_13\" targetElement=\"_19\">\r\n        <omgdi:waypoint x=\"542.0\" y=\"151.0\"/>\r\n        <omgdi:waypoint x=\"705.0\" y=\"152.5\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_21\" id=\"BPMNEdge__21\" sourceElement=\"_13\" targetElement=\"_5\">\r\n        <omgdi:waypoint x=\"536.0\" y=\"157.0\"/>\r\n        <omgdi:waypoint x=\"536.0\" y=\"388.5100040032032\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('157503',1,'D:\\Idea\\GzsbOa\\target\\classes\\processes\\leaveProcess.leaveProcess.png','157501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0 \0\0«\0\0\08˜óZ\0\0,(IDATxÚíİ\rŒ]e?ğ¦K1†c$†lˆ!\Z³1FcÈ\Zb´Ä¬±šfM§÷9w:eÜ–ÊkEQ„†òÇˆ+İÕÅ$º¨HtÕ¿‹Ò]–wyYhD`é¢Àò\"/-myk¡/Óvîÿ÷ëñ?Ôi;CgîÜ—Ï\'yrgîLgîıÓsïœó<Ï¬Y\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ô”f³yÔ\r7ÜğËU«V½¶råÊ‘³Ï>»944Ôìïïo6¿ğ…/4—/_>|á…>·lÙ²/ª0ƒÇ«#xâ‰gÖ¬YÓ¼å–[š7İt“ö&ÚÍ7ßÜ¼ã;F¢]n¯ eşùıèG[>ÿùÏ7O;í´æ÷¿ÿıæÚµk›ë×¯onß¾½™†‡‡›7nlŞ{ï½Í«¯¾ºyê©§6Ï8ãŒ‘óÎ;ï²,VE •2|Üyç{K;wîÔ¡mÚ´©yÛm·DYiÏ`ZE®8úÖ[oİ|æ™g6W®\\Ù|è¡‡ö‰Z·n]sÕªUÍ%K–4Ï>ûìUh•¼ò!|Lm¹é¦›vÚ³\0˜6yÕãŸşéŸFÎ:ë¬æ<Ğ<¿ÿıï›Ë–-krÊ)/\r\r¥ºÀtËÛ®‡©myK–=€i±uëÖeË—/o^zé¥Í-[¶4§BŞª•?ïôÓOÅ-YÀtËÎ²Ğ €\0ĞòÊG†o|ãÍİ»w7§Úå—_WB^š3gÎª\rÌt\0yí•õÍ\'îı~sİÍÿgoËó9C\0^dxÌÄNwtŞv•W*¦#|ŒúÖ·¾Õ\\¸páÓ*Ìd\0ÙúòsÍ‡oXŞ|ğß¿ü†–Ïå×„z	<LàÑr9à<Ç|LÕmWºëÔSO)Ëò,Uf*€<³îÚ?£íÙu«@è9&ğ0GKå­W9ÛUÎtÕ\n90}```ñ ÀLG~ı÷û\r ù5\'Oz	<;[*×ùÈ©v[é«_ıêpÿjÕf\"€<|ÓŠıüš§“(8vjÓ$W8ÏE[uõcÔ#<Ò,Ër—é€\0â$\ntN\01‡cçTìlÿ–+œOçÀóı\Z\ZÚSÅ[hõI4Ošû ù5\'N\'Qpì4‡cç4YµjÕkßÿş÷›3á›ßüæ¶şşş;m Õ\'ÑÇîZµß\0’_sâtÇNx8vN“•+W¬]»vFÈİwß½;È3¶Ğê“è‹Ï=Ô|øÆşü¯xñ\\~Í‰ÓI;MàáØ9MÎ>ûìæúõëg$€lŞ¼y$ˆéÉ€–ŸD³=yßUvÍçœ4D\'éX% WÆÏ9vN‰ÁÁÁ½ksÌ„áááfh}\0Ù±£ùØİ—ÿùíWñ\\~Í‰ÓIt‚Î‰–µ¹P)@ÇÎ	Ê\00“ Õ\'Ñ(ùè]ßŞïI4¿f0¥“èÃÇH´û«G!„® &ğpìœ\'tÒŒ]‰\r“·`í\r!EQäêè{âã]ÑvDÛÏm‰ç^ŠÇñùsÑŒö‡øü¡h÷æ\0öx¼)¾çÚøø§ñxe<®Šç¾Ëëõúâñäx¾l4\ZŸŠ‡ôõõ½?ûË¹sçiëCDwìh®ìÖæ]Ş~O £-¿\'¿×Õ\'Ñƒ„ÑĞq¾B/x8vN‰/~ñ‹36dãÆ¹áÎ¡¡¡£/^|l†ƒ	ñÜ§34TááìT¡bU´Ta#CÇÍÑş3ÃH†’\'UHÉ°²±\n/[¢ål[;3ÜT!çOÁ§jùùØğóz|ß–x|)ÚñïŸÏŸŒÇßÇçF»\'ÃO´#äü*^ß¿Äã?Ççßöõ?ñıgåÃE­VûäÂ…OˆÏß—á\'>«=Z{=ØUWCœD!|ìyèš\0bÇÎ)qÁìœ©Y°n¸á†3<Öìo|W„ˆDˆøh´yñš\Z >_Š¶\"¾vI„‡Ëâ¹ÆãÏr÷h·D»+»/û¯x|4>ª\n?›âó—ãqk†Ÿøxg<f¸ÉuOÆ?9X†±ñõ?¯ÆÇ/FÛõ‰çÈğíøÚoâ¹;¢İí—ñÜO2üÄã¥ñµ‹ã¹ó£-‹öwñ\\-Ú\'¢}8‚Ğ_-Z´è˜¥K—¾Å^O/D\'rÕã@WCœDD\'2F¿~¾RÑÄSâ¢‹.zz¦ÖY¾|ù†^]dÅŠ‡eø‰pp\\Ôàƒ>AçoãqaŠS2üÄ×.Œ¶2¿<>¿*¾öóøÚ¿Uáçîh¿öp´Ç¢=íù?ñoö†Ÿ¼môÊOu…ç\rá§\nC{ÃO|œW~^‹¶7üÄçâ÷=ÿO´G¢=Ï­çnÇëãñšxîÇÑ¾+¿¯ó¼øÚ™ñùgãó~âñ¯ûúúŞ;şüwZõC•WHßìIôÍ†Ñæ$ê$:kâW8ÜE÷x8vN…eË–}öÔSO‘•Ğ£3±ËJè3~æÍ›÷ö¡¡¡wGúP„š£}&ÂÂ`l“Óâãs\"L\\ÿÛç;ñü¢ı\"¾öïñù­ññšx¼?Úºøøñ*ü¬Ï7Åã+UÙ^]ÕÙ=Şmo£á\'¾6\\}ïkÕ¿İœá\'ÿ_ËŸıßñø»üÑnËğ¯ë_ã¹«£}7Ú7£}5;7ÃO<¯}~<÷7ÇÇsï‰÷y¸-ßùª0ıÌÁ‚ÈDÿŠ§9‰NCøBöÌr%„.\n &ğpìœê²ç¡‡jiøX³fMŞ~µË_Å{KÁÁÁwd0È€°`Á‚gøÉàûÃéÑ¾’\"ƒE|Ï~2pÄãuÑ~A$É˜ğóÇ?ñÜæñÂÏ8W~FÇûŒŞöö§ğSıŒõU z<G­*üüºz\r¿È×”¯-Zµ|ÍÕkÌ÷’ï)ƒ]¼|¯ÂÏ”Ñ›·%¾G\0qmÃğ1ößí™åJ@LàáØ9Î?ÿü__rÉ%-\r K—.Í¿r¯V}Z%Ãn^\rÉNkŞ\Z–WIª«%Ÿ­®œ›·’å-eÕÕ•¼ÊrM^u©®¾¬Í[Ñª«2ç-jÕÕšÍÕ­k{ÃOuUg÷xã}ÆÌô¶s4üä-sÕÕ£ÑğóØ˜ğsw^uÊ«Oy^ŞŠ—W¥ª«SæÕª¼j•·îå-|y5+ÃOŞÚ—W¹òjW7mÃ}kZÍwÍ¾È@œDÛ |ìûï]	¡#ˆ	<;§MÎBuòÉ\'¬[·®%áã7¿ùÍæjFª£UŸ^ƒÿsL‡ÉIªñ1r²€œ4 ÇÏdøÉÉr\\M5¾æ—9Ù@5îfmNBPÇÉq9ÏT“äd¯æäÕ8Ñ+?ãİò¶§ú·³\Z´µš,aS5~è©j2…‡«ñEwåx£w”“/ä$9)Ç%åä9N©\Z¯ÔÈÉrSgÊIr|S¼íÙS]Ç}İØ¶3_›\0â$:Íá#÷éïN`ßŞ÷ûŒ	¡cˆ	<;§Õgœ±üÌ3ÏlnÙ²eZÃÇ¶mÛöDGa8§©Uu˜~9ísÎ€–3¡åtĞ9-tÎ–á\'ÿæÌiÕjß®fTË™Õ~•ÓLçŒkÕÌkV·<åŒlÏæôÔ~ªÛ^¯¦¯o²ƒÑÛŞª™àvVÓbgøÉi®G×øyªZã\'g”»/§×®¦Ù^]Í<÷ƒœ‰î\0d´åúA/€8‰¦‰NZ0‰ğñ‡Yÿ»êùBö÷}®„Ğ‘ÄÈ´;õÔS×ó›ßœÎé#ñ;6f\'Fµ¡ûå‚Ÿ¹öM®“Á\\4×ÆÉÉ\'ª…B—Wkç¬Ê…D«5u~•ŒVkíÜ3ºÆO®Å3\0²·	 N¢U\0É+|/æØ¬Cé»U¨h „Œ\r£íŠƒü\\hë\0¢	 Ó.ï£>ãŒ36¯Zµj:BÈÈyç—†ŸÉ[¾T˜¬„g2Ø8‰:‰î³¿ìœÈ¤ûcCÈÁ¾>ÊíXÌÄÿ…¼b}š\0âØÙÖ!déÒ¥ÿáş¡ùúë¯OÙmW§Ÿ~ú†júLã>€I[¼xñ±û„¼­ëşñn³qúvã7vb\0ÙµïX¨j££\'>B›`øû{ÌÅLüñæÅ-àØ)€Ìx|âsŸûÜÈƒ>xÈÎsÌGŞvåÊğfeĞÈhÎ2–3_èx2\'Ñ}:—jòõCi;vìÈºÓ3v\rŸ½“Ä1>o¯}6õc×ï©ÖZí§y›]5ÑÂ×rÖ¹ÑÜªI>’·êåx¥©š}ß\02¦åD\r?Şç÷Lôö¨ñBÈÎI„}Cˆ1!´2€Œ¶Mã]@v9áŸµpáÂİ\\pÁ®\"“¹-ë¾ûîÛ”cJªYw8I5}ò÷&Ò9®\0r çÚıëSq$g7Ë)sªçœÆzt&·ÏÓh4.ˆvIÎF6º~O5…õ£cyªYÖ®¦œŞ<:ƒ[5‰Á®êªÖxëöìª¾çõjÊë?­Ù“?3\'/ÈßQı®œ9îšjÕ=˜´àQ§¯ÌšÜmQã…É„QnÇb¦ÈŸ®ˆŒ\r\"ˆ\0Ò6ò¯Œ9M^ÅX´hÑÈÊ•+·İ~ûí»7lØ°gxxxoØˆÇ‘7Ç	jóòåË7ä\nçÕ	cµ[®€V@¦>€´ú$šA3§®À Î\'ŸÎ«%ÙY\Z]°4¯¦äÌm9yAu•å–\\;§ºúòß™° ~ÇhpX7É—˜·]í{åcgõüd\\?×92NÛS­+4ú¸{´U3Îíªf¦ÛÛªé·³í¨¦ìÎ«WÛ«Yé^¯‚àkUÛ\ZŸo©f¹{µZ¨õåjæº«Nëæjı¢Õ¬xªP¸¾šÙî¹jºğ?V¡3gº{²ºB–S‰?^Òœıî÷9ÅxµşÑº*PæÌ{TÏæ­–÷Åã½Õ¬|kªvW5c^ÎÖw{µ`ì-Õz9‹ß\r¹€l®£”ûG5»ß/«ÅmQÍ°÷Óœù/×}ÊĞšÓç¬{¹_å<rÑÙjúñœ…ïÛ¹ÏåB¹ÕB´—ä$\Z9‹`îÕÂ´+2Œçì‚ÕÚR¹Pí—âëgW³.Ë…ks\nóøüsy;Tâs1ŞÁœÖ¼š¨£–ëTUõÎËı?g0ÌàŸ‹İæ´çñüGsfÃœÚ=öÍiĞãß| ÿÏä¬‡ùG›jAÜwM`Û?ïdD\0i×=XıÇ~º:h½aşê`“—Ü—Xá@6ı«ï&-˜5ù)r§ú\nÈÅùoráĞ<wæÔÙ9ƒ\\^qÊEóyÆrF¹ìLæU¨ì\\Vë\n½/ßŸÏªú×Ù)ÍĞVuROÌNkv^sºìÌæ¢¥Ù¹Í+XY‡ìôV·ÂT-Ìšâ“«Nòi¹Pkv«™ërıŸs²s]­_”3Ù­È…Q³·×e§<¯,åšAÙYÏÅ]³ó³İUùïäb¯ÙÉÏÛòªNÿUUøqÊjí¡ŸgXÈ+ZâñÚ\\—(CEuuíÆjÆ¼[ª[ın«®‚İY…“»«>I.\"{O5Å÷o«€ú@rr–½‡3ødh­ÂĞªpôX.:›¡©š…ï©*Lı±ZˆöÙ*hå:Jë«…i_ÈÛ«[œ6WWë2´½Tİªørè^¶%Ã^ÕFÃßëUÿjÛhH¬®şí¨Bäpuûc¶]cÂæh\0İ3¶UWGÌ (€\0 € ­ û´`ŸÒª1 >Dg¦ÃøkGÿh,€ \0 È›T]\r˜Ğ¤“!S9–E	™É\0ò†à1ÇÎvŸàC\0@\0@¦Äd&-\'Œ7;ÕT­28ËìWÌ\\\0ÉYë.Şßÿ‹™\n |l@\0˜Ö\02«G§áíÁ“èèØŒ±!a*WB_é)- ã^ñ@\0Ú8€¸¹çN¢ûŞ56\\èöªı}Ÿğc§\0€“¨æ$z@çB®˜uğæû~Ÿõ>pì@\0pÕœD\'äPW,>pì@\0pÕœD[\"Î™%|àØ)€\0à$ª9‰¾	“\rÂ¦áuìpÕœDÉèâ»kp–ç8vj\0N¢š“è8Ø•Ñ1#Âšc\'€“¨æ$:­!d¼õCÀ±Ó±\0\'QÍItÊBÈŞ°qØa‡-Ÿe…s;5ÇN\0\'QÍIt\Zí½âññ·Õëõf„¿W;5ÇN\0\'QÍIt:å•f­Véëë{¯ràØ©9v8‰jN¢ÓíØşşşõz}RàØ©9v8‰jN¢Ó.È+Ñ–©šc\'€“¨æ$:íŠ¢x6š©wqìÔ;œD5\'Ñ–uÑ~¢8vj\0=è–[nqâsm©şşş;\"€Üª šc\'@ºóÎ;÷lÜ¸ÑÉoŠÚ³Ï>ûtœDwÚ³ö¯,ËŸGyP%@4 İzë­_»í¶ÛF^xá\'À)7ß|ó®hÆ7@Q—F\0yZ%@4 GE‡ùÂ8ğ¿–íÚNáãà\"||)ÚK*\0¢	 \0@+È‚hÛUD@\0€i×h4>P–å• “™ÀC\0\0:ÄÒ¥KßÒßßŸÙªA§2‡	<\0€RÅÈààà»T‚N5ÕxlÙ²ÅÆĞ\0Ó¥¿¿8BÈ\'T‚N6Uxüô§?m.Y²¤ùÿñ&ğ\0\0˜eYn©×ë§¨½.‚ø{\"ïŠÿÿ¨\Z\0\0Ó$:\\ë#„\\¬ô²9sæÿ^Šÿw«\0ÀôG¢]¥ô²¢(ˆÿ/¬X±â0Õ\0\0˜Ş\0rW´U‚^U¯×ÿ¹,Ëñÿà/U\0`šEÇëš¢(îW	z4€ÿ]´=µZí“ª\0Ğ>.‹Ø“*A¯É…8cßßÿ.T\r\0€©×ëçF\'l³JĞKjµÚ[c¿ß\Záã&Õ\0\0h¡2D\'l›JĞK\"|ü!Ú3*\0ĞbÇçm(*A¯ˆÀı³Øç·¾C5\0\0ZlîÜ¹GFg¬©ô‚Ø×—•e¹§^¯T5\0\0f®S6²hÑ¢cT‚n¶páÂrÆ«h_R\r\0€™\r ÃõzıD• [Í›7ïí9Ö)§V\r\0€™ 9Ğ• ‹÷ñ§£=®\0\0íÑ9ÛĞh4.R	ºtÿ¾.ÚkCCCG©\0@(ËòÑhWª]>ÎÏYŞjµÚ‡T\0 ME±6ÿJ¬tY°ş›tŸS\r\0€6´ÕBîU	ºÅüùóßûõhW©\0@›)Ëò»ÑĞ¥[Ìà±>ÚÃJ\0Ğ†\ZÆÑYÛ¨tƒØ—ïˆöÊÒ¥Kß¢\Z\0\0m¨^¯Ÿ”³©®(ŠoDÛ500ğWª\0Ğ¦Ê²üHvÚT‚ÒŸ‰}9W:o¨\0@|GtÚš*A§Š\0}\\ìÃÃÑV©\0@È\02oŞ¼·«¦V«ûïæh÷¨\0@ç].<A%è4eYŞWÅ¦\"ª\0Ğ!¢÷z„A• “4\ZË#€¾K5\0\0:H„MÑ–«\"‚ÇÂt!äoU\0 ó:sEq…JĞ	b_}_Ş6ûíÅª\0Ğ™º{£3w­JĞîrÁ¯F»M5\0\0:Ttæ®‹¶F%è€°¼.öÕçãÃÙª\0Ğ¡Ê²¼2Ú£*A›ï§WG\0Ù1şüwª\0@k4\Zõ÷÷oP	Ú8|œûè|\\5\0\0:\\QK¢s·U%hGÇÇş¹;‚òyª\0Ğêõú‰ÑÁV	ÚÍĞĞĞQ±o¾mµj\0\0t‰E‹¼• İÄ~ù?ÑT	\0€îëè5çÎ{¤JĞ.êõú¯b¿|½V«½M5\0\0º/€ìÎ{íU‚6	çä ó¢(>¬\Z\0\0](:zÛÊ Ì´Ø\r?V…3U\0 KE‡os½^?W%˜áğqtì‹Û#|üD5\0\0º;€<¾ËT‚4;öÃç¢=¢\0\0]®,ËßE»F%˜Á|Kìƒ[jµÚ[U\0 ËEqSt\0ïR	f(\05\'Bèëë{¿j\0\0ô€èüıÈ­/ÌĞ¾÷ét^¯×OR\r\0€Şé~=Úó*A+-^¼øØØïv–eù]Õ\0\0è!Ñ<-Ú«*A«¬X±â°‹¢¸_5\0\0zL­Vûdş%Z%h•ØßÖD{1ö½ÃU\0 ÇEq\\tGT‚V(Ëò[±¿\r\r\r½[5\0\0zS®ÁĞœ3gÎJÁt\Z(\"€ì‰ımj\0\0ô°œ‰È4¨L§¢(ŞûÙ®x\\©\Z\0\0ÈöF£1_%˜yu­,Ë—c?ûOÕ\0\0 ïË)ÚÙ*Á4Ü£mÈÙ¯T\0€ì >ƒƒU‚i·Wæ,k‹-:F5\0\0\r Eñ3•`*Å>µ$ÇåTÏª\0ÀØâ­eYŞ®La¨ı`´İÑV¨\0\0ûŸDGña•`*Ì;÷ÈØŸ¶F»A5\0\0/€¬Œö¬J0Ê²|4Ú3*\0À¸úûû—E{E%˜‚ğñóØ—¶Í›7ïíª\0À¸êõú¼è4îP	1|œ•+Gûˆj\0\0°_}}}ïÍÙŠT‚7káÂ…\'TáÃz2\0\0X.¤i¡8ŞŒ¼İª(Šm±ıB5\0\0˜¼’WBT‚7±ï<í1•\0\0`2È9D%˜Œ¢(®}çµœzW5\0\0˜L\0y%gÃR	&±Ï,¯ü j\0\00)¹H®¢LpùDŞ¶ídÕ\0\0àÍt(×åŠè*ÁÁ,Z´è˜;£ı@5\0\0xS¢3yG[U‚ƒ˜ûÉ†h)\0\0oZµ‚õƒ*ÁA‚ê>^3gÎª\0À›ÊKs:U•`\ZÆ%±Ÿì2]3\0\0‡,ÂÇ—¢½¤ì\'|Ì¯V:/U\0€© ¢mW	öUÅq±oGû¶j\0\00%\ZÆò/Ü*ÁXµZíğ/FY«\Z\0\0L™¥K—¾%:šÍøp¶j0*ö‰ßFÛ´bÅŠÃT\0€)UÅÈààà»T‚jøNŞzµxñâcU\0€)—Í\\áZ%ˆ}a0oÉ«×ëóT\0€iÎ-Ñá<E%z[„Ğ÷E\0Ùíkª\0À´‰çú!«DïªÕjo}àÕ!·ª\0\0Ó@‰v•Jôô>ğßÑ›e2\0\0ZĞù¼+Ú*Ñ³ÛÿÇEQì(ËòhÕ\0\0`ÚEÇóšè€Ş¯=>N–ƒÎOT\r\0\0Z\"ÂÇeÑ	}R%z.|üu:ğq®j\0\0Ğ2Ùèf•èCCCGEğ|½,ËkU\0€–ŠNhÑm*ÑSÛüÉl*\0@Ë\rŸ·â¨DÏ„kóêG­V{›j\0\0ĞrsçÎ=2HS%º_lç¯ä óÿ¡\Z\0\0ÌdÇtdÑ¢EÇ¨D÷Ê™®ªğqºj\0\00ÓdØT¬İ+×øˆm¼=×üP\r\0\0Ú!€l-Šb‰Jt¥Ù¹Êy®v®\0\0´K\0ÙĞh4.R‰îÁòÖ²,_­ÕjoU\r\0\0ÚBtPv¥Jt]°üZÎp!ä}ª\0@ÛˆêÚè¨^§İ£^¯Ï‹P¹\'OR\r\0\0ÚJ„ÕBîU‰î°xñâcsbØ¦ßQ\r\0\0ÚNY–ßö¸Jt¾+VácS´ßª\0\0m©Ñh\\Ö*ÑùªÛé^¬Õj‡«\0\0m)Ç	D§õ5•èl±\r¿]İzuœj\0\0Ğ¶Ê²üHtZw©DGoÃ´§ÑhÌW\r\0\0ÚÚààà;úûû›*Ñ™úúúŞ›2ÂÇ%ª\0@GÈ\02oŞ¼·«Dg™3gÎ>^íw§j\0\0ĞId×Â…OP‰Îáã¡hâÃÙª\0@\'ud_2¨\Zmç¢E‹Q\r\0\0:­3›kG,W‰Ù^\'GÛÁñª\0@ÇÉ…£3{…JtDøø`´İ¹~‹j\0\0Ğ‘\"|Ü!äZ•hosçÎ=2ÂÇÖØ^×«\0\0+:µ×E[£m¿‹ö´J\0\0ĞÑÊ²¼2Ú£*ÑÖáãÑ¶™.\0€×h4.ŠÎí•hOõzı¹Òy®Z¯\Z\0\0t¼¢(–äØ•h?:2|dQ\r\0\0ºBtnOŒ\02¬í%o·ÊÛ®\"€ü\\5\0\0è\Z¹˜]ttGT¢½Ä6ù£±9\0\0tkg·™Ó¼ªDÛlò¶8Û\0€níğî8^%f^.2˜Û#T\r\0\0ºRQ9Ö T‰™U«Õ>ÁcON \Z\0\0t­èôn®×ëçªÄÌ©ÆâìÌuYT\0€n OEq™JÌŒ+V–k±D{P5\0\0èzeYş.Ú5*1cğ?£ş/Ï™3çÕ\0\0 ëEqSt‚ïR‰©ıÊ¨ı®x|j\0\0Ğ¢ü£h¨DËë¾ W:(T\0€^ê=Úó*Ñ:CCCïÎè‹¢¸T5\0\0è)eYíU•hZ­vx„£­Q\r\0\0z±CœëOìT‰Ö(Šâş¨÷ÆœıJ5\0\0èÅñqÑ!Q‰–ÔúŠ¼õjñâÅÇª\0\0½jvtŠ›¦^õzı¤\\é<Ú§U\0€–ã¾¾¾÷«ÄôÈÚFw—eùUÕ\0\0@\0éïßŞh4æ«ÄÔ«Õjoà±%j|‹j\0\0À¬½3a½íl•˜–p÷H´çâÃÙª\0\0ÿÛI~:È·TbjEñ“¼ºµ=Z5\0\0àÿ£³ü3•˜Òšck\"||L5\0\0`Œ·FGùv•˜²ğñ×ÕŒW_Q\r\0\0øó\0’·\n=¬‡®V«½-jùz½^ÿ•j\0\0Àøde´gUâĞEøx2jù„J\0\0Àş;ÍË¢½¢‡\\ÇÕÑ^\Z\Z:J5\0\0`?êõú¼è8ïP‰Cªá¹¹ØàÀÀÀñª\0\0Ğ××÷Ş4­oÎ‚>^Íxušj\0\0ÀA¬X±â°è@7óQ5&\'×ø(ŠbG<^­\Z\0\00Aùü¼¢“2;êö|uJ\0\0“ ;r,ˆJLªf¿öêÒ¥Kß¢\Z\0\00¹Îô+9–JLLY–G½vEñ>Õ\0\0€IÊu@r=•8¸¼R$W:T\r\0\0xsd]®ˆ®688ø®ÃFãrÕ\0\0€7©¿¿ÿ ·ªÄşå,aQ£M@îS\r\0\08Ñ©şy„Uâ€5úMÔhs­V;\\5\0\0àEqit®ŸV‰ñEmVE:§\Z\0\0pèì/E{I%Æ­M#×ëõÏ¨\0\0LM\'{A´í*ñF¹8cQ9İî7T\0\0¦H£Ñø@ş•_%ş¿\\`°ZåÕ\0\0€©ïl7ãÃÙªñ¿Š¢ø¯¨Éz5\0€éépä:*±wÆ«FøØ1şüwª\0\0Lƒj–§Oåç¢{âñoì\0\00}ï-õzı”^®A­VûP„İÑ–Û#\0\0`\Zåx‡!÷êûŸ;wî‘Qƒ×¢]go\0\0€é D»ª‡ßÿãc\0€ÖuÀïŠvc/¾÷z½ş¯EQl›7oŞÛí	\0\0ĞeY^ğû{ğ}Ÿk ,\\¸ğ{\0\0´H„ËúûûŸì¥÷\\¯×?šá#ÚYö\0\0\0hmgüÜ ›{åı¾#Şïö^?³õ\0 ÅÊã zèı>ä¶<\0\0Ì€ãs\rŒ^x¯9Ø>ÚÖœz×–\0€P­ƒÑìğ±\"ƒV£Ñø€­\0\03Û9Y´hÑ1İúşjµÚ\'ã=î‰öw¶6\0\0Ì|\0®×ë\'vé{ûË²,wÆûûg[\Z\0\0Ú£“¾µ(Š%İö¾V¬XqX¼·â½=`+\0@û\rFã¢.|_w•eùÒœ9s°•\0 MD\'ıÑhWvÓ{ª×ëÿdWQï±…\0 D\'}mtÖ¯ë–÷ïeA®tï«fë\0@ûuØWGgıŞnx/CCCïÎ+@¾eË\0@ŠÎúw£=Şéï#ÇzDøx)Ú\Z[\0\0ÚT£Ñ¸ :í» Hı®(Š9û•­\n\0\0mª^¯ŸäµN~ñú¿mg®ûa‹\0@+Ëò#EQìêà×ÿÙ\\é¼Ñh|ÊÖ\0€6788øèÀ7;ñµ÷õõ½?^ûîn\\Ç\0\0ºVyóæ½½“^s­V{kQ[âµßl\0@g].<¡“^s„ßG{6>œm\0@guæ_2Ø)¯·ÑhüK¼Şíyû˜­\0\0&:ó›¢-ï°tf:/Ëòc¶\0\0t \\ˆ0:öWt@øøp†z½~­\0\0*:ö÷F¹¶_c­V{[„mÑ~i‹\0@‹NıuÑÖ´ùk|*ÚÿØZ\0\0ĞáÊ²¼2Ú£íúúêõú¿åjíCCCGÙZ\0\0Ğár!¿èàohÓ×v^.6800p¼-\0\0] (Š%ÑÉßÚn¯kÁ‚¯Ÿb+\0@—ˆş‰ÑÑn§×4şüwÆkÚíG¶\0\0t‘E‹ı‘6zI³ãõ¬/Šb­\0\0](:üÍ¹sçÙ&¯å¶h¯,]ºô-¶\0\0tg\0i‹Şñ:¾mW¼–¿²U\0\0 KE±­3ù\Z\ZÆßÆKØm¡-\0\0]¬¿¿s½^?w¦~ÿààà»\"xGºÌÖ\0\0€î OÎTç¿V«ácsüş{m	\0\0è\0~íš\n?÷d\0É bK\0\0@(Šâ¦wÍÀï½,× É[°l\0\0è¹à_´GZù;s°y:ÏÁç¶\0\0\0ôV\0ÉéoŸoÕïËivsºİü½ª\0\0=¦,ËÓ¢½ÚŠß•æBƒñûnWy\0\0èAµZí“\nv¶âwÅïy8Úúøp¶Ê\0@*Šâ¸#-WEÛ1şüwª:\0\0ô®ÙšsæÌ9bº~A½^?%~Ç|\\¹\0 Çe8ˆvBY–)ŠbI´•CCCGMÅÏ®ÕjŠŸ½;Úù*\r\0\0=&ÂÅ…Ì™¯¢m­f¤jîÓ¶NÅïÊ?ëµ6ÿ®ò\0\0Ğƒ\ZÆ§Æ	ohSµ2züœÇãç=¥ê\0\0ĞÃ\"¬>P\0)Šâ=Sğ;~m[­V{›Š\0@+ËòèjÜÇxáã‰‰şœøŞësÜÈ8áãKùóãëVm\0\0 ÃÃ¥ãz½~ÎDF‰Ÿ3ƒ£ÏÅ¿ÿhn–©2\0\006@lØwğùD§ã ñ™1ÿn$gÎ\Z|G|¼=ÚOU\0\0xƒ¼}*ÃÃ˜ ñ½‰şÛF£qù8ƒ×‡ãñ1•\0\0Æ5v@údÖşˆï_³ŸAì[§b;\0\0Ğ…2t”e™c6F&\\6`&­í9İ¯ê\0\0³rœG®LíÎõz}÷>\"?1¯rä­Vû^©fÑj¤=–ß§Ú\0\0Ğ£úúúŞÁà¶ÃcÇvä”ºëF§ÜÍY¯°†Èïs€ºj\0@Ê+¹fGæd‚Ç~Úš\"ÿwŸĞ‘³`İ?Şš \0\0@Y°`ÁÇ#lß7HœvÚiÍ+®¸¢¹víÚæsÏ=×Ü¾}{3åãÆ›¿ıío›?üá›guÖxW9FÆ||¥[­\0\0€\\lpÉÀÀÀV<ÿò—¿¼7\\ìŞ½»9Q<ğ@ó¼óÎïjÈåª\0\0ì\rco¹Š Ò\\½zõ¤‚Ç¾®¿şúæI\'´ïÕU\0\0zXŞvácdìíV>úhs*<õÔSÍ3Î8cl1è\0\0zT8;æ#ÃGé˜JùóÎ<óÌ±WA¶MfC\0\0 KälWco»šª+ã]	‰Ğ1öJÈ=ª\0\0=$×ù;î#Ç|L§2v<HŞúe+\0\0@ÈEÇÎv5<<Üœn_ùÊWÆŞŠµÎV\0\0€c?Æ®pSí¶ÂC=ô†Ó­	\0\0= §Ã;ğüP¦Û¬±‹F²6\0\0t»èüß9\Z¾÷½ï5[éê«¯;d­\0\0İ@6†€µk×¶4€äí^cnÃzÙÖ\0\0€.ÿ?ÿX¿~}KH®2æ\nÈn[\0\0ºÜØép·oßŞÒ\0’¿oìï·5\0\0 ‡ÈL@\0\0 Gˆ+ \0\0À´2\0\0h³`\0\0­ Ö\0\0Z£,Ë‹gj%ôÏşóVB\0€^2gÎœ#rüÅhÈÛ¢Zá¡‡\Z{ûÕhGÛ\Z\0\0Ğ\"Ü3\Z¾üå/·ä*Èyç÷§\0RÅ:[\0\0zD__ßû#ŒŒ‚Õ«WOkø¸şúëß0ıî‚>n+\0\0@;}`` ùè£NKøxê©§š\'tÒØ\0rê\0@\Z\Z:ª(Šmc¤ç:S½îÇgœ1öÖ«mù{U\0\0zP½^ÿÌØ[±2„LÕ•¼ò16|äïÉß§ê\0\0ĞÛ!äœ±!$oÇÊ1!‡20=Ç|ìsÛU^ı¸Pµ\0€?!£³c=ğÀ“jwùòåoùs…\0\0`ßò™±cBÆŞ–•+¦ß{ï½Íõë×7·oß¾7läcñÈ’+œ]dpì˜·]\0\0ãÊâcgÇ:Ävç\0\0ÀAå:!EQÜ?vÅô‰´\\á<l4\ZŸRE\0\0`RæÌ™sD„Š‹««\"›âãá}G´—ãã5:.V5\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ßÿŠ’n\ZÂİ‚\0\0\0\0IEND®B`‚',1),('157508',1,'hist.var-leaveCandidate',NULL,'¬í\0sr\0.com.gzsb.root.gzsbroot.Activiti.LeaveCandidateDd¿C\n¢m¶\0L\0divisionManagert\0Ljava/util/List;L\0personnelManagerq\0~\0xpsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0Ponyt\0kunkunxsq\0~\0\0\0\0w\0\0\0t\0giaox',NULL),('160004',1,'hist.var-leaveCandidate',NULL,'¬í\0sr\0.com.gzsb.root.gzsbroot.Activiti.LeaveCandidateDd¿C\n¢m¶\0L\0divisionManagert\0Ljava/util/List;L\0personnelManagerq\0~\0xpsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0Ponyt\0kunkunxsq\0~\0\0\0\0w\0\0\0t\0giaox',NULL),('167504',1,'hist.var-leaveCandidate',NULL,'¬í\0sr\0.com.gzsb.root.gzsbroot.Activiti.LeaveCandidateDd¿C\n¢m¶\0L\0divisionManagert\0Ljava/util/List;L\0personnelManagerq\0~\0xpsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0Ponyt\0kunkunxsq\0~\0\0\0\0w\0\0\0t\0giaox',NULL),('170004',1,'hist.var-leaveCandidate',NULL,'¬í\0sr\0.com.gzsb.root.gzsbroot.Activiti.LeaveCandidateDd¿C\n¢m¶\0L\0divisionManagert\0Ljava/util/List;L\0personnelManagerq\0~\0xpsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0Ponyt\0kunkunxsq\0~\0\0\0\0w\0\0\0t\0giaox',NULL),('172504',1,'hist.var-leaveCandidate',NULL,'¬í\0sr\0.com.gzsb.root.gzsbroot.Activiti.LeaveCandidateDd¿C\n¢m¶\0L\0divisionManagert\0Ljava/util/List;L\0personnelManagerq\0~\0xpsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0Ponyt\0kunkunxsq\0~\0\0\0\0w\0\0\0t\0giaox',NULL),('180002',1,'var-leaveCandidate',NULL,'¬í\0sr\0.com.gzsb.root.gzsbroot.Activiti.LeaveCandidateDd¿C\n¢m¶\0L\0divisionManagert\0Ljava/util/List;L\0personnelManagerq\0~\0xpsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0Ponyt\0kunkunxsq\0~\0\0\0\0w\0\0\0t\0giaox',NULL),('180004',1,'hist.var-leaveCandidate',NULL,'¬í\0sr\0.com.gzsb.root.gzsbroot.Activiti.LeaveCandidateDd¿C\n¢m¶\0L\0divisionManagert\0Ljava/util/List;L\0personnelManagerq\0~\0xpsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0Ponyt\0kunkunxsq\0~\0\0\0\0w\0\0\0t\0giaox',NULL),('182502',1,'var-leaveCandidate',NULL,'¬í\0sr\0.com.gzsb.root.gzsbroot.Activiti.LeaveCandidateDd¿C\n¢m¶\0L\0divisionManagert\0Ljava/util/List;L\0personnelManagerq\0~\0xpsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0Ponyt\0kunkunxsq\0~\0\0\0\0w\0\0\0t\0giaox',NULL),('182504',1,'hist.var-leaveCandidate',NULL,'¬í\0sr\0.com.gzsb.root.gzsbroot.Activiti.LeaveCandidateDd¿C\n¢m¶\0L\0divisionManagert\0Ljava/util/List;L\0personnelManagerq\0~\0xpsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0Ponyt\0kunkunxsq\0~\0\0\0\0w\0\0\0t\0giaox',NULL),('185002',1,'var-leaveCandidate',NULL,'¬í\0sr\0.com.gzsb.root.gzsbroot.Activiti.LeaveCandidateDd¿C\n¢m¶\0L\0divisionManagert\0Ljava/util/List;L\0personnelManagerq\0~\0xpsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0Ponyt\0kunkunxsq\0~\0\0\0\0w\0\0\0t\0giaox',NULL),('185004',1,'hist.var-leaveCandidate',NULL,'¬í\0sr\0.com.gzsb.root.gzsbroot.Activiti.LeaveCandidateDd¿C\n¢m¶\0L\0divisionManagert\0Ljava/util/List;L\0personnelManagerq\0~\0xpsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0Ponyt\0kunkunxsq\0~\0\0\0\0w\0\0\0t\0giaox',NULL),('187504',1,'hist.var-leaveCandidate',NULL,'¬í\0sr\0.com.gzsb.root.gzsbroot.Activiti.LeaveCandidateDd¿C\n¢m¶\0L\0divisionManagert\0Ljava/util/List;L\0personnelManagerq\0~\0xpsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0Ponyt\0kunkunxsq\0~\0\0\0\0w\0\0\0t\0giaox',NULL),('190004',1,'hist.var-leaveCandidate',NULL,'¬í\0sr\0.com.gzsb.root.gzsbroot.Activiti.LeaveCandidateDd¿C\n¢m¶\0L\0divisionManagert\0Ljava/util/List;L\0personnelManagerq\0~\0xpsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0Ponyt\0kunkunxsq\0~\0\0\0\0w\0\0\0t\0giaox',NULL),('192502',1,'var-leaveCandidate',NULL,'¬í\0sr\0.com.gzsb.root.gzsbroot.Activiti.LeaveCandidateDd¿C\n¢m¶\0L\0divisionManagert\0Ljava/util/List;L\0personnelManagerq\0~\0xpsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0Ponyt\0kunkunxsq\0~\0\0\0\0w\0\0\0t\0giaox',NULL),('192504',1,'hist.var-leaveCandidate',NULL,'¬í\0sr\0.com.gzsb.root.gzsbroot.Activiti.LeaveCandidateDd¿C\n¢m¶\0L\0divisionManagert\0Ljava/util/List;L\0personnelManagerq\0~\0xpsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0Ponyt\0kunkunxsq\0~\0\0\0\0w\0\0\0t\0giaox',NULL),('195002',1,'var-leaveCandidate',NULL,'¬í\0sr\0.com.gzsb.root.gzsbroot.Activiti.LeaveCandidateDd¿C\n¢m¶\0L\0divisionManagert\0Ljava/util/List;L\0personnelManagerq\0~\0xpsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0Ponyt\0kunkunxsq\0~\0\0\0\0w\0\0\0t\0giaox',NULL),('195004',1,'hist.var-leaveCandidate',NULL,'¬í\0sr\0.com.gzsb.root.gzsbroot.Activiti.LeaveCandidateDd¿C\n¢m¶\0L\0divisionManagert\0Ljava/util/List;L\0personnelManagerq\0~\0xpsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0Ponyt\0kunkunxsq\0~\0\0\0\0w\0\0\0t\0giaox',NULL),('197504',1,'hist.var-leaveCandidate',NULL,'¬í\0sr\0.com.gzsb.root.gzsbroot.Activiti.LeaveCandidateDd¿C\n¢m¶\0L\0divisionManagert\0Ljava/util/List;L\0personnelManagerq\0~\0xpsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0Ponyt\0kunkunxsq\0~\0\0\0\0w\0\0\0t\0giaox',NULL),('210002',1,'var-leaveCandidate',NULL,'¬í\0sr\0.com.gzsb.root.gzsbroot.Activiti.LeaveCandidateDd¿C\n¢m¶\0L\0divisionManagert\0Ljava/util/List;L\0personnelManagerq\0~\0xpsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0Ponyt\0kunkunxsq\0~\0\0\0\0w\0\0\0t\0giaox',NULL),('210004',1,'hist.var-leaveCandidate',NULL,'¬í\0sr\0.com.gzsb.root.gzsbroot.Activiti.LeaveCandidateDd¿C\n¢m¶\0L\0divisionManagert\0Ljava/util/List;L\0personnelManagerq\0~\0xpsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0Ponyt\0kunkunxsq\0~\0\0\0\0w\0\0\0t\0giaox',NULL);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('cfg.execution-related-entities-count','false',1),('next.dbid','217501',88),('schema.history','create(6.0.0.4)',1),('schema.version','6.0.0.4',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('157510','leaveProcess:1:157504','157505','157509','_2',NULL,NULL,'æµç¨‹å¼€å§‹','startEvent',NULL,'2020-01-21 12:44:40','2020-01-21 12:44:40',3,NULL,''),('157511','leaveProcess:1:157504','157505','157509','_100','157512',NULL,'é¡¹ç›®ç»ç†å®¡æ‰¹','userTask','kunkun','2020-01-21 12:44:40','2020-01-21 13:03:13',1113952,NULL,''),('160006','leaveProcess:1:157504','160001','160005','_2',NULL,NULL,'æµç¨‹å¼€å§‹','startEvent',NULL,'2020-01-21 12:51:03','2020-01-21 12:51:03',4,NULL,''),('160007','leaveProcess:1:157504','160001','160005','_100','160008',NULL,'é¡¹ç›®ç»ç†å®¡æ‰¹','userTask','kunkun','2020-01-21 12:51:03','2020-01-21 13:03:14',731190,NULL,''),('162502','leaveProcess:1:157504','157505','157509','_13',NULL,NULL,'ExclusiveGateway','exclusiveGateway',NULL,'2020-01-21 13:03:13','2020-01-21 13:03:14',98,NULL,''),('162503','leaveProcess:1:157504','157505','157509','_101','162504',NULL,'äººäº‹å®¡æ‰¹','userTask','giao','2020-01-21 13:03:14','2020-01-21 13:08:22',308746,NULL,''),('162508','leaveProcess:1:157504','160001','160005','_13',NULL,NULL,'ExclusiveGateway','exclusiveGateway',NULL,'2020-01-21 13:03:14','2020-01-21 13:03:14',0,NULL,''),('162509','leaveProcess:1:157504','160001','160005','_101','162510',NULL,'äººäº‹å®¡æ‰¹','userTask','giao','2020-01-21 13:03:14','2020-01-21 13:08:22',308892,NULL,''),('165001','leaveProcess:1:157504','157505','157509','_5',NULL,NULL,'æµç¨‹ç»“æŸ','endEvent',NULL,'2020-01-21 13:08:22','2020-01-21 13:08:22',0,NULL,''),('165002','leaveProcess:1:157504','160001','160005','_5',NULL,NULL,'æµç¨‹ç»“æŸ','endEvent',NULL,'2020-01-21 13:08:22','2020-01-21 13:08:22',0,NULL,''),('167506','leaveProcess:1:157504','167501','167505','_2',NULL,NULL,'æµç¨‹å¼€å§‹','startEvent',NULL,'2020-01-21 13:17:27','2020-01-21 13:17:27',4,NULL,''),('167507','leaveProcess:1:157504','167501','167505','_100','167508',NULL,'é¡¹ç›®ç»ç†å®¡æ‰¹','userTask','kunkun','2020-01-21 13:17:27','2020-01-25 10:24:31',335224980,NULL,''),('170006','leaveProcess:1:157504','170001','170005','_2',NULL,NULL,'æµç¨‹å¼€å§‹','startEvent',NULL,'2020-01-21 13:22:52','2020-01-21 13:22:52',4,NULL,''),('170007','leaveProcess:1:157504','170001','170005','_100','170008',NULL,'é¡¹ç›®ç»ç†å®¡æ‰¹','userTask','kunkun','2020-01-21 13:22:52','2020-01-25 10:28:29',335137366,NULL,''),('172506','leaveProcess:1:157504','172501','172505','_2',NULL,NULL,'æµç¨‹å¼€å§‹','startEvent',NULL,'2020-01-21 13:24:46','2020-01-21 13:24:46',3,NULL,''),('172507','leaveProcess:1:157504','172501','172505','_100','172508',NULL,'é¡¹ç›®ç»ç†å®¡æ‰¹','userTask','kunkun','2020-01-21 13:24:46','2020-01-28 12:43:35',602329790,NULL,''),('180006','leaveProcess:1:157504','180001','180005','_2',NULL,NULL,'æµç¨‹å¼€å§‹','startEvent',NULL,'2020-01-21 14:28:54','2020-01-21 14:28:54',3,NULL,''),('180007','leaveProcess:1:157504','180001','180005','_100','180008',NULL,'é¡¹ç›®ç»ç†å®¡æ‰¹','userTask','Pony','2020-01-21 14:28:54','2020-01-28 18:16:52',618478088,NULL,''),('182506','leaveProcess:1:157504','182501','182505','_2',NULL,NULL,'æµç¨‹å¼€å§‹','startEvent',NULL,'2020-01-21 14:30:56','2020-01-21 14:30:56',3,NULL,''),('182507','leaveProcess:1:157504','182501','182505','_100','182508',NULL,'é¡¹ç›®ç»ç†å®¡æ‰¹','userTask','Pony','2020-01-21 14:30:56','2020-01-28 17:58:06',617230319,NULL,''),('185006','leaveProcess:1:157504','185001','185005','_2',NULL,NULL,'æµç¨‹å¼€å§‹','startEvent',NULL,'2020-01-21 14:31:25','2020-01-21 14:31:25',4,NULL,''),('185007','leaveProcess:1:157504','185001','185005','_100','185008',NULL,'é¡¹ç›®ç»ç†å®¡æ‰¹','userTask',NULL,'2020-01-21 14:31:25',NULL,NULL,NULL,''),('187506','leaveProcess:1:157504','187501','187505','_2',NULL,NULL,'æµç¨‹å¼€å§‹','startEvent',NULL,'2020-01-21 14:32:13','2020-01-21 14:32:13',4,NULL,''),('187507','leaveProcess:1:157504','187501','187505','_100','187508',NULL,'é¡¹ç›®ç»ç†å®¡æ‰¹','userTask','kunkun','2020-01-21 14:32:13','2020-01-25 10:40:34',331701181,NULL,''),('190006','leaveProcess:1:157504','190001','190005','_2',NULL,NULL,'æµç¨‹å¼€å§‹','startEvent',NULL,'2020-01-21 14:32:41','2020-01-21 14:32:41',3,NULL,''),('190007','leaveProcess:1:157504','190001','190005','_100','190008',NULL,'é¡¹ç›®ç»ç†å®¡æ‰¹','userTask','kunkun','2020-01-21 14:32:41','2020-01-25 10:43:04',331823097,NULL,''),('192506','leaveProcess:1:157504','192501','192505','_2',NULL,NULL,'æµç¨‹å¼€å§‹','startEvent',NULL,'2020-01-21 14:33:20','2020-01-21 14:33:20',4,NULL,''),('192507','leaveProcess:1:157504','192501','192505','_100','192508',NULL,'é¡¹ç›®ç»ç†å®¡æ‰¹','userTask','kunkun','2020-01-21 14:33:20','2020-01-28 18:00:07',617207861,NULL,''),('195006','leaveProcess:1:157504','195001','195005','_2',NULL,NULL,'æµç¨‹å¼€å§‹','startEvent',NULL,'2020-01-21 14:34:08','2020-01-21 14:34:08',3,NULL,''),('195007','leaveProcess:1:157504','195001','195005','_100','195008',NULL,'é¡¹ç›®ç»ç†å®¡æ‰¹','userTask','kunkun','2020-01-21 14:34:08','2020-01-28 18:00:09',617161682,NULL,''),('197506','leaveProcess:1:157504','197501','197505','_2',NULL,NULL,'æµç¨‹å¼€å§‹','startEvent',NULL,'2020-01-21 15:10:01','2020-01-21 15:10:01',1,NULL,''),('197507','leaveProcess:1:157504','197501','197505','_100','197508',NULL,'é¡¹ç›®ç»ç†å®¡æ‰¹','userTask','Pony','2020-01-21 15:10:01','2020-01-28 18:03:05',615184848,NULL,''),('200002','leaveProcess:1:157504','167501','167505','_13',NULL,NULL,'ExclusiveGateway','exclusiveGateway',NULL,'2020-01-25 10:24:31','2020-01-25 10:24:32',18,NULL,''),('200003','leaveProcess:1:157504','167501','167505','_101','200004',NULL,'äººäº‹å®¡æ‰¹','userTask','giao','2020-01-25 10:24:32','2020-01-28 13:19:08',269676145,NULL,''),('200008','leaveProcess:1:157504','170001','170005','_13',NULL,NULL,'ExclusiveGateway','exclusiveGateway',NULL,'2020-01-25 10:28:29','2020-01-25 10:28:29',0,NULL,''),('200009','leaveProcess:1:157504','170001','170005','_5',NULL,NULL,'æµç¨‹ç»“æŸ','endEvent',NULL,'2020-01-25 10:28:29','2020-01-25 10:28:29',0,NULL,''),('205002','leaveProcess:1:157504','187501','187505','_13',NULL,NULL,'ExclusiveGateway','exclusiveGateway',NULL,'2020-01-25 10:40:34','2020-01-25 10:40:34',21,NULL,''),('205003','leaveProcess:1:157504','187501','187505','_101','205004',NULL,'äººäº‹å®¡æ‰¹','userTask','giao','2020-01-25 10:40:34','2020-01-28 13:19:15',268721922,NULL,''),('207502','leaveProcess:1:157504','190001','190005','_13',NULL,NULL,'ExclusiveGateway','exclusiveGateway',NULL,'2020-01-25 10:43:04','2020-01-25 10:43:04',29,NULL,''),('207503','leaveProcess:1:157504','190001','190005','_101','207504',NULL,'äººäº‹å®¡æ‰¹','userTask','giao','2020-01-25 10:43:04','2020-01-28 13:19:20',268576298,NULL,''),('210006','leaveProcess:1:157504','210001','210005','_2',NULL,NULL,'æµç¨‹å¼€å§‹','startEvent',NULL,'2020-01-28 12:43:19','2020-01-28 12:43:19',2,NULL,''),('210007','leaveProcess:1:157504','210001','210005','_100','210008',NULL,'é¡¹ç›®ç»ç†å®¡æ‰¹','userTask','Pony','2020-01-28 12:43:19','2020-01-28 17:58:20',18901577,NULL,''),('210014','leaveProcess:1:157504','172501','172505','_13',NULL,NULL,'ExclusiveGateway','exclusiveGateway',NULL,'2020-01-28 12:43:35','2020-01-28 12:43:35',7,NULL,''),('210015','leaveProcess:1:157504','172501','172505','_5',NULL,NULL,'æµç¨‹ç»“æŸ','endEvent',NULL,'2020-01-28 12:43:35','2020-01-28 12:43:35',0,NULL,''),('212506','leaveProcess:1:157504','167501','167505','_5',NULL,NULL,'æµç¨‹ç»“æŸ','endEvent',NULL,'2020-01-28 13:19:08','2020-01-28 13:19:08',0,NULL,''),('212507','leaveProcess:1:157504','187501','187505','_5',NULL,NULL,'æµç¨‹ç»“æŸ','endEvent',NULL,'2020-01-28 13:19:15','2020-01-28 13:19:15',0,NULL,''),('212508','leaveProcess:1:157504','190001','190005','_5',NULL,NULL,'æµç¨‹ç»“æŸ','endEvent',NULL,'2020-01-28 13:19:20','2020-01-28 13:19:20',0,NULL,''),('215002','leaveProcess:1:157504','182501','182505','_13',NULL,NULL,'ExclusiveGateway','exclusiveGateway',NULL,'2020-01-28 17:58:06','2020-01-28 17:58:06',17,NULL,''),('215003','leaveProcess:1:157504','182501','182505','_101','215004',NULL,'äººäº‹å®¡æ‰¹','userTask',NULL,'2020-01-28 17:58:06',NULL,NULL,NULL,''),('215008','leaveProcess:1:157504','210001','210005','_13',NULL,NULL,'ExclusiveGateway','exclusiveGateway',NULL,'2020-01-28 17:58:20','2020-01-28 17:58:20',0,NULL,''),('215009','leaveProcess:1:157504','210001','210005','_101','215010',NULL,'äººäº‹å®¡æ‰¹','userTask',NULL,'2020-01-28 17:58:20',NULL,NULL,NULL,''),('215014','leaveProcess:1:157504','192501','192505','_13',NULL,NULL,'ExclusiveGateway','exclusiveGateway',NULL,'2020-01-28 18:00:07','2020-01-28 18:00:07',0,NULL,''),('215015','leaveProcess:1:157504','192501','192505','_101','215016',NULL,'äººäº‹å®¡æ‰¹','userTask',NULL,'2020-01-28 18:00:07',NULL,NULL,NULL,''),('215020','leaveProcess:1:157504','195001','195005','_13',NULL,NULL,'ExclusiveGateway','exclusiveGateway',NULL,'2020-01-28 18:00:09','2020-01-28 18:00:09',0,NULL,''),('215021','leaveProcess:1:157504','195001','195005','_101','215022',NULL,'äººäº‹å®¡æ‰¹','userTask',NULL,'2020-01-28 18:00:09',NULL,NULL,NULL,''),('215026','leaveProcess:1:157504','197501','197505','_13',NULL,NULL,'ExclusiveGateway','exclusiveGateway',NULL,'2020-01-28 18:03:05','2020-01-28 18:03:05',0,NULL,''),('215027','leaveProcess:1:157504','197501','197505','_101','215028',NULL,'äººäº‹å®¡æ‰¹','userTask','giao','2020-01-28 18:03:05','2020-01-28 18:08:08',303688,NULL,''),('215031','leaveProcess:1:157504','197501','197505','_5',NULL,NULL,'æµç¨‹ç»“æŸ','endEvent',NULL,'2020-01-28 18:08:08','2020-01-28 18:08:08',0,NULL,''),('215036','leaveProcess:1:157504','180001','180005','_13',NULL,NULL,'ExclusiveGateway','exclusiveGateway',NULL,'2020-01-28 18:16:52','2020-01-28 18:16:52',0,NULL,''),('215037','leaveProcess:1:157504','180001','180005','_101','215038',NULL,'äººäº‹å®¡æ‰¹','userTask',NULL,'2020-01-28 18:16:52',NULL,NULL,NULL,'');

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('175002','event','2020-01-21 13:47:43',NULL,'172508',NULL,'AddUserLink','_|_assignee',NULL),('177501','event','2020-01-21 13:51:36',NULL,'172508',NULL,'AddUserLink','null_|_assignee',NULL),('202501','event','2020-01-25 10:36:36',NULL,'172508',NULL,'AddUserLink','_|_assignee',NULL),('202503','event','2020-01-25 10:36:37',NULL,'180008',NULL,'AddUserLink','_|_assignee',NULL),('202505','event','2020-01-25 10:36:38',NULL,'182508',NULL,'AddUserLink','_|_assignee',NULL),('202507','event','2020-01-25 10:36:40',NULL,'185008',NULL,'AddUserLink','_|_assignee',NULL),('210016','event','2020-01-28 12:43:40',NULL,'180008',NULL,'AddUserLink','_|_assignee',NULL),('210017','event','2020-01-28 12:43:40',NULL,'182508',NULL,'AddUserLink','_|_assignee',NULL),('210018','event','2020-01-28 12:43:41',NULL,'185008',NULL,'AddUserLink','_|_assignee',NULL),('210020','event','2020-01-28 13:15:17',NULL,'197508',NULL,'AddUserLink','_|_assignee',NULL),('210022','event','2020-01-28 13:15:18',NULL,'210008',NULL,'AddUserLink','_|_assignee',NULL),('212501','event','2020-01-28 13:18:31',NULL,'180008',NULL,'AddUserLink','null_|_assignee',NULL),('212502','event','2020-01-28 13:18:31',NULL,'182508',NULL,'AddUserLink','null_|_assignee',NULL),('212503','event','2020-01-28 13:18:31',NULL,'185008',NULL,'AddUserLink','null_|_assignee',NULL),('212504','event','2020-01-28 13:18:32',NULL,'210008',NULL,'AddUserLink','null_|_assignee',NULL),('212505','event','2020-01-28 13:18:37',NULL,'180008',NULL,'AddUserLink','null_|_assignee',NULL),('215032','event','2020-01-28 18:16:16',NULL,'185008',NULL,'AddUserLink','null_|_assignee',NULL),('215033','event','2020-01-28 18:16:23',NULL,'185008',NULL,'AddUserLink','null_|_assignee',NULL),('215034','event','2020-01-28 18:16:26',NULL,'185008',NULL,'AddUserLink','null_|_assignee',NULL),('215041','event','2020-01-28 18:19:01',NULL,'185008',NULL,'AddUserLink','null_|_assignee',NULL);

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('157513',NULL,'candidate','Pony','157512',NULL),('157514',NULL,'participant','Pony',NULL,'157505'),('157515',NULL,'candidate','kunkun','157512',NULL),('157516',NULL,'participant','kunkun',NULL,'157505'),('160009',NULL,'candidate','Pony','160008',NULL),('160010',NULL,'participant','Pony',NULL,'160001'),('160011',NULL,'candidate','kunkun','160008',NULL),('160012',NULL,'participant','kunkun',NULL,'160001'),('162505',NULL,'candidate','giao','162504',NULL),('162506',NULL,'participant','giao',NULL,'157505'),('162511',NULL,'candidate','giao','162510',NULL),('162512',NULL,'participant','giao',NULL,'160001'),('167509',NULL,'candidate','Pony','167508',NULL),('167510',NULL,'participant','Pony',NULL,'167501'),('167511',NULL,'candidate','kunkun','167508',NULL),('167512',NULL,'participant','kunkun',NULL,'167501'),('170009',NULL,'candidate','Pony','170008',NULL),('170010',NULL,'participant','Pony',NULL,'170001'),('170011',NULL,'candidate','kunkun','170008',NULL),('170012',NULL,'participant','kunkun',NULL,'170001'),('172509',NULL,'candidate','Pony','172508',NULL),('172510',NULL,'participant','Pony',NULL,'172501'),('172511',NULL,'candidate','kunkun','172508',NULL),('172512',NULL,'participant','kunkun',NULL,'172501'),('175001',NULL,'participant','',NULL,'172501'),('180009',NULL,'candidate','Pony','180008',NULL),('180010',NULL,'participant','Pony',NULL,'180001'),('180011',NULL,'candidate','kunkun','180008',NULL),('180012',NULL,'participant','kunkun',NULL,'180001'),('182509',NULL,'candidate','Pony','182508',NULL),('182510',NULL,'participant','Pony',NULL,'182501'),('182511',NULL,'candidate','kunkun','182508',NULL),('182512',NULL,'participant','kunkun',NULL,'182501'),('185009',NULL,'candidate','Pony','185008',NULL),('185010',NULL,'participant','Pony',NULL,'185001'),('185011',NULL,'candidate','kunkun','185008',NULL),('185012',NULL,'participant','kunkun',NULL,'185001'),('187509',NULL,'candidate','Pony','187508',NULL),('187510',NULL,'participant','Pony',NULL,'187501'),('187511',NULL,'candidate','kunkun','187508',NULL),('187512',NULL,'participant','kunkun',NULL,'187501'),('190009',NULL,'candidate','Pony','190008',NULL),('190010',NULL,'participant','Pony',NULL,'190001'),('190011',NULL,'candidate','kunkun','190008',NULL),('190012',NULL,'participant','kunkun',NULL,'190001'),('192509',NULL,'candidate','Pony','192508',NULL),('192510',NULL,'participant','Pony',NULL,'192501'),('192511',NULL,'candidate','kunkun','192508',NULL),('192512',NULL,'participant','kunkun',NULL,'192501'),('195009',NULL,'candidate','Pony','195008',NULL),('195010',NULL,'participant','Pony',NULL,'195001'),('195011',NULL,'candidate','kunkun','195008',NULL),('195012',NULL,'participant','kunkun',NULL,'195001'),('197509',NULL,'candidate','Pony','197508',NULL),('197510',NULL,'participant','Pony',NULL,'197501'),('197511',NULL,'candidate','kunkun','197508',NULL),('197512',NULL,'participant','kunkun',NULL,'197501'),('200005',NULL,'candidate','giao','200004',NULL),('200006',NULL,'participant','giao',NULL,'167501'),('202502',NULL,'participant','',NULL,'180001'),('202504',NULL,'participant','',NULL,'182501'),('202506',NULL,'participant','',NULL,'185001'),('205005',NULL,'candidate','giao','205004',NULL),('205006',NULL,'participant','giao',NULL,'187501'),('207505',NULL,'candidate','giao','207504',NULL),('207506',NULL,'participant','giao',NULL,'190001'),('210009',NULL,'candidate','Pony','210008',NULL),('210010',NULL,'participant','Pony',NULL,'210001'),('210011',NULL,'candidate','kunkun','210008',NULL),('210012',NULL,'participant','kunkun',NULL,'210001'),('210019',NULL,'participant','',NULL,'197501'),('210021',NULL,'participant','',NULL,'210001'),('215005',NULL,'candidate','giao','215004',NULL),('215006',NULL,'participant','giao',NULL,'182501'),('215011',NULL,'candidate','giao','215010',NULL),('215012',NULL,'participant','giao',NULL,'210001'),('215017',NULL,'candidate','giao','215016',NULL),('215018',NULL,'participant','giao',NULL,'192501'),('215023',NULL,'candidate','giao','215022',NULL),('215024',NULL,'participant','giao',NULL,'195001'),('215029',NULL,'candidate','giao','215028',NULL),('215030',NULL,'participant','giao',NULL,'197501'),('215039',NULL,'candidate','giao','215038',NULL),('215040',NULL,'participant','giao',NULL,'180001');

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`) values ('157505','157505','94','leaveProcess:1:157504','2020-01-21 12:44:40','2020-01-21 13:08:22',1422830,NULL,'_2','_5',NULL,NULL,'',NULL),('160001','160001','95','leaveProcess:1:157504','2020-01-21 12:51:03','2020-01-21 13:08:22',1039911,NULL,'_2','_5',NULL,NULL,'',NULL),('167501','167501','96','leaveProcess:1:157504','2020-01-21 13:17:27','2020-01-28 13:19:08',604901162,NULL,'_2','_5',NULL,NULL,'',NULL),('170001','170001','97','leaveProcess:1:157504','2020-01-21 13:22:52','2020-01-25 10:28:31',335139624,NULL,'_2','_5',NULL,NULL,'',NULL),('172501','172501','98','leaveProcess:1:157504','2020-01-21 13:24:46','2020-01-28 12:43:35',602329830,NULL,'_2','_5',NULL,NULL,'',NULL),('180001','180001','99','leaveProcess:1:157504','2020-01-21 14:28:54',NULL,NULL,NULL,'_2',NULL,NULL,NULL,'',NULL),('182501','182501','100','leaveProcess:1:157504','2020-01-21 14:30:56',NULL,NULL,NULL,'_2',NULL,NULL,NULL,'',NULL),('185001','185001','101','leaveProcess:1:157504','2020-01-21 14:31:25',NULL,NULL,NULL,'_2',NULL,NULL,NULL,'',NULL),('187501','187501','102','leaveProcess:1:157504','2020-01-21 14:32:13','2020-01-28 13:19:15',600422931,NULL,'_2','_5',NULL,NULL,'',NULL),('190001','190001','103','leaveProcess:1:157504','2020-01-21 14:32:41','2020-01-28 13:19:20',600399308,NULL,'_2','_5',NULL,NULL,'',NULL),('192501','192501','104','leaveProcess:1:157504','2020-01-21 14:33:20',NULL,NULL,NULL,'_2',NULL,NULL,NULL,'',NULL),('195001','195001','105','leaveProcess:1:157504','2020-01-21 14:34:08',NULL,NULL,NULL,'_2',NULL,NULL,NULL,'',NULL),('197501','197501','106','leaveProcess:1:157504','2020-01-21 15:10:01','2020-01-28 18:08:09',615488421,NULL,'_2','_5',NULL,NULL,'',NULL),('210001','210001','107','leaveProcess:1:157504','2020-01-28 12:43:19',NULL,NULL,NULL,'_2',NULL,NULL,NULL,'',NULL);

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('157512','leaveProcess:1:157504','_100','157505','157509','é¡¹ç›®ç»ç†å®¡æ‰¹',NULL,NULL,NULL,'kunkun','2020-01-21 12:44:41','2020-01-21 12:56:11','2020-01-21 13:03:13',1112942,NULL,50,NULL,NULL,NULL,''),('160008','leaveProcess:1:157504','_100','160001','160005','é¡¹ç›®ç»ç†å®¡æ‰¹',NULL,NULL,NULL,'kunkun','2020-01-21 12:51:03','2020-01-21 12:56:11','2020-01-21 13:03:14',731185,NULL,50,NULL,NULL,NULL,''),('162504','leaveProcess:1:157504','_101','157505','157509','äººäº‹å®¡æ‰¹',NULL,NULL,NULL,'giao','2020-01-21 13:03:14','2020-01-21 13:06:55','2020-01-21 13:08:22',308738,NULL,50,NULL,NULL,NULL,''),('162510','leaveProcess:1:157504','_101','160001','160005','äººäº‹å®¡æ‰¹',NULL,NULL,NULL,'giao','2020-01-21 13:03:14','2020-01-21 13:06:55','2020-01-21 13:08:22',308889,NULL,50,NULL,NULL,NULL,''),('167508','leaveProcess:1:157504','_100','167501','167505','é¡¹ç›®ç»ç†å®¡æ‰¹',NULL,NULL,NULL,'kunkun','2020-01-21 13:17:27','2020-01-21 13:19:22','2020-01-25 10:24:31',335224975,NULL,50,NULL,NULL,NULL,''),('170008','leaveProcess:1:157504','_100','170001','170005','é¡¹ç›®ç»ç†å®¡æ‰¹',NULL,NULL,NULL,'kunkun','2020-01-21 13:22:52','2020-01-21 13:44:08','2020-01-25 10:28:29',335137364,NULL,50,NULL,NULL,NULL,''),('172508','leaveProcess:1:157504','_100','172501','172505','é¡¹ç›®ç»ç†å®¡æ‰¹',NULL,NULL,NULL,'kunkun','2020-01-21 13:24:46','2020-01-28 12:42:34','2020-01-28 12:43:35',602329788,NULL,50,NULL,NULL,NULL,''),('180008','leaveProcess:1:157504','_100','180001','180005','é¡¹ç›®ç»ç†å®¡æ‰¹',NULL,NULL,NULL,'Pony','2020-01-21 14:28:55','2020-01-28 17:58:25','2020-01-28 18:16:52',618477085,NULL,50,NULL,NULL,NULL,''),('182508','leaveProcess:1:157504','_100','182501','182505','é¡¹ç›®ç»ç†å®¡æ‰¹',NULL,NULL,NULL,'Pony','2020-01-21 14:30:56','2020-01-28 13:18:35','2020-01-28 17:58:06',617230315,NULL,50,NULL,NULL,NULL,''),('185008','leaveProcess:1:157504','_100','185001','185005','é¡¹ç›®ç»ç†å®¡æ‰¹',NULL,NULL,NULL,NULL,'2020-01-21 14:31:25','2020-01-28 18:16:33',NULL,NULL,NULL,50,NULL,NULL,NULL,''),('187508','leaveProcess:1:157504','_100','187501','187505','é¡¹ç›®ç»ç†å®¡æ‰¹',NULL,NULL,NULL,'kunkun','2020-01-21 14:32:13','2020-01-25 10:31:21','2020-01-25 10:40:34',331701177,NULL,50,NULL,NULL,NULL,''),('190008','leaveProcess:1:157504','_100','190001','190005','é¡¹ç›®ç»ç†å®¡æ‰¹',NULL,NULL,NULL,'kunkun','2020-01-21 14:32:42','2020-01-25 10:31:21','2020-01-25 10:43:04',331822093,NULL,50,NULL,NULL,NULL,''),('192508','leaveProcess:1:157504','_100','192501','192505','é¡¹ç›®ç»ç†å®¡æ‰¹',NULL,NULL,NULL,'kunkun','2020-01-21 14:33:20','2020-01-28 12:42:34','2020-01-28 18:00:07',617207860,NULL,50,NULL,NULL,NULL,''),('195008','leaveProcess:1:157504','_100','195001','195005','é¡¹ç›®ç»ç†å®¡æ‰¹',NULL,NULL,NULL,'kunkun','2020-01-21 14:34:08','2020-01-28 12:42:34','2020-01-28 18:00:09',617161680,NULL,50,NULL,NULL,NULL,''),('197508','leaveProcess:1:157504','_100','197501','197505','é¡¹ç›®ç»ç†å®¡æ‰¹',NULL,NULL,NULL,'Pony','2020-01-21 15:10:01','2020-01-28 18:02:43','2020-01-28 18:03:05',615184847,NULL,50,NULL,NULL,NULL,''),('200004','leaveProcess:1:157504','_101','167501','167505','äººäº‹å®¡æ‰¹',NULL,NULL,NULL,'giao','2020-01-25 10:24:32','2020-01-28 13:19:02','2020-01-28 13:19:08',269676141,NULL,50,NULL,NULL,NULL,''),('205004','leaveProcess:1:157504','_101','187501','187505','äººäº‹å®¡æ‰¹',NULL,NULL,NULL,'giao','2020-01-25 10:40:34','2020-01-28 13:19:02','2020-01-28 13:19:15',268721921,NULL,50,NULL,NULL,NULL,''),('207504','leaveProcess:1:157504','_101','190001','190005','äººäº‹å®¡æ‰¹',NULL,NULL,NULL,'giao','2020-01-25 10:43:04','2020-01-28 13:19:03','2020-01-28 13:19:20',268576297,NULL,50,NULL,NULL,NULL,''),('210008','leaveProcess:1:157504','_100','210001','210005','é¡¹ç›®ç»ç†å®¡æ‰¹',NULL,NULL,NULL,'Pony','2020-01-28 12:43:19','2020-01-28 13:18:35','2020-01-28 17:58:20',18901576,NULL,50,NULL,NULL,NULL,''),('215004','leaveProcess:1:157504','_101','182501','182505','äººäº‹å®¡æ‰¹',NULL,NULL,NULL,NULL,'2020-01-28 17:58:06',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('215010','leaveProcess:1:157504','_101','210001','210005','äººäº‹å®¡æ‰¹',NULL,NULL,NULL,NULL,'2020-01-28 17:58:20',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('215016','leaveProcess:1:157504','_101','192501','192505','äººäº‹å®¡æ‰¹',NULL,NULL,NULL,NULL,'2020-01-28 18:00:07',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('215022','leaveProcess:1:157504','_101','195001','195005','äººäº‹å®¡æ‰¹',NULL,NULL,NULL,NULL,'2020-01-28 18:00:09',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('215028','leaveProcess:1:157504','_101','197501','197505','äººäº‹å®¡æ‰¹',NULL,NULL,NULL,'giao','2020-01-28 18:03:05','2020-01-28 18:07:40','2020-01-28 18:08:08',303686,NULL,50,NULL,NULL,NULL,''),('215038','leaveProcess:1:157504','_101','180001','180005','äººäº‹å®¡æ‰¹',NULL,NULL,NULL,NULL,'2020-01-28 18:16:52',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'');

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('157507','157505','157505',NULL,'leaveCandidate','serializable',0,'157508',NULL,NULL,NULL,NULL,'2020-01-21 12:44:40','2020-01-21 12:44:40'),('160003','160001','160001',NULL,'leaveCandidate','serializable',0,'160004',NULL,NULL,NULL,NULL,'2020-01-21 12:51:03','2020-01-21 12:51:03'),('162501','157505','157505',NULL,'judge','string',1,NULL,NULL,NULL,'pass',NULL,'2020-01-21 13:03:13','2020-01-21 13:08:22'),('162507','160001','160001',NULL,'judge','string',1,NULL,NULL,NULL,'pass',NULL,'2020-01-21 13:03:14','2020-01-21 13:08:22'),('167503','167501','167501',NULL,'leaveCandidate','serializable',0,'167504',NULL,NULL,NULL,NULL,'2020-01-21 13:17:27','2020-01-21 13:17:27'),('170003','170001','170001',NULL,'leaveCandidate','serializable',0,'170004',NULL,NULL,NULL,NULL,'2020-01-21 13:22:52','2020-01-21 13:22:52'),('172503','172501','172501',NULL,'leaveCandidate','serializable',0,'172504',NULL,NULL,NULL,NULL,'2020-01-21 13:24:46','2020-01-21 13:24:46'),('180003','180001','180001',NULL,'leaveCandidate','serializable',0,'180004',NULL,NULL,NULL,NULL,'2020-01-21 14:28:54','2020-01-21 14:28:54'),('182503','182501','182501',NULL,'leaveCandidate','serializable',0,'182504',NULL,NULL,NULL,NULL,'2020-01-21 14:30:56','2020-01-21 14:30:56'),('185003','185001','185001',NULL,'leaveCandidate','serializable',0,'185004',NULL,NULL,NULL,NULL,'2020-01-21 14:31:25','2020-01-21 14:31:25'),('187503','187501','187501',NULL,'leaveCandidate','serializable',0,'187504',NULL,NULL,NULL,NULL,'2020-01-21 14:32:13','2020-01-21 14:32:13'),('190003','190001','190001',NULL,'leaveCandidate','serializable',0,'190004',NULL,NULL,NULL,NULL,'2020-01-21 14:32:41','2020-01-21 14:32:41'),('192503','192501','192501',NULL,'leaveCandidate','serializable',0,'192504',NULL,NULL,NULL,NULL,'2020-01-21 14:33:20','2020-01-21 14:33:20'),('195003','195001','195001',NULL,'leaveCandidate','serializable',0,'195004',NULL,NULL,NULL,NULL,'2020-01-21 14:34:08','2020-01-21 14:34:08'),('197503','197501','197501',NULL,'leaveCandidate','serializable',0,'197504',NULL,NULL,NULL,NULL,'2020-01-21 15:10:01','2020-01-21 15:10:01'),('200001','167501','167501',NULL,'judge','string',1,NULL,NULL,NULL,'reject',NULL,'2020-01-25 10:24:31','2020-01-28 13:19:08'),('200007','170001','170001',NULL,'judge','string',0,NULL,NULL,NULL,'reject',NULL,'2020-01-25 10:28:29','2020-01-25 10:28:29'),('205001','187501','187501',NULL,'judge','string',1,NULL,NULL,NULL,'reject',NULL,'2020-01-25 10:40:34','2020-01-28 13:19:15'),('207501','190001','190001',NULL,'judge','string',1,NULL,NULL,NULL,'reject',NULL,'2020-01-25 10:43:04','2020-01-28 13:19:20'),('210003','210001','210001',NULL,'leaveCandidate','serializable',0,'210004',NULL,NULL,NULL,NULL,'2020-01-28 12:43:19','2020-01-28 12:43:19'),('210013','172501','172501',NULL,'judge','string',0,NULL,NULL,NULL,'reject',NULL,'2020-01-28 12:43:35','2020-01-28 12:43:35'),('215001','182501','182501',NULL,'judge','string',0,NULL,NULL,NULL,'pass',NULL,'2020-01-28 17:58:06','2020-01-28 17:58:06'),('215007','210001','210001',NULL,'judge','string',0,NULL,NULL,NULL,'pass',NULL,'2020-01-28 17:58:20','2020-01-28 17:58:20'),('215013','192501','192501',NULL,'judge','string',0,NULL,NULL,NULL,'pass',NULL,'2020-01-28 18:00:07','2020-01-28 18:00:07'),('215019','195001','195001',NULL,'judge','string',0,NULL,NULL,NULL,'pass',NULL,'2020-01-28 18:00:09','2020-01-28 18:00:09'),('215025','197501','197501',NULL,'judge','string',1,NULL,NULL,NULL,'pass',NULL,'2020-01-28 18:03:05','2020-01-28 18:08:08'),('215035','180001','180001',NULL,'judge','string',0,NULL,NULL,NULL,'pass',NULL,'2020-01-28 18:16:52','2020-01-28 18:16:52');

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_procdef_info` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`ENGINE_VERSION_`) values ('157501','SpringAutoDeployment',NULL,NULL,'','2020-01-21 12:44:31',NULL);

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`) values ('leaveProcess:1:157504',1,'http://www.activiti.org/test','è¯·å‡æµç¨‹å®šä¹‰','leaveProcess',1,'157501','D:\\Idea\\GzsbOa\\target\\classes\\processes\\leaveProcess.bpmn','D:\\Idea\\GzsbOa\\target\\classes\\processes\\leaveProcess.leaveProcess.png',NULL,0,1,1,'',NULL);

/*Table structure for table `act_ru_deadletter_job` */

DROP TABLE IF EXISTS `act_ru_deadletter_job`;

CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_deadletter_job` */

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`) values ('180001',1,'180001','99',NULL,'leaveProcess:1:157504',NULL,'180001',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-01-21 14:28:54',NULL,NULL,0,0,0,0,0,0,0,0,0),('180005',2,'180001',NULL,'180001','leaveProcess:1:157504',NULL,'180001','_101',1,0,0,0,0,1,NULL,'',NULL,'2020-01-21 14:28:54',NULL,NULL,0,0,0,0,0,0,0,0,0),('182501',1,'182501','100',NULL,'leaveProcess:1:157504',NULL,'182501',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-01-21 14:30:56',NULL,NULL,0,0,0,0,0,0,0,0,0),('182505',2,'182501',NULL,'182501','leaveProcess:1:157504',NULL,'182501','_101',1,0,0,0,0,1,NULL,'',NULL,'2020-01-21 14:30:56',NULL,NULL,0,0,0,0,0,0,0,0,0),('185001',1,'185001','101',NULL,'leaveProcess:1:157504',NULL,'185001',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-01-21 14:31:25',NULL,NULL,0,0,0,0,0,0,0,0,0),('185005',1,'185001',NULL,'185001','leaveProcess:1:157504',NULL,'185001','_100',1,0,0,0,0,1,NULL,'',NULL,'2020-01-21 14:31:25',NULL,NULL,0,0,0,0,0,0,0,0,0),('192501',1,'192501','104',NULL,'leaveProcess:1:157504',NULL,'192501',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-01-21 14:33:20',NULL,NULL,0,0,0,0,0,0,0,0,0),('192505',2,'192501',NULL,'192501','leaveProcess:1:157504',NULL,'192501','_101',1,0,0,0,0,1,NULL,'',NULL,'2020-01-21 14:33:20',NULL,NULL,0,0,0,0,0,0,0,0,0),('195001',1,'195001','105',NULL,'leaveProcess:1:157504',NULL,'195001',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-01-21 14:34:08',NULL,NULL,0,0,0,0,0,0,0,0,0),('195005',2,'195001',NULL,'195001','leaveProcess:1:157504',NULL,'195001','_101',1,0,0,0,0,1,NULL,'',NULL,'2020-01-21 14:34:08',NULL,NULL,0,0,0,0,0,0,0,0,0),('210001',1,'210001','107',NULL,'leaveProcess:1:157504',NULL,'210001',NULL,1,0,1,0,0,1,NULL,'',NULL,'2020-01-28 12:43:19',NULL,NULL,0,0,0,0,0,0,0,0,0),('210005',2,'210001',NULL,'210001','leaveProcess:1:157504',NULL,'210001','_101',1,0,0,0,0,1,NULL,'',NULL,'2020-01-28 12:43:19',NULL,NULL,0,0,0,0,0,0,0,0,0);

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`) values ('180010',1,NULL,'participant','Pony',NULL,'180001',NULL),('180012',1,NULL,'participant','kunkun',NULL,'180001',NULL),('182510',1,NULL,'participant','Pony',NULL,'182501',NULL),('182512',1,NULL,'participant','kunkun',NULL,'182501',NULL),('185009',1,NULL,'candidate','Pony','185008',NULL,NULL),('185010',1,NULL,'participant','Pony',NULL,'185001',NULL),('185011',1,NULL,'candidate','kunkun','185008',NULL,NULL),('185012',1,NULL,'participant','kunkun',NULL,'185001',NULL),('192510',1,NULL,'participant','Pony',NULL,'192501',NULL),('192512',1,NULL,'participant','kunkun',NULL,'192501',NULL),('195010',1,NULL,'participant','Pony',NULL,'195001',NULL),('195012',1,NULL,'participant','kunkun',NULL,'195001',NULL),('202502',1,NULL,'participant','',NULL,'180001',NULL),('202504',1,NULL,'participant','',NULL,'182501',NULL),('202506',1,NULL,'participant','',NULL,'185001',NULL),('210010',1,NULL,'participant','Pony',NULL,'210001',NULL),('210012',1,NULL,'participant','kunkun',NULL,'210001',NULL),('210021',1,NULL,'participant','',NULL,'210001',NULL),('215005',1,NULL,'candidate','giao','215004',NULL,NULL),('215006',1,NULL,'participant','giao',NULL,'182501',NULL),('215011',1,NULL,'candidate','giao','215010',NULL,NULL),('215012',1,NULL,'participant','giao',NULL,'210001',NULL),('215017',1,NULL,'candidate','giao','215016',NULL,NULL),('215018',1,NULL,'participant','giao',NULL,'192501',NULL),('215023',1,NULL,'candidate','giao','215022',NULL,NULL),('215024',1,NULL,'participant','giao',NULL,'195001',NULL),('215039',1,NULL,'candidate','giao','215038',NULL,NULL),('215040',1,NULL,'participant','giao',NULL,'180001',NULL);

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_suspended_job` */

DROP TABLE IF EXISTS `act_ru_suspended_job`;

CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_suspended_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`,`CLAIM_TIME_`) values ('185008',15,'185005','185001','leaveProcess:1:157504','é¡¹ç›®ç»ç†å®¡æ‰¹',NULL,NULL,'_100',NULL,NULL,NULL,50,'2020-01-21 14:31:25',NULL,NULL,1,'',NULL,'2020-01-28 18:16:33'),('215004',1,'182505','182501','leaveProcess:1:157504','äººäº‹å®¡æ‰¹',NULL,NULL,'_101',NULL,NULL,NULL,50,'2020-01-28 17:58:06',NULL,NULL,1,'',NULL,NULL),('215010',1,'210005','210001','leaveProcess:1:157504','äººäº‹å®¡æ‰¹',NULL,NULL,'_101',NULL,NULL,NULL,50,'2020-01-28 17:58:20',NULL,NULL,1,'',NULL,NULL),('215016',1,'192505','192501','leaveProcess:1:157504','äººäº‹å®¡æ‰¹',NULL,NULL,'_101',NULL,NULL,NULL,50,'2020-01-28 18:00:07',NULL,NULL,1,'',NULL,NULL),('215022',1,'195005','195001','leaveProcess:1:157504','äººäº‹å®¡æ‰¹',NULL,NULL,'_101',NULL,NULL,NULL,50,'2020-01-28 18:00:09',NULL,NULL,1,'',NULL,NULL),('215038',1,'180005','180001','leaveProcess:1:157504','äººäº‹å®¡æ‰¹',NULL,NULL,'_101',NULL,NULL,NULL,50,'2020-01-28 18:16:52',NULL,NULL,1,'',NULL,NULL);

/*Table structure for table `act_ru_timer_job` */

DROP TABLE IF EXISTS `act_ru_timer_job`;

CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TIMER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_timer_job` */

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('180003',1,'serializable','leaveCandidate','180001','180001',NULL,'180002',NULL,NULL,NULL,NULL),('182503',1,'serializable','leaveCandidate','182501','182501',NULL,'182502',NULL,NULL,NULL,NULL),('185003',1,'serializable','leaveCandidate','185001','185001',NULL,'185002',NULL,NULL,NULL,NULL),('192503',1,'serializable','leaveCandidate','192501','192501',NULL,'192502',NULL,NULL,NULL,NULL),('195003',1,'serializable','leaveCandidate','195001','195001',NULL,'195002',NULL,NULL,NULL,NULL),('210003',1,'serializable','leaveCandidate','210001','210001',NULL,'210002',NULL,NULL,NULL,NULL),('215001',1,'string','judge','182501','182501',NULL,NULL,NULL,NULL,'pass',NULL),('215007',1,'string','judge','210001','210001',NULL,NULL,NULL,NULL,'pass',NULL),('215013',1,'string','judge','192501','192501',NULL,NULL,NULL,NULL,'pass',NULL),('215019',1,'string','judge','195001','195001',NULL,NULL,NULL,NULL,'pass',NULL),('215035',1,'string','judge','180001','180001',NULL,NULL,NULL,NULL,'pass',NULL);

/*Table structure for table `gzsb_attendance` */

DROP TABLE IF EXISTS `gzsb_attendance`;

CREATE TABLE `gzsb_attendance` (
  `A_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE_CODE` varchar(50) DEFAULT NULL COMMENT 'TYPE_CODE',
  `PLAN_STATUS_CODE` varchar(15) DEFAULT NULL COMMENT 'ï¿½Æ»ï¿½×´Ì¬ï¿½ï¿½ï¿½ï¿½',
  `OPERATOR` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ô±ï¿½Ëºï¿½',
  `ID_ADDRESS` varchar(20) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½IPï¿½ï¿½Ö·',
  `REMARK` varchar(500) DEFAULT NULL COMMENT 'ï¿½ï¿½×¢',
  `A_TIME` datetime DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  PRIMARY KEY (`A_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COMMENT='ï¿½ï¿½ï¿½Ú¼ï¿½Â¼';

/*Data for the table `gzsb_attendance` */

insert  into `gzsb_attendance`(`A_ID`,`TYPE_CODE`,`PLAN_STATUS_CODE`,`OPERATOR`,`ID_ADDRESS`,`REMARK`,`A_TIME`) values (1,'goWork','attendance_0','jj','127.01.01',NULL,'2001-01-01 00:00:00'),(2,'offWork','attendance_0','jj','127.01.01',NULL,'2001-01-01 00:00:00'),(3,'goWork','attendance_1','dajiji','128.01.01',NULL,'2002-02-02 00:00:00'),(4,'goWork','attendance_1','dajiji','192.168.5.1',NULL,'2019-11-04 15:43:11'),(5,'offWork','attendance_2','dajiji','192.168.5.1',NULL,'2019-11-04 15:44:08'),(6,'offWork','attendance_0','dajiji','192.168.5.1',NULL,'2019-11-04 15:51:30'),(7,'offWork','attendance_0','dajiji','192.168.5.1',NULL,'2019-11-04 15:55:38'),(8,'offWork','attendance_0','dajiji','192.168.5.1',NULL,'2019-11-04 15:58:54'),(9,'offWork','attendance_0','dajiji','192.168.5.1',NULL,'2019-11-04 21:00:37'),(10,'goWork','attendance_1','dajiji','192.168.5.1',NULL,'2019-11-04 21:01:26'),(11,'offWork','attendance_0','dajiji','192.168.5.1',NULL,'2019-11-04 21:04:14'),(12,'offWork','attendance_0','dajiji','192.168.5.1',NULL,'2019-11-04 21:06:03'),(13,'offWork','attendance_0','dajiji','192.168.5.1',NULL,'2019-11-04 21:25:41'),(20,'goWork','attendance_0','dajiji','192.168.5.1',NULL,'2019-11-05 11:33:16'),(23,'offWork','attendance_2','dajiji','192.168.5.1',NULL,'2019-11-05 11:37:44'),(24,'offWork','attendance_2','jj','192.168.5.1',NULL,'2019-11-24 13:27:19'),(25,'goWork','attendance_1','jj','192.168.5.1',NULL,'2019-11-24 13:27:33'),(26,'goWork','attendance_1','dajiji','192.168.5.1',NULL,'2019-11-24 13:39:44'),(27,'offWork','attendance_2','dajiji','192.168.5.1',NULL,'2019-11-24 13:39:48'),(28,'goWork','attendance_1','jiji','192.168.5.1',NULL,'2019-11-24 13:40:28'),(29,'offWork','attendance_0','jiji','192.168.5.1',NULL,'2019-11-24 13:40:30'),(30,'goWork','attendance_0','jj','192.168.5.1',NULL,'2019-11-25 10:06:58'),(31,'goWork','attendance_0','dajiji','192.168.5.1',NULL,'2019-11-25 10:40:01'),(32,'offWork','attendance_0','jj','192.168.5.1',NULL,'2019-11-25 14:22:57'),(33,'goWork','attendance_3','jiji',NULL,NULL,'2019-11-29 18:36:00'),(34,'offWork','attendance_3','jiji',NULL,NULL,'2019-11-29 18:36:00'),(35,'goWork','attendance_3','test1',NULL,NULL,'2019-11-29 18:36:00'),(36,'offWork','attendance_3','test1',NULL,NULL,'2019-11-29 18:36:00'),(37,'goWork','attendance_4','dajiji',NULL,NULL,'2019-11-29 18:36:00'),(38,'offWork','attendance_4','dajiji',NULL,NULL,'2019-11-29 18:36:00'),(39,'goWork','attendance_3','test2',NULL,NULL,'2019-11-29 19:35:00'),(40,'offWork','attendance_3','test2',NULL,NULL,'2019-11-29 19:35:00'),(41,'goWork','attendance_1','test3','169.254.4.149',NULL,'2019-11-29 19:37:45'),(42,'offWork','attendance_5','test3',NULL,NULL,'2019-11-29 19:40:00'),(43,'goWork','attendance_1','jiji','192.168.137.1',NULL,'2019-11-30 10:49:17'),(44,'goWork','attendance_1','jiji','169.254.4.149',NULL,'2019-12-01 10:12:01'),(45,'offWork','attendance_5','jiji','169.254.4.149',NULL,'2019-12-01 14:16:00'),(46,'goWork','attendance_3','Pony','169.254.4.149',NULL,'2019-12-01 15:28:00'),(47,'offWork','attendance_3','Pony','169.254.4.149',NULL,'2019-12-01 15:28:00'),(48,'goWork','attendance_3','dajiji','169.254.4.149',NULL,'2019-12-01 16:31:00'),(49,'offWork','attendance_3','dajiji','169.254.4.149',NULL,'2019-12-01 16:31:00'),(50,'goWork','attendance_3','test1','169.254.4.149',NULL,'2019-12-01 16:31:00'),(51,'offWork','attendance_3','test1','169.254.4.149',NULL,'2019-12-01 16:31:00'),(52,'goWork','attendance_3','test3','169.254.4.149',NULL,'2019-12-01 18:01:00'),(53,'offWork','attendance_3','test3','169.254.4.149',NULL,'2019-12-01 18:01:00'),(54,'goWork','attendance_3','test2','169.254.4.149',NULL,'2019-12-01 19:16:00'),(55,'offWork','attendance_3','test2','169.254.4.149',NULL,'2019-12-01 19:16:00'),(56,'goWork','attendance_0','Pony','169.254.4.149',NULL,'2019-12-02 10:27:24'),(57,'goWork','attendance_1','jiji','169.254.4.149',NULL,'2019-12-02 11:36:56'),(58,'offWork','attendance_2','jiji','169.254.4.149',NULL,'2019-12-02 11:36:59'),(59,'goWork','attendance_0','Pony','192.168.5.1',NULL,'2019-12-04 10:23:29'),(60,'goWork','attendance_3','jiji','192.168.5.1',NULL,'2019-12-04 13:54:00'),(61,'offWork','attendance_3','jiji','192.168.5.1',NULL,'2019-12-04 13:54:00'),(62,'offWork','attendance_5','Pony','192.168.5.1',NULL,'2019-12-04 15:46:00'),(63,'goWork','attendance_3','dajiji','192.168.5.1',NULL,'2019-12-04 16:31:00'),(64,'offWork','attendance_3','dajiji','192.168.5.1',NULL,'2019-12-04 16:31:00'),(65,'goWork','attendance_3','test1','192.168.5.1',NULL,'2019-12-04 16:31:00'),(66,'offWork','attendance_3','test1','192.168.5.1',NULL,'2019-12-04 16:31:00'),(67,'goWork','attendance_3','test3','192.168.5.1',NULL,'2019-12-04 18:01:00'),(68,'offWork','attendance_3','test3','192.168.5.1',NULL,'2019-12-04 18:01:00'),(69,'goWork','attendance_3','test2','192.168.5.1',NULL,'2019-12-04 19:16:00'),(70,'offWork','attendance_3','test2','192.168.5.1',NULL,'2019-12-04 19:16:00'),(71,'goWork','attendance_0','Pony','192.168.5.1',NULL,'2019-12-05 08:41:15'),(72,'goWork','attendance_3','jiji','192.168.5.1',NULL,'2019-12-05 13:55:01'),(73,'offWork','attendance_3','jiji','192.168.5.1',NULL,'2019-12-05 13:55:01'),(74,'offWork','attendance_5','Pony','192.168.5.1',NULL,'2019-12-05 15:46:00'),(75,'goWork','attendance_3','dajiji','192.168.5.1',NULL,'2019-12-05 16:31:00'),(76,'offWork','attendance_3','dajiji','192.168.5.1',NULL,'2019-12-05 16:31:00'),(77,'goWork','attendance_3','test1','192.168.5.1',NULL,'2019-12-05 16:31:00'),(78,'offWork','attendance_3','test1','192.168.5.1',NULL,'2019-12-05 16:31:00'),(79,'goWork','attendance_3','test3','192.168.5.1',NULL,'2019-12-05 18:02:00'),(80,'offWork','attendance_3','test3','192.168.5.1',NULL,'2019-12-05 18:02:00'),(81,'goWork','attendance_3','test2','192.168.5.1',NULL,'2019-12-05 19:16:00'),(82,'offWork','attendance_3','test2','192.168.5.1',NULL,'2019-12-05 19:16:00'),(84,'goWork','attendance_3','jiji','192.168.5.1',NULL,'2019-12-06 14:53:00'),(85,'offWork','attendance_3','jiji','192.168.5.1',NULL,'2019-12-06 14:53:00'),(86,'goWork','attendance_3','Pony','192.168.5.1',NULL,'2019-12-06 14:53:00'),(87,'offWork','attendance_3','Pony','192.168.5.1',NULL,'2019-12-06 14:53:00'),(88,'goWork','attendance_3','zhangsan','192.168.5.1',NULL,'2019-12-06 16:50:00'),(89,'offWork','attendance_3','zhangsan','192.168.5.1',NULL,'2019-12-06 16:50:00'),(90,'goWork','attendance_3','Pony','192.168.5.1',NULL,'2019-12-07 20:54:02'),(91,'offWork','attendance_3','Pony','192.168.5.1',NULL,'2019-12-07 20:54:02'),(92,'goWork','attendance_3','zhangsan','192.168.5.1',NULL,'2019-12-07 20:54:02'),(93,'offWork','attendance_3','zhangsan','192.168.5.1',NULL,'2019-12-07 20:54:02'),(94,'goWork','attendance_3','kunkun','192.168.5.1',NULL,'2019-12-07 20:54:02'),(95,'offWork','attendance_3','kunkun','192.168.5.1',NULL,'2019-12-07 20:54:02'),(96,'goWork','attendance_3','giao','192.168.5.1',NULL,'2019-12-07 20:54:02'),(97,'offWork','attendance_3','giao','192.168.5.1',NULL,'2019-12-07 20:54:02'),(98,'goWork','attendance_3','Pony','192.168.5.1',NULL,'2019-12-08 14:46:00'),(99,'offWork','attendance_3','Pony','192.168.5.1',NULL,'2019-12-08 14:46:00'),(100,'goWork','attendance_3','zhangsan','192.168.5.1',NULL,'2019-12-08 14:46:00'),(101,'offWork','attendance_3','zhangsan','192.168.5.1',NULL,'2019-12-08 14:46:00'),(102,'goWork','attendance_3','kunkun','192.168.5.1',NULL,'2019-12-08 20:31:00'),(103,'offWork','attendance_3','kunkun','192.168.5.1',NULL,'2019-12-08 20:31:00'),(104,'goWork','attendance_3','giao','192.168.5.1',NULL,'2019-12-08 20:31:00'),(105,'offWork','attendance_3','giao','192.168.5.1',NULL,'2019-12-08 20:31:00'),(106,'goWork','attendance_3','Pony','192.168.5.1',NULL,'2019-12-09 14:46:00'),(107,'offWork','attendance_3','Pony','192.168.5.1',NULL,'2019-12-09 14:46:00'),(108,'goWork','attendance_3','zhangsan','192.168.5.1',NULL,'2019-12-09 14:46:00'),(109,'offWork','attendance_3','zhangsan','192.168.5.1',NULL,'2019-12-09 14:46:00'),(110,'goWork','attendance_3','Pony','192.168.5.1',NULL,'2019-12-10 16:24:02'),(111,'offWork','attendance_3','Pony','192.168.5.1',NULL,'2019-12-10 16:24:02'),(112,'goWork','attendance_3','zhangsan','192.168.5.1',NULL,'2019-12-10 16:24:02'),(113,'offWork','attendance_3','zhangsan','192.168.5.1',NULL,'2019-12-10 16:24:02'),(114,'goWork','attendance_3','kunkun','192.168.5.1',NULL,'2019-12-10 20:31:00'),(115,'offWork','attendance_3','kunkun','192.168.5.1',NULL,'2019-12-10 20:31:00'),(116,'goWork','attendance_3','giao','192.168.5.1',NULL,'2019-12-10 20:31:00'),(117,'offWork','attendance_3','giao','192.168.5.1',NULL,'2019-12-10 20:31:00'),(118,'goWork','attendance_3','Pony','192.168.5.1',NULL,'2019-12-11 14:46:00'),(119,'offWork','attendance_3','Pony','192.168.5.1',NULL,'2019-12-11 14:46:00'),(120,'goWork','attendance_3','zhangsan','192.168.5.1',NULL,'2019-12-11 14:46:00'),(121,'offWork','attendance_3','zhangsan','192.168.5.1',NULL,'2019-12-11 14:46:00'),(122,'goWork','attendance_3','Pony','192.168.5.1',NULL,'2019-12-13 14:46:00'),(123,'offWork','attendance_3','Pony','192.168.5.1',NULL,'2019-12-13 14:46:00'),(124,'goWork','attendance_3','zhangsan','192.168.5.1',NULL,'2019-12-13 14:46:00'),(125,'offWork','attendance_3','zhangsan','192.168.5.1',NULL,'2019-12-13 14:46:00'),(126,'goWork','attendance_3','Pony','192.168.5.1',NULL,'2019-12-19 15:24:00'),(127,'offWork','attendance_3','Pony','192.168.5.1',NULL,'2019-12-19 15:24:00'),(128,'goWork','attendance_3','zhangsan','192.168.5.1',NULL,'2019-12-19 15:24:00'),(129,'offWork','attendance_3','zhangsan','192.168.5.1',NULL,'2019-12-19 15:24:00'),(130,'goWork','attendance_3','Pony','192.168.5.1',NULL,'2020-01-06 19:13:02'),(131,'offWork','attendance_3','Pony','192.168.5.1',NULL,'2020-01-06 19:13:02'),(132,'goWork','attendance_3','zhangsan','192.168.5.1',NULL,'2020-01-06 19:13:02'),(133,'offWork','attendance_3','zhangsan','192.168.5.1',NULL,'2020-01-06 19:13:02'),(134,'goWork','attendance_3','Pony','192.168.5.1',NULL,'2020-01-12 18:35:00'),(135,'offWork','attendance_3','Pony','192.168.5.1',NULL,'2020-01-12 18:35:00'),(136,'goWork','attendance_3','zhangsan','192.168.5.1',NULL,'2020-01-12 18:35:00'),(137,'offWork','attendance_3','zhangsan','192.168.5.1',NULL,'2020-01-12 18:35:00'),(138,'goWork','attendance_3','Pony','192.168.5.1',NULL,'2020-01-18 18:24:00'),(139,'offWork','attendance_3','Pony','192.168.5.1',NULL,'2020-01-18 18:24:00'),(140,'goWork','attendance_3','zhangsan','192.168.5.1',NULL,'2020-01-18 18:24:00'),(141,'offWork','attendance_3','zhangsan','192.168.5.1',NULL,'2020-01-18 18:24:00'),(142,'goWork','attendance_3','kunkun','192.168.5.1',NULL,'2020-01-18 20:31:00'),(143,'offWork','attendance_3','kunkun','192.168.5.1',NULL,'2020-01-18 20:31:00'),(144,'goWork','attendance_3','giao','192.168.5.1',NULL,'2020-01-18 20:31:00'),(145,'offWork','attendance_3','giao','192.168.5.1',NULL,'2020-01-18 20:31:00'),(146,'goWork','attendance_3','Pony','192.168.5.1',NULL,'2020-01-19 17:49:00'),(147,'offWork','attendance_3','Pony','192.168.5.1',NULL,'2020-01-19 17:49:00'),(148,'goWork','attendance_3','zhangsan','192.168.5.1',NULL,'2020-01-19 17:49:00'),(149,'offWork','attendance_3','zhangsan','192.168.5.1',NULL,'2020-01-19 17:49:00'),(150,'goWork','attendance_3','Pony','192.168.5.1',NULL,'2020-01-21 15:06:00'),(151,'offWork','attendance_3','Pony','192.168.5.1',NULL,'2020-01-21 15:06:00'),(152,'goWork','attendance_3','zhangsan','192.168.5.1',NULL,'2020-01-21 15:06:00'),(153,'offWork','attendance_3','zhangsan','192.168.5.1',NULL,'2020-01-21 15:06:00'),(154,'goWork','attendance_3','Pony','192.168.5.1',NULL,'2020-01-23 17:25:00'),(155,'offWork','attendance_3','Pony','192.168.5.1',NULL,'2020-01-23 17:25:00'),(156,'goWork','attendance_3','zhangsan','192.168.5.1',NULL,'2020-01-23 17:25:00'),(157,'offWork','attendance_3','zhangsan','192.168.5.1',NULL,'2020-01-23 17:25:00'),(158,'goWork','attendance_3','Pony','192.168.42.133',NULL,'2020-01-28 17:42:00'),(159,'offWork','attendance_3','Pony','192.168.42.133',NULL,'2020-01-28 17:42:00'),(160,'goWork','attendance_3','zhangsan','192.168.42.133',NULL,'2020-01-28 17:42:00'),(161,'offWork','attendance_3','zhangsan','192.168.42.133',NULL,'2020-01-28 17:42:00');

/*Table structure for table `gzsb_bulletin` */

DROP TABLE IF EXISTS `gzsb_bulletin`;

CREATE TABLE `gzsb_bulletin` (
  `BULLETIN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OPERATOR` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ô±ï¿½Ëºï¿½',
  `PLAN_STATUS_CODE` varchar(10) DEFAULT NULL COMMENT 'ï¿½Æ»ï¿½×´Ì¬ï¿½ï¿½ï¿½ï¿½',
  `DEPARTMENT_CODE` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½Å±ï¿½ï¿½ï¿½',
  `TYPE_CODE` varchar(50) DEFAULT NULL COMMENT 'TYPE_CODE',
  `THEME` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `BULLETIN_CONTENT` varchar(2000) DEFAULT NULL COMMENT 'ï¿½ï¿½Ï¸ï¿½ï¿½ï¿½ï¿½',
  `TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`BULLETIN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='ï¿½ï¿½ï¿½ï¿½';

/*Data for the table `gzsb_bulletin` */

insert  into `gzsb_bulletin`(`BULLETIN_ID`,`OPERATOR`,`PLAN_STATUS_CODE`,`DEPARTMENT_CODE`,`TYPE_CODE`,`THEME`,`BULLETIN_CONTENT`,`TIME`) values (1,'jj','bulletin_2','diaomaoCode','department','ç´§æ€¥','å¤å¾·è«å®s','2001-01-01 00:00:00'),(6,'jj','bulletin_1','diaomaoCode','department','æ‰æ¯›èšé¤','ä¸€ä¸€ç¾¤æ‰æ¯›çš„èšé¤','2019-11-17 15:18:57'),(7,'jj','bulletin_1','diaomaoCode','department','æ‰æ¯›èšé¤','ä¸€ä¸€ç¾¤æ‰æ¯›çš„èšé¤','2019-11-17 15:18:59'),(8,'jj','bulletin_1','diaomaoCode','department','æ‰æ¯›èšé¤','ä¸€ä¸€ç¾¤æ‰æ¯›çš„èšé¤','2019-11-22 16:29:35'),(9,'dajiji','bulletin_1','diaomaoCode','department','é¸¡æ¯›èšé¤','ä¸¤ç¾¤é¸¡æ¯›çš„èšé¤','2019-11-22 16:31:39'),(10,'jiji','bulletin_2','diaomao01','company','ç‚’é¸¡å¤§å…¬å‘Šsss','å“’å“’å“’','2019-11-22 17:17:14'),(11,'jiji','bulletin_1','diaomao01','department','éƒ¨é—¨å°å…¬å‘Š','å˜¿å˜¿å˜¿','2019-11-22 17:18:05'),(12,'jiji','bulletin_0','diaomao01','department','é¸¡é¸¡','æ‰“å•Šæ‰“','2019-11-22 17:18:31'),(14,'jiji','bulletin_1','diaomao01','department','1','1','2019-11-22 17:21:25'),(15,'jiji','bulletin_1','diaomao01','company','1','1','2019-11-22 17:21:31'),(16,'jj','bulletin_0','diaomaoCode','company','123','123','2019-11-25 16:27:25'),(17,'jj','bulletin_0','diaomaoCode','company','123','123','2019-11-25 17:13:19'),(18,'jj','bulletin_0','diaomaoCode','company','123','123','2019-11-25 17:13:29'),(19,'Pony','bulletin_2','headquarters','company','å¤§å…¬å‘Š','è¶…çº§ç´§æ€¥å…¬å‘Šã€','2019-12-02 11:46:16'),(20,'Pony','bulletin_1','headquarters','department','mahuat','123','2019-12-09 09:58:31');

/*Table structure for table `gzsb_concat_book` */

DROP TABLE IF EXISTS `gzsb_concat_book`;

CREATE TABLE `gzsb_concat_book` (
  `CONCAT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CONCAT_NAME` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½Ïµï¿½ï¿½',
  `EMAIL_ACCOUNT` varchar(50) DEFAULT NULL COMMENT 'ï¿½Ê¼ï¿½ï¿½Ë»ï¿½ï¿½ï¿½',
  `SENDER` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `REMARK` varchar(500) DEFAULT NULL COMMENT 'ï¿½ï¿½×¢',
  PRIMARY KEY (`CONCAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Í¨Ñ¶Â¼';

/*Data for the table `gzsb_concat_book` */

/*Table structure for table `gzsb_conference` */

DROP TABLE IF EXISTS `gzsb_conference`;

CREATE TABLE `gzsb_conference` (
  `C_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE_CODE` varchar(50) DEFAULT NULL COMMENT 'TYPE_CODE',
  `DEPARTMENT_CODE` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½Å±ï¿½ï¿½ï¿½',
  `GZS_OPERATOR` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ô±ï¿½Ëºï¿½',
  `MM_ID` int(11) DEFAULT NULL,
  `THEME` varchar(200) NOT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `START_TIME` datetime NOT NULL COMMENT 'ï¿½ï¿½Ê¼Ê±ï¿½ï¿½',
  `END_TIME` datetime NOT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `DESCRIPTION` varchar(500) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `OPERATOR` varchar(20) NOT NULL COMMENT 'ï¿½Ù°ï¿½ï¿½ï¿½',
  `CONFERENCE_FILE` varchar(500) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½Òª',
  `STATUS` int(2) NOT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='ï¿½ï¿½ï¿½ï¿½ï¿½Â¼';

/*Data for the table `gzsb_conference` */

insert  into `gzsb_conference`(`C_ID`,`TYPE_CODE`,`DEPARTMENT_CODE`,`GZS_OPERATOR`,`MM_ID`,`THEME`,`START_TIME`,`END_TIME`,`DESCRIPTION`,`OPERATOR`,`CONFERENCE_FILE`,`STATUS`) values (31,'typeOfWork','headquarters','Pony',1,'ä¸€ä¸ªäººçš„å­¤å•ä¼šè®®','2019-12-06 00:00:00','2019-12-07 00:00:00','è¿™æ˜¯éº»èŠ±ç–¼ä¸€ä¸ªäººçš„ä¼šè®®','Pony',NULL,0),(32,'typeOfWork','headquarters','giao',1,'ç»Ÿç»Ÿè¿‡æ¥','2020-01-29 00:00:00','2020-01-30 00:00:00','ç´§æ€¥ä¼šè®®','Pony',NULL,1);

/*Table structure for table `gzsb_conference_participant` */

DROP TABLE IF EXISTS `gzsb_conference_participant`;

CREATE TABLE `gzsb_conference_participant` (
  `PP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OPERATOR` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ô±ï¿½Ëºï¿½',
  `C_ID` int(11) DEFAULT NULL,
  `BE_PRESENT` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ï¿½Ç·ñµ½³ï¿½',
  PRIMARY KEY (`PP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½';

/*Data for the table `gzsb_conference_participant` */

insert  into `gzsb_conference_participant`(`PP_ID`,`OPERATOR`,`C_ID`,`BE_PRESENT`) values (52,'Pony',31,0),(53,'Pony',32,0),(54,'kunkun',32,0),(55,'Pony',32,0),(56,'zhangsan',32,0);

/*Table structure for table `gzsb_daily` */

DROP TABLE IF EXISTS `gzsb_daily`;

CREATE TABLE `gzsb_daily` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE_CODE` varchar(255) DEFAULT NULL,
  `OPERATOR` varchar(255) DEFAULT NULL,
  `DAILY_DETAILS` mediumtext,
  `DAILY_SUBMITTIME` datetime DEFAULT NULL,
  `DAILY_UPDATETIME` datetime DEFAULT NULL,
  `DAILY_STARTTIME` datetime DEFAULT NULL,
  `DAILY_ENDTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `gzsb_daily` */

insert  into `gzsb_daily`(`ID`,`TYPE_CODE`,`OPERATOR`,`DAILY_DETAILS`,`DAILY_SUBMITTIME`,`DAILY_UPDATETIME`,`DAILY_STARTTIME`,`DAILY_ENDTIME`) values (1,'dayWork','Pony','123','2019-12-04 16:52:26',NULL,'2019-12-03 00:00:00','2019-12-04 00:00:00'),(5,'weekly','Pony','<p>11</p>','2019-12-05 14:59:13',NULL,'2019-12-16 00:00:00','2019-12-20 00:00:00'),(6,'weekly','Pony','<p>11<img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/3c/pcmoren_wu_org.png\" alt=\"[æ±¡]\" data-w-e=\"1\"></p>','2019-12-05 14:59:39',NULL,'2019-12-16 00:00:00','2019-12-20 00:00:00'),(8,'weekly','Pony','<p><img src=\"data:image/jpeg;base64,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\" style=\"max-width:100%;\"><br></p>','2019-12-05 15:10:51',NULL,'2019-12-03 00:00:00','2019-12-04 00:00:00'),(9,'weekly','Pony','<p><a href=\"\" target=\"_blank\">https://www.qqbf78.com/</a><br></p>','2019-12-05 15:11:55',NULL,'2019-12-03 00:00:00','2019-12-04 00:00:00'),(10,'weekly','Pony','<p><a href=\"\" target=\"_blank\">www.qqbf78.com</a><br></p>','2019-12-05 15:14:34',NULL,'2019-12-03 00:00:00','2019-12-04 00:00:00'),(11,'weekly','Pony','<p><a href=\"\" target=\"_blank\">www.qqbf78.com</a><br></p><table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><th>&nbsp;æˆ‘çš„ç‰¹å‘</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th></tr><tr><td>&nbsp;111</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;222</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;333</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;444</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr></tbody></table><p><br></p>','2019-12-05 15:15:12',NULL,'2019-12-03 00:00:00','2019-12-04 00:00:00'),(14,'dayWork','Pony','<table border=\"1\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><th>&nbsp;å‘¨ä¸€</th><th>&nbsp;å‘¨äºŒ</th><th>&nbsp;\n\nå‘¨ä¸‰</th><th>å‘¨å››&nbsp;&nbsp;&nbsp;</th><th>å‘¨äº”&nbsp;&nbsp;&nbsp;</th></tr><tr><td>&nbsp;1</td><td>&nbsp;2</td><td>&nbsp;3</td><td>&nbsp;4</td><td>&nbsp;5</td></tr><tr><td>&nbsp;1</td><td>&nbsp;7</td><td>&nbsp;8</td><td>&nbsp;9</td><td>&nbsp;10</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr></tbody></table><p><br></p>','2019-12-05 16:33:16',NULL,'2019-12-02 00:00:00','2019-12-03 00:00:00'),(15,'dayWork','Pony','<p><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\">&nbsp;<img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_thumb.gif\" alt=\"[ç¥é©¬]\">&nbsp;</p>','2019-12-05 16:53:33',NULL,'2019-12-03 00:00:00','2019-12-04 00:00:00'),(16,'weekly','Pony','<p><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" data-w-e=\"1\"><br></p>','2019-12-05 17:00:04',NULL,'2019-12-05 00:00:00','2019-12-06 00:00:00'),(17,'dayWork','Pony','<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr></tbody></table><p><br></p>','2019-12-05 17:32:26',NULL,'2019-11-28 00:00:00','2019-12-06 00:00:00'),(18,'dayWork','Pony','<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr></tbody></table><p><br></p>','2019-12-05 17:34:09',NULL,'2019-11-28 00:00:00','2019-12-06 00:00:00'),(19,'weekly','Pony','<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr></tbody></table><p><br></p>','2019-12-05 17:36:20',NULL,'2019-12-03 00:00:00','2019-12-04 00:00:00'),(20,'weekly','Pony','<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr></tbody></table><p><br></p>','2019-12-05 17:36:52',NULL,'2019-12-10 00:00:00','2019-12-12 00:00:00'),(21,'dayWork','Pony','<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr></tbody></table><p><br></p>','2019-12-05 17:37:27',NULL,'2019-12-13 00:00:00','2019-12-14 00:00:00'),(22,'dayWork','Pony','<table border=\"1\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th><th>&nbsp;</th></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr></tbody></table><p><br></p>','2019-12-05 17:37:57',NULL,'2019-12-17 00:00:00','2019-12-18 00:00:00'),(23,'dayWork','jiji','<table border=\"1\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><th>2019/12/05&nbsp;</th></tr><tr><td style=\"text-align: center;\">&nbsp;ä»Šå¤©æ˜¯ä¸ªå¥½æ—¥å­ï¼Œ<br>ä»Šå¤©ä¸Šäº†ä¸€å¤©çš„ç­ï¼Œæˆ‘åˆ’æ°´äº†ä¸€å¤©ï¼Œå¾ˆèˆ’æœï¼Œå¾ˆçˆ½ï¼Œæˆ‘æ˜å¤©è¿˜è¦ç»§ç»­åˆ’æ°´</td></tr></tbody></table><p><br></p>','2019-12-05 18:09:21',NULL,'2019-11-30 00:00:00','2019-12-01 00:00:00'),(24,'dayWork','dajiji','<blockquote><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\">&nbsp;<img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\"><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" style=\"background-color: rgb(255, 255, 255);\">&nbsp;</blockquote>','2019-12-05 18:35:48',NULL,'2019-12-04 00:00:00','2019-12-05 00:00:00');

/*Table structure for table `gzsb_department` */

DROP TABLE IF EXISTS `gzsb_department`;

CREATE TABLE `gzsb_department` (
  `DEPARTMENT_CODE` varchar(50) NOT NULL COMMENT 'ï¿½ï¿½ï¿½Å±ï¿½ï¿½ï¿½',
  `FATHER_CODE` varchar(50) NOT NULL COMMENT 'ï¿½Ï¼ï¿½ï¿½ï¿½ï¿½ï¿½',
  `DEPARTMENT_NAME` varchar(20) NOT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `WORK_TIME_AM` time DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ç¹¤ï¿½ï¿½Ê±ï¿½ï¿½',
  `WORK_TIME_PM` time DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ç¹¤ï¿½ï¿½Ê±ï¿½ï¿½',
  `SORT` int(11) NOT NULL DEFAULT '0' COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  PRIMARY KEY (`DEPARTMENT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ï¿½ï¿½ï¿½ï¿½';

/*Data for the table `gzsb_department` */

insert  into `gzsb_department`(`DEPARTMENT_CODE`,`FATHER_CODE`,`DEPARTMENT_NAME`,`WORK_TIME_AM`,`WORK_TIME_PM`,`SORT`) values ('headquarters','0','å…¬å¸æ€»éƒ¨','14:30:00','14:45:00',0),('personnelMatters','headquarters','äººäº‹éƒ¨','08:00:00','19:15:00',0),('waiJiaoCode','headquarters','å¤–äº¤éƒ¨','08:30:00','20:30:00',0),('workPlan','headquarters','å·¥ä½œä¸€éƒ¨','08:30:00','09:30:00',0);

/*Table structure for table `gzsb_department_position` */

DROP TABLE IF EXISTS `gzsb_department_position`;

CREATE TABLE `gzsb_department_position` (
  `POSITION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEPARTMENT_CODE` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½Å±ï¿½ï¿½ï¿½',
  `POSITION_NAME` varchar(50) NOT NULL COMMENT 'Ö°Î»ï¿½ï¿½ï¿½ï¿½',
  `SORT` int(11) NOT NULL DEFAULT '0' COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  PRIMARY KEY (`POSITION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='ï¿½ï¿½ï¿½ï¿½Ö°Î»';

/*Data for the table `gzsb_department_position` */

insert  into `gzsb_department_position`(`POSITION_ID`,`DEPARTMENT_CODE`,`POSITION_NAME`,`SORT`) values (5,'personnelMatters','äººäº‹éƒ¨é•¿',0),(7,'headquarters','CEO',0),(9,'workPlan','å·¥ä½œä¸€éƒ¨éƒ¨é•¿',0),(10,'waiJiaoCode','å¤–äº¤éƒ¨é•¿',0),(11,'headquarters','å‘˜å·¥',0);

/*Table structure for table `gzsb_email_account` */

DROP TABLE IF EXISTS `gzsb_email_account`;

CREATE TABLE `gzsb_email_account` (
  `ACCOUNT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(50) NOT NULL COMMENT 'USERNAME',
  `PASSWORD` varchar(50) NOT NULL COMMENT 'PASSWORD',
  `SENDER` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `SMTP_ADDRESS` varchar(500) DEFAULT NULL COMMENT 'SMTP_ADDRESS',
  `SMTP_PORT` varchar(50) DEFAULT NULL COMMENT 'SMTP_PORT',
  `REMARK` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ACCOUNT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ï¿½ï¿½ï¿½ï¿½ï¿½Ëºï¿½';

/*Data for the table `gzsb_email_account` */

/*Table structure for table `gzsb_emal` */

DROP TABLE IF EXISTS `gzsb_emal`;

CREATE TABLE `gzsb_emal` (
  `EMAIL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE_CODE` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'TYPE_CODE',
  `OPERATOR` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ô±ï¿½Ëºï¿½',
  `PLAN_STATUS_CODE` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ï¿½Æ»ï¿½×´Ì¬ï¿½ï¿½ï¿½ï¿½',
  `THEME` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `CONTETNT` longtext COLLATE utf8mb4_bin COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `SEND_TIME` datetime DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `RECEIVE` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ï¿½Õ¼ï¿½ï¿½ï¿½',
  `STATUS` varchar(10) COLLATE utf8mb4_bin DEFAULT '0',
  PRIMARY KEY (`EMAIL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='EMAIL';

/*Data for the table `gzsb_emal` */

insert  into `gzsb_emal`(`EMAIL_ID`,`TYPE_CODE`,`OPERATOR`,`PLAN_STATUS_CODE`,`THEME`,`CONTETNT`,`SEND_TIME`,`RECEIVE`,`STATUS`) values (2,'leader','Pony','email_1','1','<p><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" data-w-e=\"1\"><br></p>','2019-12-17 11:27:10','kunkun','1'),(3,'leader','Pony','email_1','1','<p><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[èˆ”å±]\" data-w-e=\"1\"><br></p>','2019-12-17 11:27:10','zhangsan','0'),(4,'leader','Pony','email_1','1','sb','2001-01-01 00:00:00','giao','1'),(5,'colleague','Pony','email_1','1','<p>1<br></p>','2019-12-19 15:42:52','giao','1'),(6,'colleague','Pony','email_1','1','<p>1<br></p>','2019-12-19 15:42:52','kunkun','1'),(7,'colleague','Pony','email_1','1','<p>1<br></p>','2019-12-19 15:42:52','zhangsan','0'),(8,'colleague','Pony','email_1','1','<p>1?<br></p>','2019-12-19 15:52:12','giao','1'),(9,'colleague','Pony','email_1','1','<p>1?<br></p>','2019-12-19 15:52:12','kunkun','1'),(10,'colleague','Pony','email_1','1','<p>1?<br></p>','2019-12-19 15:52:12','zhangsan','0'),(11,'colleague','Pony','email_1','123','<p>123</p>','2020-01-08 09:42:37','giao','1'),(12,'colleague','Pony','email_1','123','<p>123</p>','2020-01-08 09:42:37','kunkun','1'),(13,'colleague','Pony','email_1','123','<p>123</p>','2020-01-08 09:42:37','zhangsan','0'),(14,'colleague','Pony','email_0','ä½ æ‡‚å¾—','<p>ä»Šæ™šè€åœ°æ–¹è§</p>','2021-01-02 00:02:00','kunkun','0');

/*Table structure for table `gzsb_leave_info` */

DROP TABLE IF EXISTS `gzsb_leave_info`;

CREATE TABLE `gzsb_leave_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) DEFAULT NULL,
  `leave_msg` varchar(255) DEFAULT NULL,
  `user_code` varchar(50) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `real_name` varchar(50) DEFAULT NULL,
  `project_remarks` varchar(50) DEFAULT NULL,
  `hr_remarks` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

/*Data for the table `gzsb_leave_info` */

insert  into `gzsb_leave_info`(`id`,`status`,`leave_msg`,`user_code`,`start_time`,`end_time`,`real_name`,`project_remarks`,`hr_remarks`) values (89,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(90,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(91,'leave_3','æˆ‘å°±è¦è¯·å‡','Pony','2020-01-19 17:49:14','2020-01-19 17:49:14','éº»èŠ±ç–¼','123','123'),(92,'leave_3','æˆ‘å°±è¦è¯·å‡','Pony','2020-01-19 18:03:58','2020-01-19 18:03:58','éº»èŠ±ç–¼','1123','123'),(93,'leave_3','æˆ‘å°±è¦è¯·å‡','Pony','2020-01-19 19:20:04','2020-01-19 19:20:04','éº»èŠ±ç–¼','123',NULL),(94,'leave_2','å•Šé›…è ›è¶',NULL,NULL,NULL,NULL,'å¥½ï¼Œæˆ‘çœ‹å¥½ä½ ï¼Œæˆ‘åŒæ„',NULL),(95,'leave_2','å•Šé›…è ›è¶23333333',NULL,NULL,NULL,NULL,'å¥½ï¼Œæˆ‘çœ‹å¥½ä½ ï¼Œæˆ‘åŒæ„',NULL),(96,'leave_3','å•Šé›…è ›è¶23333333',NULL,NULL,NULL,NULL,'','gun\nå®¡æ ¸æ—¶é—´ï¼š2020-01-28 13:19:08'),(97,'leave_3','123123',NULL,NULL,NULL,NULL,'',NULL),(98,'leave_3','456456',NULL,NULL,NULL,NULL,'æ»š\nå®¡æ ¸æ—¶é—´ï¼š2020-01-28 12:43:35',NULL),(99,'leave_1','456456',NULL,NULL,NULL,NULL,'åŒæ„\nå®¡æ ¸æ—¶é—´ï¼š2020-01-28 18:16:52',NULL),(100,'leave_1','456456',NULL,NULL,NULL,NULL,'123\nå®¡æ ¸æ—¶é—´ï¼š2020-01-28 17:58:04',NULL),(101,'leave_0','456456',NULL,NULL,NULL,NULL,NULL,NULL),(102,'leave_3','456456',NULL,NULL,NULL,NULL,'123	å®¡æ ¸æ—¶é—´ï¼šSat Jan 25 10:40:34 CST 2020','ä¸åŒæ„\nå®¡æ ¸æ—¶é—´ï¼š2020-01-28 13:19:15'),(103,'leave_3','456456',NULL,NULL,NULL,NULL,'1\nå®¡æ ¸æ—¶é—´ï¼š2020-01-25 10:43:03','æ‹’ç»\nå®¡æ ¸æ—¶é—´ï¼š2020-01-28 13:19:20'),(104,'leave_1','456456',NULL,NULL,NULL,NULL,'\nå®¡æ ¸æ—¶é—´ï¼š2020-01-28 18:00:07',NULL),(105,'leave_1','456456',NULL,NULL,NULL,NULL,'\nå®¡æ ¸æ—¶é—´ï¼š2020-01-28 18:00:09',NULL),(106,'leave_2','è€å­è¦è¯·å‡','Pony','2020-01-20 08:00:00','2020-01-21 08:00:00','éº»èŠ±ç–¼','ç»™è€å­åŒæ„\nå®¡æ ¸æ—¶é—´ï¼š2020-01-28 18:03:05','å°±ç®—ä½ æ˜¯éº»èŠ±ç–¼æˆ‘ä¹Ÿä¸åŒæ„\nå®¡æ ¸æ—¶é—´ï¼š2020-01-28 18:08:08'),(107,'leave_1','æœ•è¦è¯·å‡','kunkun','2020-01-27 08:00:00','2020-01-28 08:00:00','è”¡å¾å¤','å¥½çš„åŒæ„\nå®¡æ ¸æ—¶é—´ï¼š2020-01-28 17:58:20',NULL);

/*Table structure for table `gzsb_metting_room` */

DROP TABLE IF EXISTS `gzsb_metting_room`;

CREATE TABLE `gzsb_metting_room` (
  `MM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `METTING_ROOM_NAME` varchar(50) DEFAULT NULL,
  `METTING_ADDRESS` varchar(50) DEFAULT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`MM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½';

/*Data for the table `gzsb_metting_room` */

insert  into `gzsb_metting_room`(`MM_ID`,`METTING_ROOM_NAME`,`METTING_ADDRESS`,`DESCRIPTION`) values (1,'ä¸€çº§ä¼šè®®å®¤','101','å°å‹ä¼šè®®å®¤'),(2,'äºŒçº§ä¼šè®®å®¤','102','ä¸­å‹ä¼šè®®å®¤'),(3,'ä¸‰çº§ä¼šè®®å®¤','103','å¤§å‹ä¼šè®®å®¤');

/*Table structure for table `gzsb_operator` */

DROP TABLE IF EXISTS `gzsb_operator`;

CREATE TABLE `gzsb_operator` (
  `OPERATOR` varchar(50) NOT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ô±ï¿½Ëºï¿½',
  `PLAN_STATUS_CODE` varchar(20) DEFAULT NULL COMMENT 'ï¿½Æ»ï¿½×´Ì¬ï¿½ï¿½ï¿½ï¿½',
  `PASSWORD` varchar(100) NOT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ô±ï¿½ï¿½ï¿½ï¿½',
  `PASSWORD_SALT` varchar(50) NOT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `CREATE_TIME` datetime NOT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `REAL_NAME` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½Êµï¿½ï¿½ï¿½ï¿½',
  `JOB_NUM` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `PHONE` varchar(20) DEFAULT NULL COMMENT 'ï¿½Ö»ï¿½ï¿½ï¿½',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  PRIMARY KEY (`OPERATOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ï¿½ï¿½ï¿½ï¿½Ô±';

/*Data for the table `gzsb_operator` */

insert  into `gzsb_operator`(`OPERATOR`,`PLAN_STATUS_CODE`,`PASSWORD`,`PASSWORD_SALT`,`CREATE_TIME`,`REAL_NAME`,`JOB_NUM`,`PHONE`,`EMAIL`) values ('giao','operator_0','e10adc3949ba59abbe56e057f20f883e','','2019-12-06 16:36:14','é»‘çŒ«è­¦é•¿','102','18888888888','giao@qq.com'),('kunkun','operator_0','e10adc3949ba59abbe56e057f20f883e','','2019-12-06 16:25:25','è”¡å¾å¤','001','13838384380','kunkun@qq.com'),('Pony','operator_0','e10adc3949ba59abbe56e057f20f883e','','2019-12-01 15:27:42','éº»èŠ±ç–¼','000','18888888888','6666666@qq.com'),('zhangsan','operator_0','e10adc3949ba59abbe56e057f20f883e','','2019-12-06 16:49:09','å¼ ä¸‰','104','15555555555','123@qq.com');

/*Table structure for table `gzsb_operator_position` */

DROP TABLE IF EXISTS `gzsb_operator_position`;

CREATE TABLE `gzsb_operator_position` (
  `OP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `POSITION_ID` int(11) DEFAULT NULL,
  `OPERATOR` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ô±ï¿½Ëºï¿½',
  PRIMARY KEY (`OP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='Ô±ï¿½ï¿½Ö°Î»';

/*Data for the table `gzsb_operator_position` */

insert  into `gzsb_operator_position`(`OP_ID`,`POSITION_ID`,`OPERATOR`) values (12,7,'Pony'),(14,10,'kunkun'),(15,10,'giao'),(16,11,'zhangsan');

/*Table structure for table `gzsb_operator_role` */

DROP TABLE IF EXISTS `gzsb_operator_role`;

CREATE TABLE `gzsb_operator_role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OPERATOR` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ô±ï¿½Ëºï¿½',
  `ROLE_CODE` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½É«ï¿½ï¿½ï¿½ï¿½',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COMMENT='ï¿½ï¿½ï¿½ï¿½Ô±ï¿½ï¿½É«';

/*Data for the table `gzsb_operator_role` */

insert  into `gzsb_operator_role`(`ID`,`OPERATOR`,`ROLE_CODE`) values (81,'Pony','projectManager'),(82,'Pony','admin'),(85,'kunkun','projectManager'),(86,'giao','hrManager'),(87,'zhangsan','staff');

/*Table structure for table `gzsb_permission` */

DROP TABLE IF EXISTS `gzsb_permission`;

CREATE TABLE `gzsb_permission` (
  `PERMISSION_CODE` varchar(50) NOT NULL COMMENT 'È¨ï¿½Ş±ï¿½ï¿½ï¿½',
  `PERMISSION_NAME` varchar(50) NOT NULL COMMENT 'È¨ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `PERMISSION_URL` varchar(100) NOT NULL COMMENT 'È¨ï¿½ï¿½Â·ï¿½ï¿½',
  `FATHER_CODE` varchar(50) NOT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `SORT` int(11) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  PRIMARY KEY (`PERMISSION_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='È¨ï¿½ï¿½';

/*Data for the table `gzsb_permission` */

insert  into `gzsb_permission`(`PERMISSION_CODE`,`PERMISSION_NAME`,`PERMISSION_URL`,`FATHER_CODE`,`SORT`) values ('basics','åŸºç¡€','1','0',1),('claimTask','è®¤é¢†ä»»åŠ¡','1','0',1),('conference','ä¼šè®®ç®¡ç†','1','0',1),('conference:find','æŸ¥çœ‹ä¼šè®®è®°å½•','1','conference',1),('conference:reservation','ä¼šè®®å®¤é¢„è®¢','1','conference',1),('daily','æ—¥æŠ¥ç®¡ç†','1','0',1),('daily:department','æŸ¥çœ‹éƒ¨é—¨æ—¥æŠ¥','1','daily',1),('daily:findAll','æŸ¥çœ‹æ‰€æœ‰æ—¥æŠ¥','1','daily',1),('department','éƒ¨é—¨ç®¡ç†','1','0',1),('department:add','æ·»åŠ éƒ¨é—¨','1','department',1),('department:addPosition','æ·»åŠ éƒ¨é—¨èŒä½','1','department',1),('department:find','æŸ¥çœ‹éƒ¨é—¨','1','department',1),('department:update','ä¿®æ”¹éƒ¨é—¨','1','department',1),('email','æŸ¥çœ‹é‚®ä»¶','1','0',123),('leaveapproval','å¾…å®¡æ‰¹ä»»åŠ¡','1','0',1),('leavequery','è¯·å‡è®°å½•','1','0',1),('mettingRoom','ä¼šè®®å®¤ç®¡ç†','1','0',1),('mettingRoom:add','æ–°å¢ä¼šè®®å®¤','1','mettingRoom',1),('mettingRoom:delete','åˆ é™¤ä¼šè®®å®¤','1','mettingRoom',1),('mettingRoom:find','æŸ¥è¯¢ä¼šè®®å®¤','1','mettingRoom',1),('mettingRoom:update','æ›´æ–°ä¼šè®®å®¤','1','mettingRoom',1),('permission','æƒé™ç®¡ç†','1','0',1),('permission:add','æ–°å¢æƒé™','1','permission',1),('permission:delete','åˆ é™¤æƒé™','1','permission',1),('permission:find','æŸ¥çœ‹æƒé™','1','permission',0),('plan','è®¡åˆ’ç®¡ç†','1','0',1),('plan:delete','åˆ é™¤è®¡åˆ’','1','plan',1),('plan:find','æŸ¥çœ‹è®¡åˆ’','1','plan',1),('role','è§’è‰²ç®¡ç†','url','0',0),('role:add','æ·»åŠ è§’è‰²','1','role',1),('role:delete','åˆ é™¤è§’è‰²','1','role',1),('role:find','æŸ¥çœ‹è§’è‰²','1','role',1),('role:permissionAdd','æ·»åŠ è§’è‰²æƒé™','1','role',1),('sign','è€ƒå‹¤ç®¡ç†','1','0',1),('sign:find','æŸ¥çœ‹è€ƒå‹¤','1','sign',1),('user','ç”¨æˆ·ç®¡ç†','url','0',0),('user:add','æ·»åŠ ç”¨æˆ·','1','user',0),('user:delete','åˆ é™¤ç”¨æˆ·','url','user',0),('user:find','æŸ¥çœ‹ç”¨æˆ·','1','user',1),('user:update','æ›´æ–°ç”¨æˆ·','1','user',1);

/*Table structure for table `gzsb_plan` */

DROP TABLE IF EXISTS `gzsb_plan`;

CREATE TABLE `gzsb_plan` (
  `PLAN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEPARTMENT_CODE` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½Å±ï¿½ï¿½ï¿½',
  `OPERATOR` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ô±ï¿½Ëºï¿½',
  `PLAN_STATUS_CODE` varchar(10) DEFAULT NULL COMMENT 'ï¿½Æ»ï¿½×´Ì¬ï¿½ï¿½ï¿½ï¿½',
  `TYPE_CODE` varchar(50) DEFAULT NULL COMMENT 'TYPE_CODE',
  `PLAN_CONTENT` varchar(500) DEFAULT NULL COMMENT 'ï¿½Æ»ï¿½ï¿½ï¿½ï¿½ï¿½',
  `PLAN_TIME` datetime DEFAULT NULL COMMENT 'ï¿½Æ»ï¿½Ê±ï¿½ï¿½',
  `DELAY_DAYS` int(11) DEFAULT '0',
  `OVERTIME_DAYS` int(11) DEFAULT '0',
  PRIMARY KEY (`PLAN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='ï¿½Æ»ï¿½';

/*Data for the table `gzsb_plan` */

insert  into `gzsb_plan`(`PLAN_ID`,`DEPARTMENT_CODE`,`OPERATOR`,`PLAN_STATUS_CODE`,`TYPE_CODE`,`PLAN_CONTENT`,`PLAN_TIME`,`DELAY_DAYS`,`OVERTIME_DAYS`) values (7,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(12,'diaomaoCode','jj','plan_2','workPlan','dadjajdlkajdlka','2019-11-25 00:00:00',2,11),(13,'diaomaoCode','jj','plan_2','workPlan','dada','2019-11-23 00:00:00',0,13),(14,'diaomaoCode','jj','plan_2','workPlan','1','2019-11-22 00:01:00',0,14),(17,'diaomaoCode','dajiji','plan_2','personalPlan','121313','2019-11-23 00:00:00',0,13),(18,'diaomaoCode','jj','plan_2','personalPlan','asd','2019-11-27 00:00:00',1,9),(19,'diaomaoCode','jj','plan_2','personalPlan','123','2019-11-30 00:00:00',1,6),(20,'diaomao01','jiji','plan_2','workPlan','è¿™æ˜¯æˆ‘çš„ä¸ªäººè®¡åˆ’','2019-12-05 00:00:00',2,1),(21,'headquarters','Pony','plan_2','workPlan','1','2019-12-16 00:00:00',0,43),(22,'headquarters','Pony','plan_2','workPlan','1','2019-12-31 00:00:00',0,28);

/*Table structure for table `gzsb_process` */

DROP TABLE IF EXISTS `gzsb_process`;

CREATE TABLE `gzsb_process` (
  `PROCESS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE_CODE` varchar(50) DEFAULT NULL COMMENT 'TYPE_CODE',
  `PLAN_STATUS_CODE` varchar(5) DEFAULT NULL COMMENT 'ï¿½Æ»ï¿½×´Ì¬ï¿½ï¿½ï¿½ï¿½',
  `THEME` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `PROCESS_TYPE` varchar(5) DEFAULT NULL,
  `APPLY_TIME` datetime DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  PRIMARY KEY (`PROCESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½';

/*Data for the table `gzsb_process` */

/*Table structure for table `gzsb_role` */

DROP TABLE IF EXISTS `gzsb_role`;

CREATE TABLE `gzsb_role` (
  `ROLE_CODE` varchar(50) NOT NULL COMMENT 'ï¿½ï¿½É«ï¿½ï¿½ï¿½ï¿½',
  `ROLE_NAME` varchar(50) NOT NULL COMMENT 'ï¿½ï¿½É«ï¿½ï¿½ï¿½ï¿½',
  PRIMARY KEY (`ROLE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ï¿½ï¿½É«';

/*Data for the table `gzsb_role` */

insert  into `gzsb_role`(`ROLE_CODE`,`ROLE_NAME`) values ('admin','è¶…çº§ç®¡ç†å‘˜'),('hrManager','äººäº‹ç»ç†'),('projectManager','é¡¹ç›®ç»ç†'),('staff','å°å‘˜å·¥');

/*Table structure for table `gzsb_role_permission` */

DROP TABLE IF EXISTS `gzsb_role_permission`;

CREATE TABLE `gzsb_role_permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PERMISSION_CODE` varchar(50) DEFAULT NULL COMMENT 'È¨ï¿½Ş±ï¿½ï¿½ï¿½',
  `ROLE_CODE` varchar(50) DEFAULT NULL COMMENT 'ï¿½ï¿½É«ï¿½ï¿½ï¿½ï¿½',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8 COMMENT='ï¿½ï¿½É«È¨ï¿½ï¿½';

/*Data for the table `gzsb_role_permission` */

insert  into `gzsb_role_permission`(`ID`,`PERMISSION_CODE`,`ROLE_CODE`) values (67,'user','boss'),(68,'user:delete','boss'),(69,'user:update','boss'),(70,'sign','boss'),(71,'planSystem','boss'),(72,'role','boss'),(73,'permission','boss'),(74,'mettingRoom','boss'),(75,'leaveapproval','boss'),(76,'leavequery','boss'),(77,'department','boss'),(78,'daily','boss'),(79,'conference','boss'),(81,'user:add','boss'),(82,'email','boss'),(167,'email','staff'),(168,'leavequery','staff'),(235,'conference','admin'),(236,'daily','admin'),(237,'department','admin'),(238,'leaveapproval','admin'),(239,'leavequery','admin'),(240,'mettingRoom','admin'),(241,'permission','admin'),(242,'plan','admin'),(243,'role','admin'),(244,'sign','admin'),(245,'user','admin'),(246,'user:delete','admin'),(247,'user:update','admin'),(248,'email','admin'),(249,'conference:find','admin'),(250,'department:find','admin'),(251,'mettingRoom:find','admin'),(252,'permission:find','admin'),(253,'plan:find','admin'),(254,'sign:find','admin'),(255,'role:find','admin'),(256,'user:find','admin'),(257,'basics','admin'),(258,'daily:findAll','admin'),(259,'claimTask','admin'),(260,'conference:reservation','admin'),(261,'user','hrManager'),(262,'leavequery','hrManager'),(263,'email','hrManager'),(264,'role:find','hrManager'),(265,'plan:find','hrManager'),(266,'permission:find','hrManager'),(267,'mettingRoom:find','hrManager'),(268,'leaveapproval','hrManager'),(269,'daily:department','hrManager'),(270,'daily','hrManager'),(271,'claimTask','hrManager'),(272,'email','projectManager'),(273,'leaveapproval','projectManager'),(274,'leavequery','projectManager'),(275,'claimTask','projectManager');

/*Table structure for table `gzsb_status` */

DROP TABLE IF EXISTS `gzsb_status`;

CREATE TABLE `gzsb_status` (
  `PLAN_STATUS_CODE` varchar(15) NOT NULL COMMENT 'ï¿½Æ»ï¿½×´Ì¬ï¿½ï¿½ï¿½ï¿½',
  `DESCRIPTION` varchar(500) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  PRIMARY KEY (`PLAN_STATUS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ï¿½Æ»ï¿½×´Ì¬';

/*Data for the table `gzsb_status` */

insert  into `gzsb_status`(`PLAN_STATUS_CODE`,`DESCRIPTION`) values ('attendance_0','æ­£å¸¸'),('attendance_1','è¿Ÿåˆ°'),('attendance_2','æ—©é€€'),('attendance_3','æ—·å·¥'),('attendance_4','è¯·å‡'),('attendance_5','ä¸‹ç­æœªæ‰“å¡'),('bulletin_0','æ™®é€š'),('bulletin_1','é‡è¦'),('bulletin_2','ç´§æ€¥'),('email_0','æœªå‘é€'),('email_1','å·²å‘é€'),('leave_0','å¾…äººäº‹å®¡æ ¸'),('leave_1','å¾…é¡¹ç›®ç»ç†å®¡æ ¸'),('leave_2','å·²åŒæ„'),('leave_3','å·²æ‹’ç»'),('operator_0','æ­£å¸¸'),('operator_1','ç¦ç”¨'),('plan_0','è¿›è¡Œä¸­'),('plan_1','å®Œæˆ'),('plan_2','è¶…æ—¶');

/*Table structure for table `gzsb_type` */

DROP TABLE IF EXISTS `gzsb_type`;

CREATE TABLE `gzsb_type` (
  `TYPE_CODE` varchar(50) NOT NULL COMMENT 'TYPE_CODE',
  `FATHER_CODE` varchar(50) NOT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `DESCRIPTION` varchar(500) DEFAULT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  PRIMARY KEY (`TYPE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ï¿½ï¿½ï¿½ï¿½';

/*Data for the table `gzsb_type` */

insert  into `gzsb_type`(`TYPE_CODE`,`FATHER_CODE`,`DESCRIPTION`) values ('attendance','0','è€ƒå‹¤ç±»å‹'),('bulletin','0','å…¬å‘Š'),('colleague','email','åŒäº‹é‚®ä»¶'),('company','bulletin','å…¬å¸å…¬å‘Š'),('conference','0','ä¼šè®®è®°å½•'),('daily','0','å·¥ä½œæŠ¥è¡¨'),('dayWork','daily','æ—¥æŠ¥'),('department','bulletin','éƒ¨é—¨å…¬å‘Š'),('email','0','é‚®ä»¶'),('goWork','attendance','ä¸Šç­'),('leader','email','é¢†å¯¼é‚®ä»¶'),('offWork','attendance','ä¸‹ç­'),('personalPlan','plan','ä¸ªäººä»»åŠ¡'),('plan','0','è®¡åˆ’'),('typeOfWork','conference','å·¥ä½œç±»å‹'),('weekly','daily','å‘¨æŠ¥'),('workPlan','plan','å·¥ä½œä»»åŠ¡');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
