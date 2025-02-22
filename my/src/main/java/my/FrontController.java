package my;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class FrontController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("hello index");
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", "고길동");
		
		// 절대경로 주소로 이동
		// mv.setViewName("/WEB-INF/index.jsp");
		
		// dispatcher 한번 돌아가는 명령
		mv.setViewName("index");
		// viewResolver를 통해 앞, 뒤 추가되어 이동함
		
		// mv에 View를 설정해줬기 때문에 mv를 리턴해줘야 보임
		return mv;
	}

}
