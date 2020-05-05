package com.cellphone.craw;



public class Crawler {
//	private String url = "https://cellphones.com.vn/mobile.html?p=";
//	private String dic = "src/main/resources/static/assets/phone-image/";
//	private Document document;
//	@Getter
//	private ArrayList<Phone> phones = new ArrayList<Phone>();
//	public Crawler(int page) throws IOException {
//		this.url += page;
//		System.out.println("Connecting... " + this.url);
//		document = Jsoup.connect(url).get();
//		File directory = new File(dic);
//		if(!directory.exists()) {
//			directory.mkdirs();
//		}
//		System.out.println(directory.getAbsolutePath());
//		
//		crawl();
//	}
//	
//	private void crawl() throws IOException {
//		Elements elems =  document.select("body > div.wrapper > div > div.main-container.col2-left-layout > div > div.col-main > div.category-products.lt-product-group >"
//				+ " div.products-container > ul > li");
//		
//		for(Element e : elems) {
//			Phone phone = new Phone();
//			
//				String url = e.select(".lt-product-group-image > a").attr("href");
//				phone.setLinkDetail(url);
//				phone.setId(Integer.parseInt(e.attr("data-id")));
//				phone.setImage(e.selectFirst("a>img").attr("src"));
//				saveImage(phone.getImage());
//				phone.setName(e.selectFirst(".lt-product-group-info>a>h3").text());
//			try {
//				phone.setCurrentPrice(getCurrentPrice(e));
//				phone.setOldPrice(getOldPrice(e));
//				phone.setGift(e.selectFirst("p.gift-cont").text());
//			} catch (Exception e2) {
//			}
//			
//			phones.add(phone);
//			System.out.println(phone);
//		}
//	}
//	
//	private long getCurrentPrice(Element elem) {
//		String[] num = elem.select(".price-box span.price").get(0).text().split(" ");
//		return Long.parseLong(num[0].replace(".", ""));
//	}
//	
//	private long getOldPrice(Element elem) {
//		String num;
//		try {
//			 num = elem.select(".price-box span.price").get(1).text().split(" ")[0];
//		} catch (Exception e) {
//			num = "-1";
//		}
//		return Long.parseLong(num.replace(".", ""));
//	}
//	
//	private void saveImage(String urlImage) throws IOException {
//		InputStream in = new URL(urlImage).openStream();
//		String[] names = urlImage.split("/");
//		String name = names[names.length - 1];
//		
//		try {
//			Files.copy(in, Paths.get(dic + name));
//		} catch (FileAlreadyExistsException e) {
//			System.err.println("FileAlreadyExistsException + " + e.getMessage());
//		}
//	}
}
