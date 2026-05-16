package demoblaze;

import com.intuit.karate.junit5.Karate;

public class DemoblazeTest {
    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
}
