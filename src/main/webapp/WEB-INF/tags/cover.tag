<%@ tag language="java" pageEncoding="EUC-KR"%>
<style>


#cover{
    object-fit: cover;
    width: 100%;
    height: 250px;
    
}
</style>

<div class="bg-secondary">
	<img id="cover"
		src= "${coverImg}" 
		alt="aaaa"
	></img>
	<div class="h2 ml-5 mt-4 mb-2">${coverHeader}</div>
	<div class="h5 ml-5 mt-4 pb-2">${coverText}</div>
</div>