function moreInfo(thisOffer)
{
	view=document.getElementById(thisOffer).style.display;
	if (view=='none')
		view='block';
	else
		view='none';

	document.getElementById(thisOffer).style.display = view;
}
