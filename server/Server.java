import java.nio.file.*;
import java.util.*;
import java.net.*;
import java.io.*;

class Server {
    public static void main(String[] args) throws IOException {
        System.out.println("Welcome to the server!");
        ServerSocket serverSocket = new ServerSocket(8080);
        System.out.println("Server is running and listening on port 8080");
        while (true) {
            System.out.println("Waiting for client...");
            new ClientHandler(serverSocket.accept()).start();
            System.out.println("________________________");
        }
    }
}
class ClientHandler extends Thread {
    Socket socket;
    DataOutputStream dos;
    DataInputStream dis;

    public ClientHandler(Socket socket) throws IOException {
        System.out.println("New client connected!");

        this.socket = socket;
        dos = new DataOutputStream(socket.getOutputStream());
        dis = new DataInputStream(socket.getInputStream());
        System.out.println("connected to server");
    }

    // convert sever message to string
    public String listener() throws IOException {
        try{
            System.out.println("listener is activated");
            StringBuilder sb = new StringBuilder();
            int index = dis.read();
            while (index != 0) {
                sb.append((char) index);
                index = dis.read();
            }
            Scanner s = new Scanner(sb.toString());
            StringBuilder request = new StringBuilder();
            while (s.hasNextLine()) {
                request.append(s.nextLine());
            }
            System.out.println("listener2 -> read command successfully");
            return request.toString();}
        catch (IOException e) {
            System.out.println("error in listener : " + e);}
        return "Error!";
    }

    // send the response to server
    public void writer(String write) throws IOException {
        dos.writeBytes(write);
        dos.flush();
        socket.close();
        dos.close();
        dis.close();
        System.out.println(write);
        System.out.println("command finished and response sent to server -- the response is: " + write);
    }


    @Override
    public void run() {
        super.run();
        String command;
        try {
            command = listener();
            System.out.println("command received: { " + command + " }");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        String[] split = command.split("~");
//        for (String s : split)
//            System.out.println(s);
        switch (split[0]) {
            case "GET: StudentLogInChecker": {    //GET: logInChecker~402243056~MN45o9
                // 2 -> both user ID & password is correct so allow signing in
                // 1 -> user ID is correct but password is incorrect
                // 0 -> user ID is incorrect
                int responseOfDatabase = 100;
                try {
                    responseOfDatabase = StudentLoginSignupInfo.usersChecker(split[1], split[2]);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                if (responseOfDatabase == 2) {
                    System.out.println("status code is 200");
                    System.out.println("Successfully logged in!");
                    try {
                        writer("200");
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }

                else if (responseOfDatabase == 1) {
                    System.out.println("status code is 401");
                    System.out.println("Password is incorrect!");
                    try {
                        writer("401");
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }

                else if (responseOfDatabase == 0) {
                    System.out.println("status code is 404");
                    System.out.println("User not founded!");
                    try {
                        writer("404");
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
                break;
            }
            case "POST: StudentSignUp": {
                // checks the userName if it's taken, the response is zero and usr is not added
                // signup~userName~password
                String studentID = split[1];
                String password = split[2];

                // Save student information to a text file
                try {
                    String filePath = "D:\\uni_files\\semester4\\apProject\\server\\studentLoginSignupInfo.txt";
                    Files.writeString(Paths.get(filePath), studentID + "~" + password + "\n", StandardOpenOption.APPEND);
                    System.out.println("Student ID and password saved to file.");

                    // Send success response back to client
                    writer("200");
                } catch (IOException e) {
                    System.err.println("Error saving student information: " + e.getMessage());
                    try {
                        writer("500"); // Send error response back to client
                    } catch (IOException ex) {
                        System.err.println("Error sending error response: " + ex.getMessage());
                    }
                }
                break;
            }
            case "POST: StudentInformation":{
                String studentID = split[1];
                String password = split[2];
                String firstName = split[3];
                String lastName = split[4];

                try {
                    String filePath = "D:\\uni_files\\semester4\\apProject\\server\\usersInfo.txt";
                    Files.writeString(Paths.get(filePath), studentID + "~" + password + "~" + firstName + "~" + lastName + "\n", StandardOpenOption.APPEND);
                    System.out.println("Student information saved to file.");

                    // Send success response back to client
                    writer("200");
                } catch (IOException e) {
                    System.err.println("Error saving student information: " + e.getMessage());
                    try {
                        writer("500"); // Send error response back to client
                    } catch (IOException ex) {
                        System.err.println("Error sending error response: " + ex.getMessage());
                    }
                }
                break;

            }

            case "GET: StudentInformation":{
                String studentID = split[1];
                String response = "";
                try {
                    response = StudentInformation.information(studentID);
                }
                catch (IOException e) {
                    e.printStackTrace();
                }
                try {
                    writer(response);
                }
                catch (IOException e) {
                    e.printStackTrace();
                }
            }

            default:
                System.out.println("Unsupported command");
                try {
                    writer("400"); // Bad request
                } catch (IOException e) {
                    System.err.println("Error sending bad request response: " + e.getMessage());
                }
                break;

        }

    }
}