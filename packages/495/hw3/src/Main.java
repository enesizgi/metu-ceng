import com.opencsv.CSVReader;
//import com.opencsv.exceptions.CsvException;

//import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        System.out.println(args[0]);
        Path path = Paths.get("songs_normalize.csv");

        List<String[]> r;
        try (CSVReader reader = new CSVReader(new FileReader(path.toAbsolutePath().toString()))) {
            r = reader.readAll();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        int listIndex = 0;
        for (String[] arrays : r) {
//            System.out.println("\nString[" + listIndex++ + "] : " + Arrays.toString(arrays));

            int index = 0;
            for (String array : arrays) {
//                System.out.println(index++ + " : " + array);
            }

        }
    }
}