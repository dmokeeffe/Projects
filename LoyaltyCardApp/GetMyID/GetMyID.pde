import javax.swing.UIManager;
import javax.swing.JOptionPane;
import javax.swing.JTextArea;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

boolean hidden = false;
String studentNumber;
String idCode;

void setup() {
  
  
  try {
  
  UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
  }
  
    catch (Exception e) {
      e.printStackTrace();
  }
  
     studentNumber = JOptionPane.showInputDialog(frame,"Student Number", "student number"); 
     
     if (studentNumber != null) {
      idCode = createID(studentNumber);
      
        JTextArea idText = new JTextArea(idCode);
  JOptionPane.showMessageDialog(frame, idText, "Your ID Code", JOptionPane.INFORMATION_MESSAGE);
  
     }
  exit();
}


 String createID(String data) {
    final int SALT = int(data);
    
    MessageDigest messageDigest;
    String hashData = "";
    
    randomSeed(SALT);
    data = str(int(data) + random(0, 10000));
    
    try {
      messageDigest = MessageDigest.getInstance("MD5");
      
      messageDigest.update(data.getBytes());
      byte[] messageDigestMD5 = messageDigest.digest();
      
      StringBuffer stringBuffer = new StringBuffer();
        for (byte bytes : messageDigestMD5)
        {
          stringBuffer.append(String.format("%02x", bytes & 0xff));
          
        }
        hashData = stringBuffer.toString();
    }
    catch (NoSuchAlgorithmException exception) 
    {
      hashData = null;
    }
    return hashData;
  }
