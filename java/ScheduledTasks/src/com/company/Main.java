package com.company;

import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class Main {

//    public static void main(String[] args) {
//	// write your code here
//    }


//    public class ScheduledTasks {

        // @Autowired
        // private static SimpMessageSendingOperations messagingTemplate;


        // @Autowired
        // private static SensorMapper sensorMapper;


        private static Map<String, Object> sensor_id_map;

        private static ArrayList<String> fileHeaderList;




        public static void main(String[] args) {
            // Prints "Hello, World" to the terminal window.
            System.out.println("Hello, World");

            for(int i = 0; i < 10000; i++) {
                task1();
            }
        }


        //    @Scheduled(fixedDelay = 30000)
        // @Scheduled(cron = "0/30 * * * * ?") // 매 0초,매30초마다 기동
        public static void task1() {
            // System.out.println("The current date (1) : " + LocalDateTime.now());

            // region 센서 이름/ID Map 초기화
            if (null == sensor_id_map) {
                // region 센서 목록 DB 호출
                // getSensorList(false);
                // endregion
            }
            // endregion

            FileProcess();

            // ResultListVO resultListVO = new ResultListVO();
            // Map<String, Object> parameter = new HashMap<String, Object>();
            // parameter.put("productionLogListSortItem", "production_log_id");
            // parameter.put("productionLogListSortDirection", "desc");

            // Messages messages = new MessagesJsonImpl();
            //resultListVO = product_logService.selectProductionLogList(parmeter, messages);

            //product_logService.insertProductionLog(parameter);

        }

        public static void getSensorList(boolean isRefresh) {
            if (isRefresh && null != sensor_id_map) {
                sensor_id_map.clear();
            }

            // region 센서 목록 DB 호출
            Map<String, Object> sensor_param = new HashMap<>();
            sensor_param.put("pageNum", 1);
            sensor_param.put("pageCon", 1000);
            sensor_param.put("sortItem", "sensor_id");
            sensor_param.put("sortDirection", "ASC");
            // List<Object> sensorList = sensorMapper.selectSensor(sensor_param);
            // endregion

//            if (null != sensorList && 0 < sensorList.size()) {
//                Map<String, Object> tempMap = new HashMap<>();
//
//                // region 센서 목록 리스트를 키:센서이름/값:센서ID 의 Map으로 변환
//                for (Object object : sensorList) {
//                    Map<String, Object> mapObject = (Map<String, Object>)object;
//                    tempMap.put(
//                            mapObject.getOrDefault("sensor_name", "").toString(),
//                            mapObject.getOrDefault("sensor_id", "0")
//                    );
//                }
//                sensor_id_map = tempMap;
//                // endregion
//            }
        }

        public static void LocationWrite(String fileName, int loc) {
            File file = new File("c:/TREND/LOG1/location.txt");
            BufferedWriter outFile = null;
            try{
                outFile = new BufferedWriter((new FileWriter(file)));

                // region 미사용 구문
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
                Calendar c1 = Calendar.getInstance();
                String strToday = sdf.format(c1.getTime());
                // endregion

                String str = fileName + " " + loc;
                outFile.write(str);
                outFile.flush();

            } catch (Exception e) {
                e.printStackTrace();
            }
            finally {
                if(outFile != null)
                try{
                    outFile.close();
                }
                catch (Exception ee){
                    ee.printStackTrace();
                }
            }
        }

        public static void LocationRead(StringBuilder fileName, int[] loc) {
            BufferedReader inFile = null;
            BufferedWriter outFile = null;
            try {
                File file = new File("c:/TREND/LOG1/location.txt");
                if (file.exists()) {
                    // 파일 존재
                    inFile = new BufferedReader(new FileReader(file));
                    String sLine = null;
                    sLine = inFile.readLine();
                    System.out.println(sLine);

                    if(sLine == null || sLine == "") {
                        // region location 파일에 내용이 없으면 현재날짜, 0을 입력 후 종료
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
                        Calendar c1 = Calendar.getInstance();
                        String strToday = sdf.format(c1.getTime());
                        fileName.delete(0, fileName.length());
                        fileName.append(strToday);
                        loc[0] = 0;

//                        inFile.close();
                        LocationWrite(fileName.toString(), loc[0]);

                        return;
                        // endregion
                    }
                    String[] arr = sLine.split(" ");

                    if (arr.length > 1) {
                        fileName.append(arr[0]);
                        loc[0] = Integer.parseInt(arr[1]);
                    }
//                    inFile.close();
                } else {
                    // 파일 미존재

                    System.out.println("Absolute File:" + file.getAbsolutePath() + " IS NOT EXIST ===============================");

                    // region location 파일 신규 생성
                    file.createNewFile();
                    outFile = new BufferedWriter((new FileWriter(file)));

                    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
                    Calendar c1 = Calendar.getInstance();
                    String strToday = sdf.format(c1.getTime());

                    String str = strToday + " " + "0";
                    outFile.write(str);

                    fileName.append(str);
                    loc[0] = 0;

//                    outFile.close();
                    // endregion
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            finally {
                if(inFile != null)
                try{
                    inFile.close();
                }
                catch (Exception ee){
                    ee.printStackTrace();
                }

                if(outFile != null)
                try{
                    outFile.close();
                }
                catch (Exception ee){
                    ee.printStackTrace();
                }
            }
        }

        public static void OneDaySkip(StringBuilder fileName, int[] loc) {
            SimpleDateFormat formDate = new SimpleDateFormat("yyyyMMdd");
            Date formatDate = null;
            try {
                formatDate = formDate.parse(fileName.toString());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            Calendar cal = Calendar.getInstance();
            cal.setTime(formatDate);
            cal.add(Calendar.DATE, 1);
            String nextDay = formDate.format(cal.getTime());

            fileName.delete(0, fileName.length());
            fileName.append(nextDay);


            loc[0] = 0;
            LocationWrite(fileName.toString(), loc[0]);

            fileHeaderList = null;
        }


        public static void FileProcess() {
            StringBuilder fileName = new StringBuilder();
            int[] loc = new int[1];
            LocationRead(fileName, loc);

            long dataFileLength = 0;
            long pos = 0;
            RandomAccessFile dataFile = null;
            try {
                String fullfName = String.format("c:/TREND/LOG1/%s.txt", fileName);

                dataFile = new RandomAccessFile(fullfName, "r");

                dataFileLength = dataFile.length();
                if (dataFileLength - loc[0] < 3) {
                    OneDaySkip(fileName, loc);
                    return;
                }

                pos = loc[0];

                byte[] buff = new byte[2048];
                byte readBuff = ' ';
                int count = 0;
                int idx = 0;

                //region file header get
                long tempPos = 0;
                if (null == fileHeaderList)
                while (pos == 0) {
                    dataFile.seek(tempPos);

                    if ((readBuff = dataFile.readByte()) == '\r') {
                        String t = new String(buff);
                        t.trim();
                        t = t.replace('\n', ' ');
                        t = t.trim();

                        if (tempPos > 90) {
                        } else {
                            // 첫번째 줄(파일 헤더)
                                String sensorNames = t.substring(3).trim();
                                String[] strArrSensorHeaderList = sensorNames.split("\t");
                                fileHeaderList = new ArrayList(Arrays.asList(strArrSensorHeaderList));
                            Arrays.fill(buff, (byte) 0);
                            idx = 0;
                            break;
                        }

                        Arrays.fill(buff, (byte) 0);
                        idx = 0;
                    } else {
                        buff[idx++] = readBuff;
                        tempPos++;
                    }
                }
                //endregion

                while (true) {
                    dataFile.seek(pos);

                    if ( (dataFileLength == pos)  || (readBuff = dataFile.readByte()) == '\r') {
                        String t = new String(buff);
                        t.trim();
                        t = t.replace('\n', ' ');
                        t = t.trim();

                        if (pos > 90) {
                            // 두번째 줄(센서 데이터)
                            if(dataFileLength != pos) pos++;
                            LocationWrite(fileName.toString(), (int) pos);
                            Process(t, fileHeaderList);
                        }
                        count++;

                        System.out.println(t);
                        Arrays.fill(buff, (byte) 0);
                        pos++;

                        if (count > 9)
                            break;

                        idx = 0;
                        continue;
                    } else {
                        buff[idx++] = readBuff;
                        pos++;
                    }
                }

            } catch (Exception e) {
//                e.printStackTrace();

                LocationWrite(fileName.toString(), (int) pos);
                try {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
                    Calendar c1 = Calendar.getInstance();
                    String strToday = sdf.format(c1.getTime());

                    int ret = strToday.compareTo(fileName.toString());
                    if (strToday.compareTo(fileName.toString()) >= 1) {
                        OneDaySkip(fileName, loc);
                    }
                } catch (Exception ee) {
                    ee.printStackTrace();
                }
            }
            finally {
                if(dataFile != null){
                    try {
                        dataFile.close();
                    }catch (Exception e1){
                        e1.printStackTrace();
                    }
                }
            }
        }

        public static void Process(String t, ArrayList<String> fileHeaderList) {
            String time = t.substring(0, 19);
            time = time.trim();
            System.out.println("time = " + time);

            String sensors = t.substring(20, t.length());

            String[] sarr = sensors.split("\t");

            // region DB에 입력할 센서로그 데이터 조립
            Map<String, Object> logParam = new HashMap<>();
            List<Map<String, Object>> logList = new ArrayList<>();
            logParam.put("logList", logList);

            try{
                for (int index = 0; index < sarr.length; index++) {
                    Map<String, Object> logObject = new HashMap<>();
                    logObject.put("sensor_id", sensor_id_map.get(fileHeaderList.get(index)));
                    if (null == sensor_id_map.get(fileHeaderList.get(index))) {
                        continue;
                    }
                    logObject.put("temperature", sarr[index]);
                    logObject.put("sensing_time", time);
                    logObject.put("etc", "");
                    logList.add(logObject);
                }
                // endregion

                // DB에 입력
//            staticProductionLogMapper.insertProductLog(logParam);
            }
            catch(Exception e){
                // e.printStackTrace();
            }
        }

//    }
}
