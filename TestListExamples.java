import static org.junit.Assert.*;
import org.junit.*;
import java.util.Arrays;
import java.util.List;

class IsMoon implements StringChecker {
  public boolean checkString(String s) {
    return s.equals("moon");
  }
}

public class TestListExamples {


  @Test(timeout = 500)
  public void testMergeRightEnd() {
    List<String> left = Arrays.asList("a", "b", "c");
    List<String> right = Arrays.asList("a", "d");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("a", "a", "b", "c", "d");
    assertEquals(expected, merged);
  }


  @Test
  public void testFilter(){
    print("hI");
    List<String> argList = Arrays.asList("moon", "moon1", "MOON", "moOn");
    List<String> expected = Arrays.asList("moon", "MOON", "moOn");
    StringChecker sc = new IsMoon();
    List<String> result = ListExamples.filter(argList, sc);
    assertEquals(expected, ListExamples.filter(argList,sc));

  }

}
