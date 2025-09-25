# 📦 Projeto Conceitual de Banco de Dados - E-commerce

Este projeto representa o modelo conceitual de um banco de dados para um sistema de e-commerce, desenvolvido no **MySQL Workbench**. Ele contempla as principais entidades envolvidas em um processo de compra online, como clientes, produtos, pedidos, pagamentos e entregas.

---

## 🧠 Objetivo

Criar uma estrutura de banco de dados relacional que represente de forma clara e eficiente os relacionamentos entre os componentes de um sistema de vendas online, permitindo consultas, inserções e integrações futuras com sistemas web ou mobile.

---

## 🛠️ Tecnologias Utilizadas

- MySQL Workbench (modelo EER)
- MySQL Server
- SQL (DDL e DML)
- GitHub (versionamento)

---

## 🗂️ Estrutura do Banco

### Entidades principais:

- `cliente`
- `endereco`
- `produto`
- `vendedor`
- `pedido`
- `item_pedido`
- `pagamento`
- `entrega`
- `oferta`

### Relacionamentos:

- Um `cliente` pode ter vários `pedidos`
- Um `cliente` pode ter vários `enderecos`
- Um `pedido` possui vários `itens_pedido`
- Cada `item_pedido` está vinculado a um `produto`
- Cada `produto` pertence a um `vendedor`
- Um `produto` pode ter várias `ofertas`
- Cada `pedido` possui um `pagamento` e uma `entrega`
- Cada `entrega` está associada a um `endereco`

---

## 📐 Diagrama EER

O diagrama foi criado no MySQL Workbench e está disponível neste repositório:

📁 [Projeto_E_Commerce.mwb](Projeto_E_Commerce.mwb) — Arquivo original do Workbench 
🖼️ [Diagrama_ECommerce.png](Diagrama_ECommerce.png) — Exportação visual do modelo

---

## 📄 Scripts disponíveis

- - [script_E_Commerce.sql](script_E_Commerce.sql) — Script de criação das tabelas e relacionamentos


--



