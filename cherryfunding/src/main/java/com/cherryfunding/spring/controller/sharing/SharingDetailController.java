package com.cherryfunding.spring.controller.sharing;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.sharing.SItemService;
import com.cherryfunding.spring.service.sharing.ShareService;
import com.cherryfunding.spring.service.sharing.SharingDetailServiceImpl;
import com.cherryfunding.spring.vo.SItemVo;
import com.cherryfunding.spring.vo.SListVo;

@Controller
public class SharingDetailController {

	@Autowired
	private ShareService shareService;

	@Autowired
	private SItemService sItemService;

	@Autowired
	SharingDetailServiceImpl sharingDetailService;

	@RequestMapping(value = "/sharing/sharingDetail", method = RequestMethod.GET)
	public String sharingDetail(int sNum, Model model) {
		model.addAttribute("vo", shareService.detail(sNum));
		model.addAttribute("itemList", sItemService.itemList(sNum));
		return ".sharingDetail";
	}

	@RequestMapping("/sharing/itemDetail")
	@ResponseBody
	public SItemVo itemDetail(int siNum) {
		return sItemService.detail(siNum);
	}

	@RequestMapping("/sharing/getAmount")
	@ResponseBody
	public HashMap<String, Object> getAmount(int siNum, int amount, int sNum, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int getAmount = sItemService.detail(siNum).getAmount();
		SItemVo sItemVo = sItemService.detail(siNum);

		if (session.getAttribute("selectedSharingList") == null) {
			session.setAttribute("selectedSharingList", new ArrayList<Object>());
		}
		int addAmount = amount;
		ArrayList<Object> list = (ArrayList<Object>) session.getAttribute("selectedSharingList");
		for (Object l : list) {
			HashMap<String, Object> sel = (HashMap<String, Object>) l;
			if ((Integer) sel.get("siNum") == siNum) {
				addAmount += (Integer) sel.get("amount");
			}
		}
		if (getAmount >= addAmount) { // 선택한 것들이 남은 수량보다 적으면
			map.put("result", "ok");
			map.put("siNum", sItemVo.getSiNum());
			map.put("title", sItemVo.getTitle());
			map.put("amount", sItemVo.getAmount());

			HashMap<String, Object> selected = new HashMap<String, Object>(); // 쇼핑 리스트에 담아요
			selected.put("siNum", siNum);
			selected.put("sNum", sNum);
			selected.put("title", sItemVo.getTitle());
			selected.put("amount", amount);
			list.add(selected);
		} else
			map.put("result", "no"); // 많으면 안 담아요
		return map;
	}

	@RequestMapping(value = "/sharing/getSelectedSharingList")
	@ResponseBody
	public ArrayList<Object> getSelectedFundingList(int sNum, HttpSession session) {
		ArrayList<Object> list = (ArrayList<Object>) session.getAttribute("selectedSharingList");
		ArrayList<Object> selectedList = new ArrayList<Object>();
		if (list != null) {
			for (Object l : list) {
				HashMap<String, Object> map = (HashMap<String, Object>) l;
				if ((Integer) map.get("sNum") == sNum) {
					selectedList.add(map);
				}
			}
		}
		return selectedList;
	}

	@RequestMapping(value = "/sharing/cancelSelectItem")
	@ResponseBody
	public HashMap<String, Object> cancelSelectItem(int i, HttpSession session) {
		ArrayList<Object> list = (ArrayList<Object>) session.getAttribute("selectedSharingList");
		HashMap<String, Object> map = (HashMap<String, Object>) list.remove(i);
		session.removeAttribute("selectedSharingList");
		session.setAttribute("selectedSharingList", list);
		return map;
	}

	@RequestMapping(value = "/sharing/insertSItem", method = RequestMethod.POST)
	public String insertFDetail(HttpSession session, HttpServletRequest request) {
		String id = (String) session.getAttribute("id");
		int sNum = Integer.parseInt(request.getParameter("sNum"));
		ArrayList<Object> list = (ArrayList<Object>) session.getAttribute("selectedSharingList");
		Iterator iterator = list.iterator();

		while (iterator.hasNext()) {
			HashMap<String, Object> map = (HashMap<String, Object>) iterator.next();
			if ((Integer) map.get("sNum") == sNum) {
				int siNum = (Integer) map.get("siNum");
				int amount = (Integer) map.get("amount");
				SListVo sListVo = new SListVo(0, sNum, id, null, null, siNum, amount);
				sharingDetailService.sListInsert(sListVo); // 나눔 신청자 등록
				iterator.remove(); //아이템 삭제
			}
		}
		return "redirect:/sharing/sharingDetail?sNum=" + sNum;
	}
}
