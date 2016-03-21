import java.util.HashMap;
import java.util.Map;

public class Node2 {
    public static Map<String, Object> compute(Map<String, Object> got) throws Exception {
        System.out.println("server-alt Node2.java" + got.toString());
        Map<String, Object> ret = new HashMap<String, Object>();
        ret.put("name", "bucket");
        ret.put("key", "key");
        ret.put("value", "value");
        return ret;
    }

}

public class Node2 {
    public static List<ComputeResponse> compute(ComputeRequest req) throws Exception {
        System.out.println("server-alt Node2.java" + req.toString());
        List<ComputeResponse> ret = new ArrayList<ComputeResponse>();
        ComputeResponse res = new ComputeResponse("bucket", "key", "value", 0);
        ret.add(res);
        ComputeResponse res1 = new ComputeResponse("bucket1", "key1", "value1", 0);
        ret.add(res1);
        return ret;
    }
}
