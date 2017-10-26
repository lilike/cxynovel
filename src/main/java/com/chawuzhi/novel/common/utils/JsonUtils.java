package com.chawuzhi.novel.common.utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

public class JsonUtils {

	public static final ObjectMapper mapper = new ObjectMapper();
	
	
	public static String ObjectToString(Object obj){
		try {
			return mapper.writeValueAsString(obj);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static <T> T stringToObject(String str,Class<T> valueType){
		try {
			return mapper.readValue(str, valueType);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 
	*......................我佛慈悲...................... 
	*                       _oo0oo_ 
	*                      o8888888o 
	*                      88" . "88 
	*                      (| -_- |) 
	*                      0\  =  /0 
	*                    ___/`---'\___ 
	*                  .' \\|     |// '. 
	*                 / \\|||  :  |||// \ 
	*                / _||||| -卍-|||||- \ 
	*               |   | \\\  -  /// |   | 
	*               | \_|  ''\---/''  |_/ | 
	*               \  .-\__  '-'  ___/-. / 
	*             ___'. .'  /--.--\  `. .'___ 
	*          ."" '<  `.___\_<|>_/___.' >' "". 
	*         | | :  `- \`.;`\ _ /`;.`/ - ` : | | 
	*         \  \ `_.   \_ __\ /__ _/   .-` /  / 
	*     =====`-.____`.___ \_____/___.-`___.-'===== 
	*                       `=---=' 
	*                        
	*..................佛祖开光 ,BUG辟易................... 
	*佛曰:
	*                 写字楼里写字间，写字间里程序员；
	*                 程序人员写程序，又拿程序换酒钱。
	*                 酒醒只在网上坐，酒醉还来网下眠；
	*                 酒醉酒醒日复日，网上网下年复年。
	*                 但愿老死电脑间，不愿鞠躬老板前；
	*                 奔驰宝马贵者趣，公交自行程序员。
	*                 别人笑我忒疯癫，我笑自己命太贱；
	*                 不见满街漂亮妹，哪个归得程序员？
	* @Title: jsonToObject
	* @Description: 将json格式的String数据转化为对应的集合对象
	* @param @param sets
	* @param @param clazz
	* @param @return    设定文件
	* @return List<T>    返回类型
	* @throws
	 */
	public static <T> List<T> jsonToObject(String sets,Class<T> clazz){
		try {
		List<T> list = new ArrayList<T>();
		JsonArray array = new JsonParser().parse(sets).getAsJsonArray();
		for (final JsonElement elem : array) {
			list.add(new Gson().fromJson(elem, clazz ));  
		}
		return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
