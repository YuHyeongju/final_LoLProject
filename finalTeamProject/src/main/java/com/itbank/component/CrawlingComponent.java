package com.itbank.component;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.stereotype.Component;

import com.itbank.model.GameDTO;

@Component
public class CrawlingComponent {

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd a hh시 mm분 ss초");
	
	public List<GameDTO> getGames(String date) throws Exception{
		System.setProperty("webdriver.chrome.driver", "C:/Users/82106/Desktop/chromedriver-win64/chromedriver.exe");
		WebDriver driver = new ChromeDriver();
		
		
		String url = "https://game.naver.com/esports/League_of_Legends/schedule/lck?date=" + date;
		driver.get(url);
		// 요청 후 대기 5초
		Duration duration = Duration.ofSeconds(5);
		WebDriverWait wait = new WebDriverWait(driver, duration);
		wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("div.card_item__3Covz")));
		
		// 값 추출
		List<WebElement> all = driver.findElements(By.cssSelector("div.card_item__3Covz"));
		List<GameDTO> games = new ArrayList<GameDTO>();
		for(WebElement e : all) {
			List<WebElement> li = e.findElements(By.cssSelector("div.card_item__3Covz li"));
			for(WebElement game : li) {
			GameDTO dto = new GameDTO();
			try {
				dto.setGameDate(new Date(Long.parseLong(e.getAttribute("data-time-stamp"))));
				dto.setGameTime(game.findElement(By.cssSelector("span.row_time__28bwr")).getText());
				dto.setRedTeam(game.findElement(By.cssSelector("div.row_home__zbX5s > .row_name__IDFHz")).getText());
				dto.setBlueTeam(game.findElement(By.cssSelector("div.row_away__3zJEV > .row_name__IDFHz")).getText());
				String status = game.findElement(By.cssSelector(".row_state__2RKDU")).getText();
				if(status.equals("종료"))dto.setStatus(0);
				if(status.equals("1세트") || status.equals("2세트") || status.equals("3세트") || status.equals("4세트") || status.equals("5세트"))dto.setStatus(1);
				if(status.equals("예정"))dto.setStatus(2);
				dto.setTitle(game.findElement(By.cssSelector(".row_title__1sdwN")).getText());
				dto.setStadium(game.findElement(By.cssSelector(".row_stadium__UOBaJ")).getText());
				dto.setRedScore(Integer.parseInt(game.findElement(By.cssSelector("div.row_home__zbX5s > .row_score__2RmGQ")).getText()));
				dto.setBlueScore(Integer.parseInt(game.findElement(By.cssSelector("div.row_away__3zJEV > .row_score__2RmGQ")).getText()));
			} catch (NoSuchElementException e2) {
				if(dto.getRedTeam() == null)continue;
				if(dto.getTitle() == null)continue;
			}
			games.add(dto);
			
			}
		}
		
		
		
		System.out.println("============================================");
		for(GameDTO dto : games) {
			
			System.out.println("롱값 게임 날짜 : " + sdf.format(dto.getGameDate()));
			System.out.println("게임 시간 : " + dto.getGameTime());
			System.out.println("게임 이름 : " + dto.getTitle());
			System.out.println("레드 팀 : " + dto.getRedTeam());
			System.out.println("블루 팀 : " +dto.getBlueTeam());
			System.out.println("레드 팀 점수 : " +dto.getRedScore());
			System.out.println("블루 팀 점수 : " +dto.getBlueScore());
			System.out.println("경기 상태 : " +dto.getStatus());
			System.out.println("경기장 : " +dto.getStadium());
			System.out.println("--------------------------------------------");
		}
		System.out.println("============================================");
		//web driver종료
		driver.quit();
		
		return games;
	}
}
