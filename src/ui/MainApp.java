package ui;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import dao.UserDAO;
import entity.User;
import util.Session;

public class MainApp extends Application {

    @Override
    public void start(Stage stage) {

        Label title = new Label("GearRent Pro Login");
        TextField usernameField = new TextField();
        usernameField.setPromptText("Username");
        PasswordField passwordField = new PasswordField();
        passwordField.setPromptText("Password");
        Button loginBtn = new Button("Login");
        Label errorLabel = new Label();
        errorLabel.setStyle("-fx-text-fill: red;");

        loginBtn.setOnAction(e -> {
            String username = usernameField.getText();
            String password = passwordField.getText();

            if (username.isEmpty() || password.isEmpty()) {
                errorLabel.setText("Please enter username and password");
                return;
            }

            UserDAO userDAO = new UserDAO();
            User user = userDAO.authenticate(username, password);

            if (user != null) {
                Session.setCurrentUser(user);
                stage.setScene(DashboardUI.getScene(stage));
            } else {
                errorLabel.setText("Invalid username or password");
            }
        });

        VBox root = new VBox(15, title, usernameField, passwordField, loginBtn, errorLabel);
        root.setStyle("-fx-padding: 40; -fx-alignment: center;");

        Scene scene = new Scene(root, 300, 250);
        stage.setScene(scene);
        stage.setTitle("Login - GearRent Pro");
        stage.show();
    }

    public static void main(String[] args) {
        launch();
    }
}