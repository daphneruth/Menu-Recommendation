import org.jpl7.PrologException;
import org.jpl7.Query;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.util.Scanner;

public class recomendation extends JFrame {
    JLabel welcome_statement, alert_message;
    JButton proceed_word;

    public recomendation() {
        alert_message = new JLabel("Wondering what to eat?");
        welcome_statement = new JLabel("Allow me Recommend press \"OK\"");
        proceed_word = new JButton("OK");
        proceed_word.setBackground(Color.cyan);
        proceed_word.setSize(100, 100);
        add(alert_message);
        add(welcome_statement);
        add(proceed_word);
        proceed_word.addActionListener(this::actionPerformed);
        setLayout(new GridLayout(4, 1));
        setTitle("Menu ");
        setSize(400, 400);
        getContentPane().setBackground(Color.magenta);
        setVisible(true);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    private void actionPerformed(ActionEvent actionEvent) {


            Query el = new Query("consult('C:/Users/User/Desktop/menuGUI/src/menu.pl')");
            System.out.println(el.hasSolution() ? "Search menu" : "fail");


            Scanner enter = new Scanner(System.in);

            try {

                String query = enter.nextLine();
                Query e2 = new Query(query);
                System.out.println(e2.hasSolution());

            } catch (
                    PrologException prologException) {
                System.out.println("Wrong Inputs");


            }

    }
}
