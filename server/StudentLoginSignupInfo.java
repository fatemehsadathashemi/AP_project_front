import java.io.*;

class StudentLoginSignupInfo {
    static public int usersChecker(String userID, String password) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader("D:\\uni_files\\semester4\\apProject\\server\\studentLoginSignupInfo.txt"));
        System.out.println("user Database founded!");
        String line = reader.readLine();
        int result = 0;
        while (line != null) {
            String[] elements = line.split("~");
            if (elements[0].equals(userID)) {
                result = 1;
                if (elements[1].equals(password)) {
                    result = 2;
                    reader.close();
                    return result; // 2 ->  userID and password are correct
                }
                reader.close();
                return result; // 1 -> userID is correct but password is incorrect
            }
            line = reader.readLine();
        }
        reader.close();
        return result; // 0 -> userID is incorrect
    }
}
