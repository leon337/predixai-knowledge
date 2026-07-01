const KEY="predixai_memory_items_v23";
let editingId=null;

function uid(){return "mem_"+Date.now()+"_"+Math.random().toString(16).slice(2)}
function items(){return JSON.parse(localStorage.getItem(KEY)||"[]")}
function saveItems(list){localStorage.setItem(KEY,JSON.stringify(list))}
function tagClass(kind){return kind==="Problema"?"stop":kind==="Pesquisa"?"purple":kind==="Decisão"?"ok":kind==="Aula"?"warn":"badge"}
function clearForm(){editingId=null;document.querySelector("#memTitle").value="";document.querySelector("#memText").value="";document.querySelector("#memKind").value="Ideia";document.querySelector("#saveBtn").innerText="Salvar memória";}
function renderMemory(){
  const box=document.querySelector("#memoryList"); if(!box)return;
  const q=(document.querySelector("#memSearch")?.value||"").toLowerCase().trim();
  let list=items().filter(i=>(i.title+" "+i.text+" "+i.kind).toLowerCase().includes(q));
  box.innerHTML=list.length?list.map(i=>`
    <article class="card" data-card>
      <span class="badge ${tagClass(i.kind)}">${i.kind}</span>
      <h3>${escapeHtml(i.title)}</h3>
      <p>${escapeHtml(i.text)}</p>
      <p><small>Criado/alterado: ${i.updated||i.created}</small></p>
      <div class="tools">
        <button class="btn blue" onclick="editMemory('${i.id}')">Editar</button>
        <button class="btn red" onclick="deleteMemory('${i.id}')">Excluir</button>
      </div>
    </article>`).join(""):"<p class='lead'>Nenhuma memória encontrada.</p>";
}
function saveMemory(){
  const title=document.querySelector("#memTitle").value.trim();
  const text=document.querySelector("#memText").value.trim();
  const kind=document.querySelector("#memKind").value;
  if(!title||!text){alert("Preencha título e descrição.");return}
  let list=items();
  if(editingId){
    list=list.map(i=>i.id===editingId?{...i,title,text,kind,updated:new Date().toLocaleString("pt-BR")}:i);
  }else{
    list.unshift({id:uid(),title,text,kind,created:new Date().toLocaleString("pt-BR"),updated:new Date().toLocaleString("pt-BR")});
  }
  saveItems(list); clearForm(); renderMemory();
}
function editMemory(id){
  const item=items().find(i=>i.id===id); if(!item)return;
  editingId=id;
  document.querySelector("#memTitle").value=item.title;
  document.querySelector("#memText").value=item.text;
  document.querySelector("#memKind").value=item.kind;
  document.querySelector("#saveBtn").innerText="Atualizar memória";
  window.scrollTo({top:0,behavior:"smooth"});
}
function deleteMemory(id){
  if(!confirm("Excluir esta memória?"))return;
  saveItems(items().filter(i=>i.id!==id)); renderMemory();
}
function exportMemory(){
  const blob=new Blob([JSON.stringify(items(),null,2)],{type:"application/json"});
  const a=document.createElement("a");a.href=URL.createObjectURL(blob);a.download="predixai_memory_export.json";a.click();
}
function importMemory(event){
  const file=event.target.files[0]; if(!file)return;
  const reader=new FileReader();
  reader.onload=()=>{try{const data=JSON.parse(reader.result); if(!Array.isArray(data))throw new Error(); saveItems(data); renderMemory(); alert("Importado com sucesso.");}catch(e){alert("JSON inválido.");}};
  reader.readAsText(file);
}
function escapeHtml(s){return s.replace(/[&<>"']/g,m=>({"&":"&amp;","<":"&lt;",">":"&gt;","\"":"&quot;","'":"&#039;"}[m]))}
document.addEventListener("DOMContentLoaded",renderMemory);
document.addEventListener("input",e=>{if(e.target.matches("#memSearch"))renderMemory();});
