package com.kanion.www.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kanion.www.model.KymMedicine;
import com.kanion.www.service.KymMedicineService;

@Controller
@RequestMapping("KymMedicine")
public class KymMedicineController {

	private KymMedicineService KymMedicineService;
	
	@Autowired
	public void setKymMedicineService(KymMedicineService KymMedicineService) {
		this.KymMedicineService = KymMedicineService;
	}
	
	
	
	@RequestMapping("/getName")
	@ResponseBody
	public String getName(Long id){
		try{
			String name = KymMedicineService.selectByPrimaryKey(id).getName();
			System.out.println(name);
			return name;
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "error";
	}
	
	
	@RequestMapping("selectAll")
	public ModelAndView  selectAll(HttpServletRequest request,
			HttpServletResponse response){
			ModelAndView returnView=new ModelAndView("/kanionMedicine");
			List<KymMedicine> kymMedicines = KymMedicineService.selectAll();	
			if (null!=kymMedicines) {
				returnView.addObject("kymMedicines", kymMedicines);
			}
			return returnView;
		}
//	@RequestMapping("/selectAll")
//	@ResponseBody
//	public Map<String,List<KymMedicine>> selectAll(){
//		
//		Map<String, List<KymMedicine>> returnData =null;
//	
//		try {			
//			List<KymMedicine> kymMedicines = KymMedicineService.selectAll();	
//			if (null!=kymMedicines) {
//				returnData = new HashMap<String, List<KymMedicine>>();
//				returnData.put("kymMedicines", kymMedicines);
//			}
//			return returnData;
//		}catch(Exception e){
//			e.printStackTrace();
//			return null;
//		}
//	}
	
	@RequestMapping("/selectByName")
	@ResponseBody
	public Map<String,List<KymMedicine>> selectByName(HttpServletRequest request,
			HttpServletResponse response){
		
		String name=request.getParameter("name");
		System.out.println(name);
		Map<String, List<KymMedicine>> KymMedicines =null;
	
		try {			
			List<KymMedicine> kymMedicines = KymMedicineService.selectByName(name);	
			if (null!=kymMedicines) {
				KymMedicines = new HashMap<String, List<KymMedicine>>();
				KymMedicines.put("kymMedicines", kymMedicines);
			}
			System.out.println(kymMedicines.size());
			return KymMedicines;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
}
