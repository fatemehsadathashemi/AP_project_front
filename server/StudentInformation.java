import java.io.*;
public class StudentInformation {
    static public String information (String ID) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader("D:\\uni_files\\semester4\\apProject\\server\\usersInfo.txt"));
        System.out.println("user Database founded!");
        String line = reader.readLine();
        String result = "";
        while (line != null) {
            String[] elements = line.split("~");
            if(elements[0].equals(ID) ){
                result = line;
                reader.close();
                break;
            }
            line = reader.readLine();
        }
        reader.close();
        return result;
    }
}