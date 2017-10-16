package com.ictwsn.util.rxtx;

import gnu.io.CommPortIdentifier;
import gnu.io.SerialPort;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.Enumeration;
public class ArduinoSerial {
    private SerialPort serialPort;
    private InputStream in;
    private OutputStream out;
    public ArduinoSerial(SerialPort serialPort) throws IOException {
        this.serialPort = serialPort;
        this.in = serialPort.getInputStream();// 得到输入流
        this.out = serialPort.getOutputStream();// 得到输出流
    }
    public void read() {
        try {
            // 进行输入输出操作
            BufferedReader reader = new BufferedReader(new InputStreamReader(in));
            String line = null;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void write() throws InterruptedException {
        try {
            Thread.sleep(2000);// 链接后暂停2秒再继续执行
            System.out.println("connected!");
            // 进行输入输出操作
            OutputStreamWriter writer = new OutputStreamWriter(out);
            BufferedWriter bw = new BufferedWriter(writer);
            for (int i = 0; i < 3; i++) {
                bw.write("a");
                bw.flush();
            }
            bw.close();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void close() throws IOException {
        in.close();
        out.close();
    }
    public static void main(String[] args) {
        try {
            System.setProperty("gnu.io.rxtx.SerialPorts", "/dev/ttyACM0");
            Enumeration portList = CommPortIdentifier.getPortIdentifiers();
            CommPortIdentifier portId = null;
            while (portList.hasMoreElements()) {
                CommPortIdentifier tmpPortId = (CommPortIdentifier) portList.nextElement();
                System.out.println(tmpPortId.getName());
                // 如果端口类型是串口则判断名称
                if (tmpPortId.getPortType() == CommPortIdentifier.PORT_SERIAL) {
                    if (tmpPortId.getName().startsWith("/dev")) {
                        portId = tmpPortId;
                    }
                }
            }
            if (portId == null) {
                System.out.println("not detected");
            }
            SerialPort serialPort = (SerialPort) portId.open("ArduinoSerial", 1000);// 打开串口的超时时间为1000ms
            // 设置串口速率为9600，数据位8位，停止位1们，奇偶校验无
            serialPort.setSerialPortParams(9600, SerialPort.DATABITS_8, SerialPort.STOPBITS_1, SerialPort.PARITY_NONE);
            ArduinoSerial testObj = new ArduinoSerial(serialPort);
            testObj.read();
            testObj.close();
            serialPort.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}