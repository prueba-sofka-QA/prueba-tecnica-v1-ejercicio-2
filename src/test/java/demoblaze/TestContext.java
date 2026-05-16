package demoblaze;

public class TestContext {
    private static String createdUsername;

    public static void setCreatedUsername(String username) {
        createdUsername = username;
    }

    public static String getCreatedUsername() {
        return createdUsername;
    }
}
