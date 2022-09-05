#section 1
#1-What categories of tech products does Magist have? #Answer= 7

select product_category_name

from  product_category_name_translation

where product_category_name in 

('audio', 'eletronicos', 'pc_gamer', 'pcs','tablets_impressao_imagem', 'telefonia', 'informatica_acessorios'); #answer= 74

## total no of product categories are there in Magist?

select count(*)
from  product_category_name_translation;




#2-How many products of these tech categories have been sold (within the time window of the database snapshot)? 
 #answer=15,718

select count(o.order_status) as N_Tech
from orders o
inner join order_items oi
on o.order_id= oi.order_id
inner join products p
on oi.product_id = p.product_id
where order_status in ('delivered', 'shipped', 'invoiced', 'processing', 'approved' 'created') 
and product_category_name in ('informatica_acessorios','telefonia','eletronicos',
'audio','pcs','tablets_impressao_imagem', 'pc_gamer');




 
 #-3 What percentage does that represent from the overall number of products sold?  
 #answe= 13%
 
 select count(o.order_status) as T_Product_sold
from orders o
inner join order_items oi
on o.order_id= oi.order_id
inner join products p
on oi.product_id = p.product_id
where order_status in ('delivered', 'shipped', 'invoiced', 'processing', 'approved' 'created') 
and product_category_name in ('agro_industria_e_comercio','alimentos','alimentos_bebidas','artes','artes_e_artesanato',
'artigos_de_festas','artigos_de_natal','audio','automotivo','bebes','bebidas','beleza_saude','brinquedos',
'cama_mesa_banho','casa_conforto','casa_conforto_2','casa_construcao','cds_dvds_musicais','cine_foto',
'climatizacao','consoles_games','construcao_ferramentas_construcao','construcao_ferramentas_ferramentas',
'construcao_ferramentas_iluminacao','construcao_ferramentas_jardim','construcao_ferramentas_seguranca',
'cool_stuff','dvds_blu_ray','eletrodomesticos','eletrodomesticos_2','eletronicos','eletroportateis',
'esporte_lazer','fashion_bolsas_e_acessorios','fashion_calcados','fashion_esporte','fashion_roupa_feminina',
'fashion_roupa_infanto_juvenil','fashion_roupa_masculina','fashion_underwear_e_moda_praia','ferramentas_jardim',
'flores','fraldas_higiene','industria_comercio_e_negocios','informatica_acessorios','instrumentos_musicais',
'la_cuisine','livros_importados','livros_interesse_geral','livros_tecnicos','malas_acessorios','market_place',
'moveis_colchao_e_estofado', 'moveis_cozinha_area_de_servico_jantar_e_jardim', 'moveis_decoracao','moveis_escritorio',
'moveis_quarto','moveis_sala','musica', 'outros','papelaria','pc_gamer','pcs', 'perfumaria','pet_shop',
'portateis_casa_forno_e_cafe','portateis_cozinha_e_preparadores_de_alimentos','relogios_presentes','seguros_e_servicos',
'sinalizacao_e_seguranca', 'tablets_impressao_imagem','telefonia','telefonia_fixa','utilidades_domesticas');

#answer= answe=112098


#4---What’s the average price of the products being sold? answer=120
select avg(price)
from order_items;

#6 what is the avg price of tech product sold? answer 105

select avg(oi.price)
from order_items oi
inner join products p
on oi.product_id=p.product_id
#inner join product_category_name_translation pc
#on p.product_category_name=pc.product_category_name
where product_category_name in ('informatica_acessorios','telefonia','eletronicos',
'audio','pcs','tablets_impressao_imagem', 'pc_gamer');

#5---Are expensive tech products popular? (at the function CASE WHEN to accomplish this task) 
#anser= not popular

select product_category_name, count(oi.order_item_id),oi.price, 

case
        when count(oi.order_item_id) >= 30 then 'Very Popular'
        when count(oi.order_item_id)  <= 10 then 'Not Popular'
         else 'Popular'
    end as sales_category
    
from order_items oi
inner join products p
on oi.product_id=p.product_id
#inner join product_category_name_translation pc
#on p.product_category_name=pc.product_category_name
where product_category_name in ('informatica_acessorios','telefonia','eletronicos',
'audio','pcs','tablets_impressao_imagem', 'pc_gamer')
group by oi.price 
order by  oi.price desc;





