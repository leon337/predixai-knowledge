function filterCards(){
  const input=document.querySelector('[data-search]');
  if(!input) return;
  const q=input.value.toLowerCase().trim();
  document.querySelectorAll('[data-card]').forEach(card=>{
    const text=card.innerText.toLowerCase();
    card.style.display=text.includes(q)?'block':'none';
  });
}
document.addEventListener('input',e=>{if(e.target.matches('[data-search]')) filterCards();});
