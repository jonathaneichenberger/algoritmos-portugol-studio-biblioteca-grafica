programa
{
	inclua biblioteca Matematica --> mat
	inclua biblioteca Sons --> s
	inclua biblioteca Tipos --> tp
	inclua biblioteca Calendario --> c
	inclua biblioteca Util --> u
	inclua biblioteca Mouse --> m
	inclua biblioteca Graficos --> g
	inclua biblioteca Texto --> txt
	inclua biblioteca Teclado --> t

	const inteiro maximo_linhas = 30
	const inteiro maximo_colunas = 10
	
	//Definiçoes de tela e proporção
	inteiro largura_tela = 1500
	inteiro altura_tela = 1000

	//Variaveis das imagens carregadas
	inteiro sweet_flight = 0
	inteiro aviao = 0
	inteiro fundo_menu = 0
	inteiro icone_aviao = 0
	inteiro icone_aviao_grande = 0
	inteiro fundo_logo = 0
	inteiro poltronas_aviao = 0
	inteiro fundo_logo_poltronas = 0

	inteiro som_aviao = 0

	//Outras variaveis
	inteiro opcao = -1
	cadeia hora
	cadeia minuto
	cadeia segundo
	cadeia hora_atual
	cadeia aviao_numero[4]
	inteiro assentos_disponiveis[4]
	inteiro transparencia = 0
	logico sair = falso
	inteiro largura_poltrona = 25
	inteiro altura_poltrona = 20
	inteiro linhas = 0
	inteiro colunas = 0
	inteiro temp_linhas = 0
	inteiro temp_colunas = 0
	inteiro aux = 0
	inteiro poltronas_disponiveis[maximo_linhas][maximo_colunas]
	cadeia poltrona = "A-0"
	inteiro linha_poltrona_selecionada = -1
	inteiro coluna_poltrona_selecionada = -1
	inteiro poltronas_selecionada[maximo_linhas][maximo_colunas]
	logico confimar_poltrona = falso
	logico digitando = falso
	cadeia nome_digitado = ""
	cadeia nome_passageiro[maximo_linhas][maximo_colunas]
	inteiro idade_passageiro[maximo_linhas][maximo_colunas]
	inteiro idade = 0
	logico digitado = falso
	inteiro tamanho = 0
	logico idade_digitada = falso
	inteiro quantidade_passageiros = 0
	inteiro criancas = 0
	inteiro adolescentes = 0
	inteiro adultos = 0
	inteiro idosos = 0
	logico verificar_idade = falso
	logico atualizar = verdadeiro
	logico encontrado = falso
	inteiro consulta_realizada = 0
	inteiro quantidade_passageiros_top = 0
	
	
	
	funcao inicio()
	{	
		carregar_sons()

		inicializar_matriz_poltronas()
		
		se(opcao == -1)
		{
			s.definir_volume(50)
			s.definir_posicao_atual_musica(som_aviao, 3000)
		}
		
		inicializar()

		faca
		{
			escolha(opcao)
			{
				caso -1:
				{
					tela_inicial()
					g.renderizar()
					pare
				}
				caso 0:
				{
					menu()
					g.renderizar()
					pare
				}
				caso 1:
				{
					cadastrar_poltronas()
					g.renderizar()	
					pare
				}
				caso 2:
				{
					realizar_reserva()
					g.renderizar()
					pare
				}
				caso 3:
				{
					visualizar_poltronas()
					g.renderizar()
					pare
				}
				caso 4:
				{
					consultar_passageiro()
					g.renderizar()
					pare
				}
				caso 5:
				{
					status_aeronave()
					g.renderizar()
					pare
				}
				caso 6:
				{
					tela_final()
					g.renderizar()
					pare
				}
			}
			
		}enquanto(sair ==  falso)
	}

	funcao tela_inicial()
	{
	
		se(transparencia < 255)
		{
			
			g.definir_opacidade(255 - transparencia)
			g.definir_cor(g.COR_BRANCO)
			g.desenhar_elipse(500, 250, 500, 500, verdadeiro)
			g.definir_cor(g.COR_PRETO)
			g.desenhar_elipse(525, 275, 450, 450, verdadeiro)
			g.desenhar_retangulo(0, 400, 1200, 200, verdadeiro, verdadeiro)
			g.desenhar_imagem(650, 400, icone_aviao_grande)
			g.definir_cor(g.COR_BRANCO)
			g.definir_estilo_texto(falso, verdadeiro, falso)
			g.definir_tamanho_texto(100.0)
			g.desenhar_texto(190, 450, " SWEET")
			g.desenhar_texto(920, 450, "FLIGHT")
			
			g.definir_opacidade(0 + transparencia)
			g.desenhar_imagem(0, 0, fundo_menu)
			u.aguarde(15)
			transparencia++
		}
		se(transparencia == 255)
		{
			
			transparencia = 0
			opcao = 0
		}
	}
	
	funcao menu()
	{
		inteiro temp_click

		g.definir_opacidade(255)
		g.desenhar_imagem(0, 0, fundo_menu)

		se(transparencia < 256)
		{
			
			g.definir_opacidade(transparencia)
			g.definir_gradiente(g.GRADIENTE_ABAIXO, 0x18548E , 0xFAF5F8)
			g.desenhar_retangulo(500, 80, 650, 120, verdadeiro, verdadeiro)
			g.desenhar_retangulo(500, 220, 650, 120, verdadeiro, verdadeiro)
			g.desenhar_retangulo(500, 360, 650, 120, verdadeiro, verdadeiro)
			g.desenhar_retangulo(500, 500, 650, 120, verdadeiro, verdadeiro)
			g.desenhar_retangulo(500, 640, 650, 120, verdadeiro, verdadeiro)
			g.desenhar_retangulo(500, 780, 650, 120, verdadeiro, verdadeiro)
	
			g.definir_cor(g.COR_PRETO)
			g.desenhar_retangulo(500, 80, 650, 120, verdadeiro, falso)
			g.desenhar_retangulo(500, 220, 650, 120, verdadeiro, falso)
			g.desenhar_retangulo(500, 360, 650, 120, verdadeiro, falso)
			g.desenhar_retangulo(500, 500, 650, 120, verdadeiro, falso)
			g.desenhar_retangulo(500, 640, 650, 120, verdadeiro, falso)
			g.desenhar_retangulo(500, 780, 650, 120, verdadeiro, falso)
	
			se(m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 80 e m.posicao_y() <= 200)
			{
				g.definir_cor(0xB6D7FA)
				g.desenhar_retangulo(497, 77, 656, 126, verdadeiro, verdadeiro)
				g.definir_cor(0x2F76FA)
				g.desenhar_retangulo(500, 80, 650, 120, verdadeiro, verdadeiro)
				
			}
			se(m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 220 e m.posicao_y() <= 340)
			{
				g.definir_cor(0xB6D7FA)
				g.desenhar_retangulo(497, 217, 656, 126, verdadeiro, verdadeiro)
				g.definir_cor(0x2F76FA)
				g.desenhar_retangulo(500, 220, 650, 120, verdadeiro, verdadeiro)
			}
			se(m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 360 e m.posicao_y() <= 480)
			{
				g.definir_cor(0xB6D7FA)
				g.desenhar_retangulo(497, 357, 656, 126, verdadeiro, verdadeiro)
				g.definir_cor(0x2F76FA)
				g.desenhar_retangulo(500, 360, 650, 120, verdadeiro, verdadeiro)
			}
			se(m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 500 e m.posicao_y() <= 620)
			{
				g.definir_cor(0xB6D7FA)
				g.desenhar_retangulo(497, 497, 656, 126, verdadeiro, verdadeiro)
				g.definir_cor(0x2F76FA)
				g.desenhar_retangulo(500, 500, 650, 120, verdadeiro, verdadeiro)
			}
			se(m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 640 e m.posicao_y() <= 760)
			{
				g.definir_cor(0xB6D7FA)
				g.desenhar_retangulo(497, 637, 656, 126, verdadeiro, verdadeiro)
				g.definir_cor(0x2F76FA)
				g.desenhar_retangulo(500, 640, 650, 120, verdadeiro, verdadeiro)
			}
			se(m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 780 e m.posicao_y() <= 900)
			{
				g.definir_cor(0xB6D7FA)
				g.desenhar_retangulo(497, 777, 656, 126, verdadeiro, verdadeiro)
				g.definir_cor(0x2F76FA)
				g.desenhar_retangulo(500, 780, 650, 120, verdadeiro, verdadeiro)
			}
	
			//Desenhar logo
			g.definir_cor(g.COR_PRETO)
			g.desenhar_elipse(120, 25, 200, 200, verdadeiro)
			
			g.definir_cor(g.COR_BRANCO)
			g.desenhar_imagem(120, 25, fundo_logo)
			g.desenhar_porcao_imagem(0, 85, 0, 85, 450, 80, fundo_menu)
			g.desenhar_imagem(180, 85, icone_aviao)
			g.definir_cor(g.COR_PRETO)
			g.definir_estilo_texto(falso, verdadeiro, falso)
			g.definir_tamanho_texto(40.0)
			g.desenhar_texto(0, 105, " SWEET")
			g.desenhar_texto(286, 105, "FLIGHT")
	
			//definindo plano de fundo e opacidade para os elemntos anteriores sobreporem a imagem
			se(transparencia <= 80)
			{
				g.definir_opacidade(transparencia)
				g.desenhar_imagem(0, 0, fundo_menu)
			}
			senao
			{
				g.definir_opacidade(80)
				g.desenhar_imagem(0, 0, fundo_menu)
			}
			
			horario()
			
			g.definir_fonte_texto("arial")
			
			g.definir_opacidade(transparencia)
		
			g.definir_cor(g.COR_PRETO)
			g.definir_estilo_texto(falso, verdadeiro, falso)
			g.definir_tamanho_texto(40.0)
			g.largura_texto("CADASTRAR POLTRONAS")
			g.desenhar_texto(500 + ((650 - g.largura_texto("CADASTRAR POLTRONAS")) / 2), 120, "CADASTRAR POLTRONAS")
			g.desenhar_texto(500 + ((650 - g.largura_texto("REALIZAR RESERVAS")) / 2), 260, "REALIZAR RESERVAS")
			g.desenhar_texto(500 + ((650 - g.largura_texto("VISUALIZAR POLTRONAS")) / 2), 400, "VISUALIZAR POLTRONAS")
			g.desenhar_texto(500 + ((650 - g.largura_texto("CONSULTAR PASSAGEIRO")) / 2), 540, "CONSULTAR PASSAGEIRO")
			g.desenhar_texto(500 + ((650 - g.largura_texto("EXIBIR STATUS AERONAVE")) / 2), 680, "EXIBIR STATUS AERONAVE")
			g.desenhar_texto(500 + ((650 - g.largura_texto("SAIR DO PROGRAMA")) / 2), 820, "SAIR DO PROGRAMA")
			//+ ((650 - g.largura_texto("SAIR DO PROGRAMA")) / 2)
			se(transparencia < 255)
			{
				transparencia++
			}
		}
		se(m.algum_botao_pressionado())
		{
			temp_click = m.ler_botao()

			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 80 e m.posicao_y() <= 200)
			{
				opcao = 1
			}
			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 220 e m.posicao_y() <= 340)
			{
				opcao = 2
			}
			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 360 e m.posicao_y() <= 480)
			{
				opcao = 3
			}
			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 500 e m.posicao_y() <= 620)
			{
				opcao = 4
			}
			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 640 e m.posicao_y() <= 760)
			{	
				opcao = 5
			}
			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 780 e m.posicao_y() <= 900)
			{
				transparencia = 0
				opcao = 6
			}
		}	
	}

	funcao cadastrar_poltronas()
	{
		inteiro temp_click = 0
		inteiro temp_tecla = 0
		
		g.definir_cor(g.COR_BRANCO)
		g.limpar()
		g.desenhar_imagem(0, 0, poltronas_aviao)
		
		g.desenhar_retangulo((g.largura_janela()-500)/ 2, 0, 500, g.altura_janela(), falso, verdadeiro)
		g.definir_cor(0xdfdfdf)
		g.desenhar_retangulo(((g.largura_janela()-500)/ 2) - 10, 0, 10, g.altura_janela(), falso, verdadeiro)
		g.desenhar_retangulo(((g.largura_janela()-500)/ 2) + 500, 0, 10, g.altura_janela(), falso, verdadeiro)

		g.definir_cor(0xdfdfdf)
		g.definir_opacidade(200)

		g.desenhar_retangulo(1020, 15, 450, 80, verdadeiro, verdadeiro)
		g.desenhar_retangulo(1020, 105, 450, 80, verdadeiro, verdadeiro)
		g.desenhar_retangulo(1020, 195, 450, 80, verdadeiro, verdadeiro)
		
		g.definir_opacidade(255)
		
		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(40.0)
		g.desenhar_texto(1045, 35, "Cadastrar Poltronas")

		
		g.desenhar_retangulo(1020, 15, 450, 80, verdadeiro, falso)
		g.desenhar_retangulo(1020, 105, 450, 80, verdadeiro, falso)
		g.desenhar_retangulo(1020, 195, 450, 80, verdadeiro, falso)
		
		g.definir_gradiente(g.GRADIENTE_ABAIXO, 0x3D3316 , 0x9C916F)
		g.desenhar_retangulo(1030, 110, 70, 70, verdadeiro, verdadeiro)
		g.desenhar_retangulo(1030, 200, 70, 70, verdadeiro, verdadeiro)

		g.desenhar_retangulo(1130, 110, 70, 70, verdadeiro, verdadeiro)
		g.desenhar_retangulo(1130, 200, 70, 70, verdadeiro, verdadeiro)

		g.desenhar_retangulo(1020, 280, 450, 80, verdadeiro, verdadeiro)

		g.definir_cor(g.COR_PRETO)

		g.desenhar_retangulo(1030, 110, 70, 70, verdadeiro, falso)
		g.desenhar_retangulo(1030, 200, 70, 70, verdadeiro, falso)
		g.desenhar_retangulo(1130, 110, 70, 70, verdadeiro, falso)
		g.desenhar_retangulo(1130, 200, 70, 70, verdadeiro, falso)
		
		g.desenhar_retangulo(1060, 115, 10, 60, verdadeiro, verdadeiro)
		g.desenhar_retangulo(1035, 140, 60, 10, verdadeiro, verdadeiro)
		g.desenhar_retangulo(1060, 205, 10, 60, verdadeiro, verdadeiro)
		g.desenhar_retangulo(1035, 230, 60, 10, verdadeiro, verdadeiro)

		g.desenhar_retangulo(1135, 140, 60, 10, verdadeiro, verdadeiro)
		g.desenhar_retangulo(1135, 230, 60, 10, verdadeiro, verdadeiro)
		
		g.desenhar_retangulo(1110, 115, 10, 60, verdadeiro, verdadeiro)
		g.desenhar_retangulo(1110, 205, 10, 60, verdadeiro, verdadeiro)

		g.desenhar_retangulo(1020, 280, 450, 80, verdadeiro, falso)
		g.desenhar_texto(1115, 300, "CONFIRMAR")

		g.definir_gradiente(g.GRADIENTE_ABAIXO, 0xdfdfdf , g.COR_BRANCO)
		g.desenhar_retangulo(1020, 400, 450, 580, verdadeiro, verdadeiro)
		g.desenhar_retangulo(20, 300, 450, 500, verdadeiro, verdadeiro)

		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(1020, 400, 450, 580, verdadeiro, falso)
		g.desenhar_retangulo(20, 300, 450, 500, verdadeiro, falso)

		g.definir_cor(g.COR_BRANCO)
		g.desenhar_retangulo(40, 400, 50, 50, verdadeiro, verdadeiro)
		g.definir_cor(0x00ED00)
		g.desenhar_retangulo(40, 500, 50, 50, verdadeiro, verdadeiro)
		g.definir_cor(0xFF1E00)
		g.desenhar_retangulo(40, 600, 50, 50, verdadeiro, verdadeiro)
		
			
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(40, 400, 50, 50, verdadeiro, falso)
		g.desenhar_retangulo(40, 500, 50, 50, verdadeiro, falso)
		g.desenhar_retangulo(40, 600, 50, 50, verdadeiro, falso)
		
		g.desenhar_texto(20 + ((450 - g.largura_texto("LEGENDAS")) / 2), 310, "LEGENDAS")
		
		g.desenhar_texto(100 , 410, "DISPONÍVEL")
		g.desenhar_texto(100 , 510, "RESERVADA")
		g.desenhar_texto(100 , 610, "INDISPONÍVEL")
		
		
		g.definir_cor(g.COR_PRETO)
		g.desenhar_elipse(120, 25, 200, 200, verdadeiro)
		g.definir_cor(g.COR_BRANCO)
		g.desenhar_imagem(120, 25, fundo_logo_poltronas)
		g.desenhar_porcao_imagem(0, 85, 0, 85, 450, 80, poltronas_aviao)
		g.desenhar_imagem(180, 85, icone_aviao)
		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(40.0)
		g.desenhar_texto(0, 105, " SWEET")
		g.desenhar_texto(286, 105, "FLIGHT")
		

		g.definir_cor(g.COR_VERMELHO)
		se(m.posicao_x() >= 1030 e m.posicao_x() <= 1100 e m.posicao_y() >= 110 e m.posicao_y() <= 180)
		{
			g.desenhar_retangulo(1030, 110, 70, 70, verdadeiro, falso)	
		}
		se(m.posicao_x() >= 1130 e m.posicao_x() <= 1200 e m.posicao_y() >= 110 e m.posicao_y() <= 180)
		{
			g.desenhar_retangulo(1130, 110, 70, 70, verdadeiro, falso)
		}
		se(m.posicao_x() >= 1030 e m.posicao_x() <= 1100 e m.posicao_y() >= 200 e m.posicao_y() <= 270)
		{
			g.desenhar_retangulo(1030, 200, 70, 70, verdadeiro, falso)
		}
		se(m.posicao_x() >= 1130 e m.posicao_x() <= 1200 e m.posicao_y() >= 200 e m.posicao_y() <= 270)
		{
			g.desenhar_retangulo(1130, 200, 70, 70, verdadeiro, falso)
		}
		se(m.posicao_x() >= 1020 e m.posicao_x() <= 1470 e m.posicao_y() >= 280 e m.posicao_y() <= 360)
		{
			se(temp_linhas < linhas ou temp_colunas < colunas ou temp_linhas == 0 ou temp_colunas == 0 ou (temp_linhas == linhas e temp_colunas == colunas))
			{
				
				g.definir_cor(g.COR_VERMELHO)
				g.desenhar_retangulo(1020, 280, 450, 80, verdadeiro, verdadeiro)
				
				g.definir_cor(g.COR_PRETO)
				g.definir_estilo_texto(falso, verdadeiro, falso)
				g.definir_tamanho_texto(30.0)
				
				g.desenhar_texto(1020 + ((450 - g.largura_texto("ADICIONE POLTRONAS"))/ 2), 286, "ADICIONE POLTRONAS")
				g.desenhar_texto(1020 + ((450 - g.largura_texto("PARA CONFIRMAR"))/ 2), 324, "PARA CONFIRMAR")
				g.largura_texto("ADICIONE POLTRONAS PARA CONFIRMAR")
			}
			senao
			{
				g.definir_cor(g.COR_PRETO)
				g.definir_estilo_texto(falso, verdadeiro, falso)
				g.definir_tamanho_texto(40.0)
				g.definir_cor(0x1D8C00)
				g.desenhar_retangulo(1020, 280, 450, 80, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1115, 300, "CONFIRMAR")
			}
				
		}

		se(m.algum_botao_pressionado())
		{
			temp_click = m.ler_botao()

			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 1030 e m.posicao_x() <= 1100 e m.posicao_y() >= 110 e m.posicao_y() <= 180)
			{	
				se(temp_linhas < 30 e temp_linhas >= linhas)
				{
					temp_linhas++
				}	
			}
			senao se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 1130 e m.posicao_x() <= 1200 e m.posicao_y() >= 110 e m.posicao_y() <= 180)
			{
				se(temp_linhas > 0 e temp_linhas > linhas)
				{
					temp_linhas--
				}
			}
			senao se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 1030 e m.posicao_x() <= 1100 e m.posicao_y() >= 200 e m.posicao_y() <= 270)
			{
				se(temp_colunas < 10 e temp_colunas >= colunas)
				{
					temp_colunas++
				}	
			}
			senao se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 1130 e m.posicao_x() <= 1200 e m.posicao_y() >= 200 e m.posicao_y() <= 270)
			{
				se(temp_colunas > 0 e temp_colunas > colunas)
				{
					temp_colunas--
				}	
			}
			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 1020 e m.posicao_x() <= 1470 e m.posicao_y() >= 280 e m.posicao_y() <= 360)
			{
				se(temp_linhas >= linhas e temp_colunas >= colunas e temp_linhas > 0 e temp_colunas > 0)
				{
					linhas = temp_linhas
					colunas = temp_colunas
				}
			}
		}

		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(30.0)
		g.desenhar_texto(1080, 410, "Poltronas Disponíveis")
		g.desenhar_texto(1040, 450, "A -")
		g.desenhar_texto(1040, 490, "B -")
		g.desenhar_texto(1040, 530, "C -")
		g.desenhar_texto(1040, 570, "D -")
		g.desenhar_texto(1040, 610, "E -")
		g.desenhar_texto(1040, 650, "F -")
		g.desenhar_texto(1040, 690, "G -")
		g.desenhar_texto(1040, 730, "H -")
		g.desenhar_texto(1040, 770, "I -")
		g.desenhar_texto(1040, 810, "J -")
		g.desenhar_texto(1040, 880, "TOTAL = " + tp.inteiro_para_cadeia(linhas * colunas, 10) + " Poltronas")
		
		g.definir_estilo_texto(verdadeiro, verdadeiro, falso)
		
		se(colunas >= 0 e linhas >= 0)
		{
			
			se(colunas >= 1)
			{	g.definir_cor(0x00ED00)
				g.desenhar_retangulo(1090, 447, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				
				g.desenhar_texto(1090, 450, tp.inteiro_para_cadeia(linhas, 10) + " Poltronas Disponíveis")	
			}
			senao
			{	
				g.definir_cor(0xFF1E00)
				g.desenhar_retangulo(1090, 447, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				
				g.desenhar_texto(1090, 450, "Poltronas indisponíves")	
			}
			
			se(colunas >= 2)
			{
				g.definir_cor(0x00ED00)
				g.desenhar_retangulo(1090, 487, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				
				g.desenhar_texto(1090, 490, tp.inteiro_para_cadeia(linhas, 10) + " Poltronas Disponíveis")	
			}
			senao
			{
				g.definir_cor(0xFF1E00)
				g.desenhar_retangulo(1090, 487, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
	
				g.desenhar_texto(1090, 490, "Poltronas indisponíves")	
			}
			
			se(colunas >= 3)
			{
				g.definir_cor(0x00ED00)
				g.desenhar_retangulo(1090, 527, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 530, tp.inteiro_para_cadeia(linhas, 10) + " Poltronas Disponíveis")	
			}
			senao
			{
				g.definir_cor(0xFF1E00)
				g.desenhar_retangulo(1090, 527, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 530, "Poltronas indisponíves")	
			}
			
			se(colunas >= 4)
			{
				g.definir_cor(0x00ED00)
				g.desenhar_retangulo(1090, 567, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 570, tp.inteiro_para_cadeia(linhas, 10) + " Poltronas Disponíveis")	
			}
			senao
			{
				g.definir_cor(0xFF1E00)
				g.desenhar_retangulo(1090, 567, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 570, "Poltronas indisponíves")	
			}
			
			se(colunas >= 5)
			{
				g.definir_cor(0x00ED00)
				g.desenhar_retangulo(1090, 607, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 610, tp.inteiro_para_cadeia(linhas, 10) + " Poltronas Disponíveis")	
			}
			senao
			{
				g.definir_cor(0xFF1E00)
				g.desenhar_retangulo(1090, 607, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 610, "Poltronas indisponíves")	
			}
			
			se(colunas >= 6)
			{
				g.definir_cor(0x00ED00)
				g.desenhar_retangulo(1090, 647, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 650, tp.inteiro_para_cadeia(linhas, 10) + " Poltronas Disponíveis")		
			}
			senao
			{
				g.definir_cor(0xFF1E00)
				g.desenhar_retangulo(1090, 647, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 650, "Poltronas indisponíves")	
			}
			
			se(colunas >= 7)
			{
				g.definir_cor(0x00ED00)
				g.desenhar_retangulo(1090, 687, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 690, tp.inteiro_para_cadeia(linhas, 10) + " Poltronas Disponíveis")	
			}
			senao
			{
				g.definir_cor(0xFF1E00)
				g.desenhar_retangulo(1090, 687, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 690, "Poltronas indisponíves")	
			}
			
			se(colunas >= 8)
			{
				g.definir_cor(0x00ED00)
				g.desenhar_retangulo(1090, 727, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 730, tp.inteiro_para_cadeia(linhas, 10) + " Poltronas Disponíveis")	
			}
			senao
			{
				g.definir_cor(0xFF1E00)
				g.desenhar_retangulo(1090, 727, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 730, "Poltronas indisponíves")	
			}
			
			se(colunas >= 9)
			{
				g.definir_cor(0x00ED00)
				g.desenhar_retangulo(1090, 767, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 770, tp.inteiro_para_cadeia(linhas, 10) + " Poltronas Disponíveis")	
			}
			senao
			{
				g.definir_cor(0xFF1E00)
				g.desenhar_retangulo(1090, 767, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 770, "Poltronas indisponíves")	
			}
			
			se(colunas == 10)
			{
				g.definir_cor(0x00ED00)
				g.desenhar_retangulo(1090, 807, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 810, tp.inteiro_para_cadeia(linhas, 10) + " Poltronas Disponíveis")	
			}
			senao
			{
				g.definir_cor(0xFF1E00)
				g.desenhar_retangulo(1090, 807, 375, 36, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1090, 810, "Poltronas indisponíves")	
			}
				
		}

		g.definir_cor(g.COR_PRETO)
		g.desenhar_texto(1210, 125, tp.inteiro_para_cadeia(temp_linhas, 10) + " LINHAS")
		g.desenhar_texto(1210, 215, tp.inteiro_para_cadeia(temp_colunas, 10) + " COLUNAS")
	
		desenhar_poltronas()
		
		
		g.definir_opacidade(50)
		g.desenhar_imagem(0, 0, poltronas_aviao)
		g.definir_opacidade(255)

		se(t.alguma_tecla_pressionada())
		{
			temp_tecla = t.ler_tecla()

			se(temp_tecla == t.TECLA_ESC)
			{
				opcao = 0
			}
		}
	}

	funcao realizar_reserva()
	{
		inteiro temp_click = 0
		inteiro temp_tecla = 0
		
		g.definir_cor(g.COR_BRANCO)
		g.limpar()
		g.desenhar_imagem(0, 0, poltronas_aviao)

		
		//base dos assentos
		g.desenhar_retangulo((g.largura_janela()-500)/ 2, 0, 500, g.altura_janela(), falso, verdadeiro)
		g.definir_cor(0xdfdfdf)
		g.desenhar_retangulo(((g.largura_janela()-500)/ 2) - 10, 0, 10, g.altura_janela(), falso, verdadeiro)
		g.desenhar_retangulo(((g.largura_janela()-500)/ 2) + 500, 0, 10, g.altura_janela(), falso, verdadeiro)

		g.definir_cor(0xdfdfdf)
		g.definir_opacidade(200)
		
		g.desenhar_retangulo(1020, 15, 450, 80, verdadeiro, verdadeiro)
		g.desenhar_retangulo(1020, 105, 450, 350, verdadeiro, verdadeiro)
		

				
		g.definir_opacidade(255)
		g.definir_cor(0xD4A46A)
		g.desenhar_retangulo(1125, 380, 60, 60, verdadeiro, verdadeiro)
		g.desenhar_retangulo(1030, 380, 90, 60, verdadeiro, verdadeiro)
		g.desenhar_retangulo(1305, 380, 60, 60, verdadeiro, verdadeiro)
		g.desenhar_retangulo(1370, 380, 90, 60, verdadeiro, verdadeiro)
		
		g.definir_cor(g.COR_BRANCO)
		g.desenhar_retangulo(1050, 160, 120, 60, verdadeiro, verdadeiro)
		g.desenhar_retangulo(1050, 270, 390, 60, verdadeiro, verdadeiro)
		g.desenhar_retangulo(1195, 380, 100, 60, verdadeiro, verdadeiro)
		
		// + ((450 - g.largura_texto("Cadastrar Passageiro")) / 2)
		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(40.0)
		g.desenhar_texto(1020 + ((450 - g.largura_texto("Cadastrar Passageiro")) / 2), 35, "Cadastrar Passageiro")
		g.desenhar_texto(1020 + ((450 - g.largura_texto("Poltrona Escolhida")) / 2), 120, "Poltrona Escolhida")
		g.desenhar_texto(1020 + ((450 - g.largura_texto("Nome do Passageiro")) / 2), 230, "Nome do Passageiro")
		g.desenhar_texto(1020 + ((450 - g.largura_texto("Idade do Passageiro")) / 2), 340, "Idade do Passageiro")
		g.desenhar_texto(1125 + ((60 - g.largura_texto("-1")) / 2), 390, "-1")
		g.desenhar_texto(1030 + ((90 - g.largura_texto("-10")) / 2), 390, "-10")
		g.desenhar_texto(1305 + ((60 - g.largura_texto("+1")) / 2), 390, "+1")
		g.desenhar_texto(1370 + ((90 - g.largura_texto("+10")) / 2), 390, "+10")
		
		//g.desenhar_texto(1030, 35, "Cadastrar Passageiro")
		
		g.desenhar_retangulo(1050, 160, 120, 60, verdadeiro, falso)
		g.desenhar_retangulo(1050, 270, 390, 60, verdadeiro, falso)//imput aqui
		g.desenhar_retangulo(1195, 380, 100, 60, verdadeiro, falso)
		g.desenhar_retangulo(1125, 380, 60, 60, verdadeiro, falso)
		g.desenhar_retangulo(1030, 380, 90, 60, verdadeiro, falso)
		g.desenhar_retangulo(1305, 380, 60, 60, verdadeiro, falso)
		g.desenhar_retangulo(1370, 380, 90, 60, verdadeiro, falso)
		g.desenhar_retangulo(1180, 160, 280, 60, verdadeiro, falso)
		
		g.desenhar_retangulo(1020 , 15, 450, 80, verdadeiro, falso)
		g.desenhar_retangulo(1020, 105, 450, 350, verdadeiro, falso)
		
		g.definir_gradiente(g.GRADIENTE_ABAIXO, 0x3D3316 , 0x9C916F)
		g.desenhar_retangulo(1020, 460, 450, 80, verdadeiro, verdadeiro)
		g.desenhar_retangulo(1180, 160, 280, 60, verdadeiro, verdadeiro)
		
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(1020, 460, 450, 80, verdadeiro, falso)
		g.desenhar_texto(1115, 480, "CONFIRMAR")
		
		g.desenhar_texto(1180 + ((280 - g.largura_texto("CONFIRMAR")) / 2), 160 + ((60 - g.altura_texto("CONFIRMAR")) / 2), "CONFIRMAR")

		//quadro legenda
		g.definir_gradiente(g.GRADIENTE_ABAIXO, 0xdfdfdf , g.COR_BRANCO)
		g.desenhar_retangulo(20, 300, 450, 500, verdadeiro, verdadeiro)
		
		//quadro legenda
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(20, 300, 450, 500, verdadeiro, falso)
		
		//cores legenda
		g.definir_cor(g.COR_BRANCO)
		g.desenhar_retangulo(40, 400, 50, 50, verdadeiro, verdadeiro)
		g.definir_cor(0x00ED00)
		g.desenhar_retangulo(40, 500, 50, 50, verdadeiro, verdadeiro)
		g.definir_cor(0xFF1E00)
		g.desenhar_retangulo(40, 600, 50, 50, verdadeiro, verdadeiro)
		//borda cores legenda	
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(40, 400, 50, 50, verdadeiro, falso)
		g.desenhar_retangulo(40, 500, 50, 50, verdadeiro, falso)
		g.desenhar_retangulo(40, 600, 50, 50, verdadeiro, falso)
		
		g.desenhar_texto(20 + ((450 - g.largura_texto("LEGENDAS")) / 2), 310, "LEGENDAS")
		
		g.desenhar_texto(100 , 410, "DISPONÍVEL")
		g.desenhar_texto(100 , 510, "RESERVADA")
		g.desenhar_texto(100 , 610, "INDISPONÍVEL")

		//logo sweet flight
		g.definir_cor(g.COR_PRETO)
		g.desenhar_elipse(120, 25, 200, 200, verdadeiro)
		g.definir_cor(g.COR_BRANCO)
		g.desenhar_imagem(120, 25, fundo_logo_poltronas)
		g.desenhar_porcao_imagem(0, 85, 0, 85, 450, 80, poltronas_aviao)
		g.desenhar_imagem(180, 85, icone_aviao)
		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(40.0)
		g.desenhar_texto(0, 105, " SWEET")
		g.desenhar_texto(286, 105, "FLIGHT")

		
		desenhar_poltronas()
		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, falso, falso)
		g.definir_tamanho_texto(14.3)
		
		para(inteiro i = 0; i < maximo_linhas; i++)
		{
				para(inteiro n = 0; n < maximo_colunas; n++)
				{
					se(n < 3)
					{
						se(m.posicao_x() >= (((g.largura_janela()-500)/ 2) + 40) + (10 * n) + ( largura_poltrona * n) e m.posicao_x() <= (((g.largura_janela()-500)/ 2) + 40) + (10 * n) + ( largura_poltrona * n)+ largura_poltrona e m.posicao_y() >= 50 + (10 * i) + (altura_poltrona + altura_poltrona * i) e m.posicao_y() <= 50 + (10 * i) + (altura_poltrona + altura_poltrona * i) + altura_poltrona)
						{
							
							g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 39) + (10 * n) + ( largura_poltrona * n), 49 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona + 2, altura_poltrona + 2, verdadeiro, falso)	
							g.desenhar_texto((((g.largura_janela()-500)/ 2) + 39) + (10 * n) + ( largura_poltrona * n) + ((largura_poltrona - g.largura_texto(tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))) / 2), 49 + (10 * i) + (altura_poltrona + altura_poltrona * i) + ((altura_poltrona - g.altura_texto(tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))) / 2), tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))
						}
					}
					
					se(n < 7 e n >= 3)
					{
						se(m.posicao_x() >= (((g.largura_janela()-500)/ 2) + 85) + (10 * n) + ( largura_poltrona * n) e m.posicao_x() <= (((g.largura_janela()-500)/ 2) + 85) + (10 * n) + ( largura_poltrona * n)+ largura_poltrona e m.posicao_y() >= 50 + (10 * i) + (altura_poltrona + altura_poltrona * i) e m.posicao_y() <= 50 + (10 * i) + (altura_poltrona + altura_poltrona * i) + altura_poltrona)
						{
						
							g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 84) + (10 * n) + ( largura_poltrona * n), 49 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona + 2, altura_poltrona + 2, verdadeiro, falso)	
							g.desenhar_texto((((g.largura_janela()-500)/ 2) + 84) + (10 * n) + ( largura_poltrona * n) + ((largura_poltrona - g.largura_texto(tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))) / 2), 49 + (10 * i) + (altura_poltrona + altura_poltrona * i) + ((altura_poltrona - g.altura_texto(tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))) / 2), tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))
						}
					}
					
					se(n >= 7)
					{
						se(m.posicao_x() >= (((g.largura_janela()-500)/ 2) + 130) + (10 * n) + ( largura_poltrona * n) e m.posicao_x() <= (((g.largura_janela()-500)/ 2) + 130) + (10 * n) + ( largura_poltrona * n)+ largura_poltrona e m.posicao_y() >= 50 + (10 * i) + (altura_poltrona + altura_poltrona * i) e m.posicao_y() <= 50 + (10 * i) + (altura_poltrona + altura_poltrona * i) + altura_poltrona)
						{
							
							g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 129) + (10 * n) + ( largura_poltrona * n), 49 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona + 2, altura_poltrona + 2, verdadeiro, falso)	
							g.desenhar_texto((((g.largura_janela()-500)/ 2) + 129) + (10 * n) + ( largura_poltrona * n) + ((largura_poltrona - g.largura_texto(tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))) / 2), 49 + (10 * i) + (altura_poltrona + altura_poltrona * i) + ((altura_poltrona - g.altura_texto(tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))) / 2), tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))
						}
					}
					
				}
		}

		se(m.algum_botao_pressionado())
		{
			temp_click = m.ler_botao()

			para(inteiro i = 0; i < maximo_linhas; i++)
			{
				para(inteiro n = 0; n < maximo_colunas; n++)
				{
					se(n < 3)
					{
						se(confimar_poltrona == falso e temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= (((g.largura_janela()-500)/ 2) + 40) + (10 * n) + ( largura_poltrona * n) e m.posicao_x() <= (((g.largura_janela()-500)/ 2) + 40) + (10 * n) + ( largura_poltrona * n)+ largura_poltrona e m.posicao_y() >= 50 + (10 * i) + (altura_poltrona + altura_poltrona * i) e m.posicao_y() <= 50 + (10 * i) + (altura_poltrona + altura_poltrona * i) + altura_poltrona)
						{
							poltrona = tp.caracter_para_cadeia(t.caracter_tecla(65 + n)) + "-" + tp.inteiro_para_cadeia(i + 1, 10) 
							linha_poltrona_selecionada = i 
							coluna_poltrona_selecionada = n 
							
						}
					}
					
					se(n < 7 e n >= 3)
					{
						se(confimar_poltrona == falso e temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= (((g.largura_janela()-500)/ 2) + 85) + (10 * n) + ( largura_poltrona * n) e m.posicao_x() <= (((g.largura_janela()-500)/ 2) + 85) + (10 * n) + ( largura_poltrona * n)+ largura_poltrona e m.posicao_y() >= 50 + (10 * i) + (altura_poltrona + altura_poltrona * i) e m.posicao_y() <= 50 + (10 * i) + (altura_poltrona + altura_poltrona * i) + altura_poltrona)
						{
							poltrona = tp.caracter_para_cadeia(t.caracter_tecla(65 + n)) + "-" + tp.inteiro_para_cadeia(i + 1, 10) 
							linha_poltrona_selecionada = i
							coluna_poltrona_selecionada = n
						}
					}
					
					se(n >= 7)
					{
						se(confimar_poltrona == falso e temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= (((g.largura_janela()-500)/ 2) + 130) + (10 * n) + ( largura_poltrona * n) e m.posicao_x() <= (((g.largura_janela()-500)/ 2) + 130) + (10 * n) + ( largura_poltrona * n)+ largura_poltrona e m.posicao_y() >= 50 + (10 * i) + (altura_poltrona + altura_poltrona * i) e m.posicao_y() <= 50 + (10 * i) + (altura_poltrona + altura_poltrona * i) + altura_poltrona)
						{
							poltrona = tp.caracter_para_cadeia(t.caracter_tecla(65 + n)) + "-" + tp.inteiro_para_cadeia(i + 1, 10) 
							linha_poltrona_selecionada = i
							coluna_poltrona_selecionada = n
						}
					}
				}
			}

			se(linha_poltrona_selecionada <= linhas - 1 e coluna_poltrona_selecionada <= colunas - 1 e confimar_poltrona == falso)
			{	
				se(linha_poltrona_selecionada >= 0 e coluna_poltrona_selecionada >= 0 )
				{
					
					g.definir_cor(0x1D8C00)
					g.desenhar_retangulo(1180, 160, 280, 60, verdadeiro, verdadeiro)
					g.definir_cor(g.COR_PRETO)
					g.desenhar_retangulo(1180, 160, 280, 60, verdadeiro,falso)
					
					g.definir_estilo_texto(falso, verdadeiro, falso)
					g.definir_tamanho_texto(40.0)
					g.desenhar_texto(1180 + ((280 - g.largura_texto("CONFIRMAR")) / 2), 160 + ((60 - g.altura_texto("CONFIRMAR")) / 2), "CONFIRMAR")
					
					
					se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 1180 e m.posicao_x() <= 1460 e  m.posicao_y() >= 160 e m.posicao_y() <= 220 e confimar_poltrona == falso)
					{
						g.definir_cor(g.COR_PRETO)
						g.desenhar_retangulo(1180, 160, 280, 60, verdadeiro, verdadeiro)

						se(poltronas_disponiveis[linha_poltrona_selecionada][coluna_poltrona_selecionada] == -1)
						{
							poltronas_selecionada[linha_poltrona_selecionada][coluna_poltrona_selecionada] = 0
							confimar_poltrona = verdadeiro
						}
						
					}
					
				}
			
			}	
			senao
			{
				g.definir_cor(g.COR_VERMELHO)
				g.desenhar_retangulo(1180, 160, 280, 60, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_retangulo(1180, 160, 280, 60, verdadeiro,falso)
				g.definir_estilo_texto(falso, falso, falso)
				g.definir_tamanho_texto(25.0)
				g.desenhar_texto(1180 + ((280 - g.largura_texto("ESCOLHA UMA")) / 2), 165, "ESCOLHA UMA")
				g.desenhar_texto(1180 + ((280 - g.largura_texto("POLTRONA LIVRE")) / 2), 193, "POLTRONA LIVRE")
				
			}
			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 1050 e m.posicao_x() <= 1440 e  m.posicao_y() >= 270 e m.posicao_y() <= 330)
			{
				digitando = verdadeiro
				
			}
			
			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 1125 e m.posicao_x() <= 1185 e  m.posicao_y() >= 380 e m.posicao_y() <= 440 e digitado == verdadeiro)
			{
				se(idade >= 1)
				{
					idade--
				}
			}
			
			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 1305 e m.posicao_x() <= 1365 e  m.posicao_y() >= 380 e m.posicao_y() <= 440 e digitado == verdadeiro)
			{
				se(idade <=124)
				{
					idade++
				}
			}
			
			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 1030 e m.posicao_x() <= 1120 e  m.posicao_y() >= 380 e m.posicao_y() <= 440 e digitado == verdadeiro)
			{
				se(idade >= 10)
				{
					idade -= 10
				}
			}
			
			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 1370 e m.posicao_x() <= 1460 e  m.posicao_y() >= 380 e m.posicao_y() <= 440 e digitado == verdadeiro)
			{
				se(idade <= 115)
				{
					idade += 10	
				}	
			}

			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 1020 e m.posicao_x() <= 1470 e  m.posicao_y() >= 460 e m.posicao_y() <= 540 e confimar_poltrona == verdadeiro e (idade > 0 e idade <= 125) e linha_poltrona_selecionada >= 0)
			{
				se((idade > 0 e idade <= 125) e digitado == verdadeiro e confimar_poltrona == verdadeiro e txt.numero_caracteres(nome_digitado) >= 3)
				{
					quantidade_passageiros++
					idade_passageiro[linha_poltrona_selecionada][coluna_poltrona_selecionada] = idade
					nome_passageiro[linha_poltrona_selecionada][coluna_poltrona_selecionada] = nome_digitado
					poltronas_disponiveis[linha_poltrona_selecionada][coluna_poltrona_selecionada] = 0
					coluna_poltrona_selecionada = -1
					poltrona = "A-0"
					nome_digitado = ""
					idade = 0
					confimar_poltrona = falso
					digitando = falso
					digitado = falso
					linha_poltrona_selecionada = -1
				}
				
			}
			
			temp_click = -1
			
		}
		//idade_digitada
		se(digitado == verdadeiro)
		{
			g.definir_cor(g.COR_PRETO)
			g.definir_estilo_texto(falso, falso, falso)
			g.definir_tamanho_texto(20.0)
			
			g.desenhar_texto(1050 + ((390 - g.largura_texto(nome_digitado)) / 2), 290, nome_digitado)

			g.definir_estilo_texto(falso, verdadeiro, falso)
			g.definir_tamanho_texto(40.0)
			g.desenhar_texto(1195 + ((100 - g.largura_texto(tp.inteiro_para_cadeia(idade, 10))) / 2), 390, tp.inteiro_para_cadeia(idade, 10))
		}
		se(digitando == verdadeiro e confimar_poltrona == verdadeiro)
		{
			desenhar_imput()
		}

		se(linha_poltrona_selecionada <= linhas - 1 e coluna_poltrona_selecionada <= colunas - 1 e confimar_poltrona == falso)
		{	
			se(linha_poltrona_selecionada >= 0 e coluna_poltrona_selecionada >= 0 e poltronas_disponiveis[linha_poltrona_selecionada][coluna_poltrona_selecionada] == -1)
			{
				
				g.definir_cor(0x1D8C00)
				g.desenhar_retangulo(1180, 160, 280, 60, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_retangulo(1180, 160, 280, 60, verdadeiro,falso)
				
				g.definir_estilo_texto(falso, verdadeiro, falso)
				g.definir_tamanho_texto(40.0)
				g.desenhar_texto(1180 + ((280 - g.largura_texto("CONFIRMAR")) / 2), 160 + ((60 - g.altura_texto("CONFIRMAR")) / 2), "CONFIRMAR")

			}
			se(linha_poltrona_selecionada >= 0 e coluna_poltrona_selecionada >= 0 )
			{
				se(poltronas_disponiveis[linha_poltrona_selecionada][coluna_poltrona_selecionada] == 0)
				{
					g.definir_cor(g.COR_VERMELHO)
					g.desenhar_retangulo(1180, 160, 280, 60, verdadeiro, verdadeiro)
					g.definir_cor(g.COR_PRETO)
					g.desenhar_retangulo(1180, 160, 280, 60, verdadeiro,falso)
					g.definir_estilo_texto(falso, falso, falso)
					g.definir_tamanho_texto(25.0)
					g.desenhar_texto(1180 + ((280 - g.largura_texto("ESCOLHA UMA")) / 2), 165, "ESCOLHA UMA")
					g.desenhar_texto(1180 + ((280 - g.largura_texto("POLTRONA LIVRE")) / 2), 193, "POLTRONA LIVRE")
				}
			}
			
		}	
		senao
		{
			se(confimar_poltrona == verdadeiro)
			{
				g.definir_cor(0XFF5F00)
				g.desenhar_retangulo(1180, 160, 280, 60, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_retangulo(1180, 160, 280, 60, verdadeiro,falso)
				g.definir_estilo_texto(falso, falso, falso)
				g.definir_tamanho_texto(21.0)
				g.desenhar_texto(1180 + ((280 - g.largura_texto("POLTRONA SELECIONADA")) / 2), 166, "POLTRONA SELECIONADA")
				g.desenhar_texto(1180 + ((280 - g.largura_texto("COM SUCESSO!")) / 2), 192, "COM SUCESSO!")

			}
			senao
			{
				g.definir_cor(g.COR_VERMELHO)
				g.desenhar_retangulo(1180, 160, 280, 60, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_retangulo(1180, 160, 280, 60, verdadeiro,falso)
				g.definir_estilo_texto(falso, falso, falso)
				g.definir_tamanho_texto(25.0)
				g.desenhar_texto(1180 + ((280 - g.largura_texto("ESCOLHA UMA")) / 2), 165, "ESCOLHA UMA")
				g.desenhar_texto(1180 + ((280 - g.largura_texto("POLTRONA LIVRE")) / 2), 193, "POLTRONA LIVRE")
			}
		}

		se(confimar_poltrona == verdadeiro)
		{
			poltrona = tp.caracter_para_cadeia(t.caracter_tecla(65 + coluna_poltrona_selecionada)) + "-" + tp.inteiro_para_cadeia(linha_poltrona_selecionada + 1, 10)
			
		}
		
			g.definir_cor(g.COR_PRETO)
			g.definir_estilo_texto(falso, verdadeiro, falso)
			g.definir_tamanho_texto(40.0)
			g.desenhar_texto(1050 + ((120 - g.largura_texto(poltrona)) / 2), 170, poltrona)
		
		
		
		se(m.posicao_x() >= 1020 e m.posicao_x() <= 1470 e m.posicao_y() >= 460 e m.posicao_y() <= 540)
		{
			se((idade > 0 e idade <= 125) e digitado == verdadeiro e confimar_poltrona == verdadeiro e  txt.numero_caracteres(nome_digitado) >= 3)
			{
				g.definir_cor(g.COR_PRETO)
				g.definir_estilo_texto(falso, verdadeiro, falso)
				g.definir_tamanho_texto(40.0)
				g.definir_cor(0x1D8C00)
				g.desenhar_retangulo(1020, 460, 450, 80, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.desenhar_texto(1115, 480, "CONFIRMAR")	
			}
			senao
			{
				g.definir_cor(g.COR_VERMELHO)
				g.desenhar_retangulo(1020, 460, 450, 80, verdadeiro, verdadeiro)
				
				g.definir_cor(g.COR_PRETO)
				g.definir_estilo_texto(falso, verdadeiro, falso)
				g.definir_tamanho_texto(30.0)
				
				g.desenhar_texto(1020 + ((450 - g.largura_texto("VERIFIQUE OS"))/ 2), 466, "VERIFIQUE OS")
				g.desenhar_texto(1020 + ((450 - g.largura_texto("DADOS DIGITADOS"))/ 2), 494, "DADOS DIGITADOS")
				
			}
				
		}

		se(m.algum_botao_pressionado())
		{
			temp_click = m.ler_botao()
		}

		//desenhar_poltronas()
		
		g.definir_opacidade(50)
		g.desenhar_imagem(0, 0, poltronas_aviao)
		g.definir_opacidade(255)

		se(t.alguma_tecla_pressionada())
		{
			temp_tecla = t.ler_tecla()

			se(temp_tecla == t.TECLA_ESC)
			{
				opcao = 0
			}
		}
	
	}

	funcao visualizar_poltronas()
	{
		inteiro temp_tecla = 0
		
		g.definir_cor(g.COR_BRANCO)
		g.limpar()
		g.desenhar_imagem(0, 0, poltronas_aviao)

		//base dos assentos
		g.desenhar_retangulo((g.largura_janela()-500)/ 2, 0, 500, g.altura_janela(), falso, verdadeiro)
		g.definir_cor(0xdfdfdf)
		g.desenhar_retangulo(((g.largura_janela()-500)/ 2) - 10, 0, 10, g.altura_janela(), falso, verdadeiro)
		g.desenhar_retangulo(((g.largura_janela()-500)/ 2) + 500, 0, 10, g.altura_janela(), falso, verdadeiro)

		g.definir_cor(0xdfdfdf)
		g.definir_opacidade(200)
		g.desenhar_retangulo(1020, 10, 460, 980, verdadeiro, verdadeiro)
		
		g.definir_opacidade(255)
		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(40.0)

		g.desenhar_retangulo(1020, 10, 460, 980, verdadeiro, falso)
		g.desenhar_texto(1020 + ((460 - g.largura_texto("PASSAGEIROS")) / 2), 35, "PASSAGEIROS")

		
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(30.0)
		g.desenhar_texto(1030, 100 , "NOME")
		g.desenhar_texto(1300 , 100 , "IDADE")
		g.desenhar_texto(1410 , 100 , "POS")
		
		para(inteiro i = 0; i < linhas; i++)
		{
			para(inteiro n = 0; n < colunas; n++)
			{
				se(poltronas_disponiveis[i][n] == 0)
				{
					g.definir_tamanho_texto(20.0)
					g.definir_estilo_texto(verdadeiro, falso, falso)

					g.desenhar_texto(1030 , 140 + (30 * quantidade_passageiros_top + 5), nome_passageiro[i][n])
					g.desenhar_texto(1335 , 140 + (30 * quantidade_passageiros_top + 5), tp.inteiro_para_cadeia(idade_passageiro[i][n], 10))
					g.desenhar_texto(1420 , 140 + (30 * quantidade_passageiros_top + 5), tp.caracter_para_cadeia(t.caracter_tecla(65 + n)) + "-" + tp.inteiro_para_cadeia(i, 10))
					g.desenhar_linha(1030, 160 + (30 * quantidade_passageiros_top + 5), 1460, 160 + (30 * quantidade_passageiros_top + 5))
				
					quantidade_passageiros_top++
				}
			}
		}
		quantidade_passageiros_top = 0

		
		//quadro legenda
		g.definir_gradiente(g.GRADIENTE_ABAIXO, 0xdfdfdf , g.COR_BRANCO)
		g.desenhar_retangulo(20, 300, 450, 500, verdadeiro, verdadeiro)
		
		//quadro legenda
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(20, 300, 450, 500, verdadeiro, falso)
		
		//cores legenda
		g.definir_cor(g.COR_BRANCO)
		g.desenhar_retangulo(40, 400, 50, 50, verdadeiro, verdadeiro)
		g.definir_cor(0x00ED00)
		g.desenhar_retangulo(40, 500, 50, 50, verdadeiro, verdadeiro)
		g.definir_cor(0xFF1E00)
		g.desenhar_retangulo(40, 600, 50, 50, verdadeiro, verdadeiro)
		//borda cores legenda	
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(40, 400, 50, 50, verdadeiro, falso)
		g.desenhar_retangulo(40, 500, 50, 50, verdadeiro, falso)
		g.desenhar_retangulo(40, 600, 50, 50, verdadeiro, falso)

		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(40.0)
		g.desenhar_texto(20 + ((450 - g.largura_texto("LEGENDAS")) / 2), 310, "LEGENDAS")
		
		g.desenhar_texto(100 , 410, "DISPONÍVEL")
		g.desenhar_texto(100 , 510, "RESERVADA")
		g.desenhar_texto(100 , 610, "INDISPONÍVEL")

		//logo sweet flight
		g.definir_cor(g.COR_PRETO)
		g.desenhar_elipse(120, 25, 200, 200, verdadeiro)
		g.definir_cor(g.COR_BRANCO)
		g.desenhar_imagem(120, 25, fundo_logo_poltronas)
		g.desenhar_porcao_imagem(0, 85, 0, 85, 450, 80, poltronas_aviao)
		g.desenhar_imagem(180, 85, icone_aviao)
		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(40.0)
		g.desenhar_texto(0, 105, " SWEET")
		g.desenhar_texto(286, 105, "FLIGHT")

		desenhar_poltronas()

		se(t.alguma_tecla_pressionada())
		{
			temp_tecla = t.ler_tecla()

			se(temp_tecla == t.TECLA_ESC)
			{
				opcao = 0
			}
		}
		
	}
	
	funcao consultar_passageiro()
	{
		inteiro temp_tecla = 0
		cadeia nome_consultado
		inteiro temp_click = -1
		
		g.definir_cor(g.COR_BRANCO)
		g.limpar()
		g.desenhar_imagem(0, 0, poltronas_aviao)

		//base dos assentos
		g.desenhar_retangulo((g.largura_janela()-500)/ 2, 0, 500, g.altura_janela(), falso, verdadeiro)
		g.definir_cor(0xdfdfdf)
		g.desenhar_retangulo(((g.largura_janela()-500)/ 2) - 10, 0, 10, g.altura_janela(), falso, verdadeiro)
		g.desenhar_retangulo(((g.largura_janela()-500)/ 2) + 500, 0, 10, g.altura_janela(), falso, verdadeiro)

		g.definir_cor(0xdfdfdf)
		g.definir_opacidade(200)
		g.desenhar_retangulo(1020, 180, 470, 800, verdadeiro, verdadeiro)
		
		
		g.definir_cor(g.COR_BRANCO)
		g.desenhar_retangulo(1030, 270, 450, 60, verdadeiro, verdadeiro)

		g.definir_gradiente(g.GRADIENTE_ABAIXO, 0x3D3316 , 0x9C916F)
		g.desenhar_retangulo(1050, 360, 410, 80, verdadeiro, verdadeiro)
		
		g.definir_opacidade(255)
		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(35.0)

		g.desenhar_retangulo(1020, 180, 470, 800, verdadeiro, falso)
		g.desenhar_retangulo(1030, 270, 450, 60, verdadeiro, falso)//input
		g.desenhar_retangulo(1050, 360, 410, 80, verdadeiro, falso)//confirmar
		g.desenhar_texto(1020 + ((470 - g.largura_texto("DIGITE O NOME")) / 2), 205, "DIGITE O NOME")

		g.definir_tamanho_texto(40.0)
		g.desenhar_texto(1050 +((410 - g.largura_texto("CONFIRMAR")) / 2), 380, "CONFIRMAR")
		
		se(m.algum_botao_pressionado())
		{
			temp_click = m.ler_botao()

			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 1030 e m.posicao_x() <= 1480 e m.posicao_y() >= 270 e m.posicao_y() <= 330)
			{	
				
				digitando = verdadeiro
	
			}

			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 1050 e m.posicao_x() <= 1460 e m.posicao_y() >= 360 e m.posicao_y() <= 440 e digitado == verdadeiro)
			{
				consulta_realizada++
				encontrado = falso
				
				para(inteiro i = 0; i < linhas; i++)
				{
					para(inteiro n = 0; n < colunas; n++)
					{
						poltronas_selecionada[i][n] = - 1
					}
				}
				
				se(digitado == verdadeiro e encontrado == falso)
				{
					
					para(inteiro i = 0; i < linhas; i++)
					{
						para(inteiro n = 0; n < colunas; n++)
						{
							se(nome_digitado == nome_passageiro[i][n] e poltronas_disponiveis[i][n] == 0)
							{
								
								poltronas_selecionada[i][n] = - 2
								encontrado = verdadeiro
								consulta_realizada = 0
								
										
							}
							
						}
					}
					
				}
				
	
				nome_digitado = ""
			}
			
		}

		se(digitado == verdadeiro)
		{
			g.definir_cor(g.COR_PRETO)
			g.definir_estilo_texto(falso, falso, falso)
			g.definir_tamanho_texto(20.0)
			g.desenhar_texto(1245 - (g.largura_texto(nome_digitado) / 2), 290, nome_digitado)
			g.desenhar_texto(1245 - (g.largura_texto(nome_digitado) / 2), 290, nome_digitado)
		}
		se(m.posicao_x() >= 1050 e m.posicao_x() <= 1460 e m.posicao_y() >= 360 e m.posicao_y() <= 440)
		{ 
			se(digitado == verdadeiro e nome_digitado != "")
			{
				g.definir_cor(0x1D8C00)
				g.desenhar_retangulo(1050, 360, 410, 80, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.definir_tamanho_texto(40.0)
				g.desenhar_retangulo(1050, 360, 410, 80, verdadeiro, falso)
				g.desenhar_texto(1050 +((410 - g.largura_texto("CONFIRMAR")) / 2), 380, "CONFIRMAR")
			}
			senao
			{
				g.definir_cor(g.COR_VERMELHO)
				g.desenhar_retangulo(1050, 360, 410, 80, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.definir_tamanho_texto(40.0)
				g.desenhar_retangulo(1050, 360, 410, 80, verdadeiro, falso)
				g.desenhar_texto(1050 +((410 - g.largura_texto("CONFIRMAR")) / 2), 380, "CONFIRMAR")
			}
			
		}

		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(30.0)
		g.desenhar_texto(1030, 500 , "NOME")
		g.desenhar_texto(1270 , 500 , "IDADE")
		g.desenhar_texto(1410 , 500 , "POS")
		

		se(encontrado == verdadeiro)
		{
			para(inteiro i = 0; i < linhas; i++)
			{
				para(inteiro n = 0; n < colunas; n++)
				{

					se(poltronas_selecionada[i][n] == - 2)
					{
						
						g.definir_tamanho_texto(20.0)
						g.definir_estilo_texto(verdadeiro, falso, falso)
	
						g.desenhar_texto(1030 , 540 + (30 * quantidade_passageiros_top + 5), nome_passageiro[i][n])
						g.desenhar_texto(1335 , 540 + (30 * quantidade_passageiros_top + 5), tp.inteiro_para_cadeia(idade_passageiro[i][n], 10))
						g.desenhar_texto(1420 , 540 + (30 * quantidade_passageiros_top + 5), tp.caracter_para_cadeia(t.caracter_tecla(65 + n)) + "-" + tp.inteiro_para_cadeia(i, 10))
						g.desenhar_linha(1030 , 560 + (30 * quantidade_passageiros_top + 5), 1460, 560 + (30 * quantidade_passageiros_top + 5))
						
						
						quantidade_passageiros_top++
					}
					
				}
			}
			
		}
		se(encontrado == falso e consulta_realizada > 0)
		{
			
			g.desenhar_texto(1020 + ((470 - g.largura_texto("Não há reservas realizadas")) / 2), 600, "Não há reservas realizadas")
			g.desenhar_texto(1020 + ((470 - g.largura_texto("para este passageiro!")) / 2) , 640, "para este passageiro!")
		}
		
		
		quantidade_passageiros_top = 0
		
		se(digitando == verdadeiro)
		{
			desenhar_imput()
		}
		
		//quadro legenda
		g.definir_gradiente(g.GRADIENTE_ABAIXO, 0xdfdfdf , g.COR_BRANCO)
		g.desenhar_retangulo(20, 300, 450, 500, verdadeiro, verdadeiro)
		
		//quadro legenda
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(20, 300, 450, 500, verdadeiro, falso)
		
		//cores legenda
		g.definir_cor(g.COR_BRANCO)
		g.desenhar_retangulo(40, 400, 50, 50, verdadeiro, verdadeiro)
		g.definir_cor(0x00ED00)
		g.desenhar_retangulo(40, 500, 50, 50, verdadeiro, verdadeiro)
		g.definir_cor(0xFF1E00)
		g.desenhar_retangulo(40, 600, 50, 50, verdadeiro, verdadeiro)
		//borda cores legenda	
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(40, 400, 50, 50, verdadeiro, falso)
		g.desenhar_retangulo(40, 500, 50, 50, verdadeiro, falso)
		g.desenhar_retangulo(40, 600, 50, 50, verdadeiro, falso)

		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(40.0)
		g.desenhar_texto(20 + ((450 - g.largura_texto("LEGENDAS")) / 2), 310, "LEGENDAS")
		
		g.desenhar_texto(100 , 410, "DISPONÍVEL")
		g.desenhar_texto(100 , 510, "RESERVADA")
		g.desenhar_texto(100 , 610, "INDISPONÍVEL")

		//logo sweet flight
		g.definir_cor(g.COR_PRETO)
		g.desenhar_elipse(120, 25, 200, 200, verdadeiro)
		g.definir_cor(g.COR_BRANCO)
		g.desenhar_imagem(120, 25, fundo_logo_poltronas)
		g.desenhar_porcao_imagem(0, 85, 0, 85, 450, 80, poltronas_aviao)
		g.desenhar_imagem(180, 85, icone_aviao)
		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(40.0)
		g.desenhar_texto(0, 105, " SWEET")
		g.desenhar_texto(286, 105, "FLIGHT")

		desenhar_poltronas()

		se(t.alguma_tecla_pressionada())
		{
			temp_tecla = t.ler_tecla()

			se(temp_tecla == t.TECLA_ESC)
			{
			
				para(inteiro i = 0; i < linhas; i++)
				{
					para(inteiro n = 0; n < colunas; n++)
					{
						poltronas_selecionada[i][n] = - 1
					}
				}
				
				opcao = 0
			}
		}
	}

	funcao status_aeronave()
	{
		inteiro temp_tecla = 0
		cadeia nome_consultado
		inteiro total_disponiveis
		inteiro total_poltronas
		real porcentagem_disponiveis
		real porcentagem_reservados
		

		verificar_idade = verdadeiro
		
		g.definir_cor(g.COR_BRANCO)
		g.limpar()
		g.desenhar_imagem(0, 0, poltronas_aviao)

		//base dos assentos
		g.desenhar_retangulo((g.largura_janela()-500)/ 2, 0, 500, g.altura_janela(), falso, verdadeiro)
		g.definir_cor(0xdfdfdf)
		g.desenhar_retangulo(((g.largura_janela()-500)/ 2) - 10, 0, 10, g.altura_janela(), falso, verdadeiro)
		g.desenhar_retangulo(((g.largura_janela()-500)/ 2) + 500, 0, 10, g.altura_janela(), falso, verdadeiro)

		g.definir_cor(0xdfdfdf)
		g.definir_opacidade(200)
		g.desenhar_retangulo(1020, 10, 460, 980, verdadeiro, verdadeiro)
		
		g.definir_opacidade(255)
		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(40.0)

		g.desenhar_retangulo(1020, 10, 460, 980, verdadeiro, falso)
		g.desenhar_texto(1020 + ((460 - g.largura_texto("STATUS OCUPAÇÃO")) / 2), 35, "STATUS OCUPAÇÃO")

		total_poltronas = (linhas * colunas)
		total_disponiveis = total_poltronas - quantidade_passageiros
		
		porcentagem_disponiveis = mat.arredondar((100 / tp.inteiro_para_real(total_poltronas)) * total_disponiveis, 2)
		porcentagem_reservados = mat.arredondar((100 / tp.inteiro_para_real(total_poltronas)) * quantidade_passageiros, 2)

		//porcentagem_reservados = mat.arredondar((100 / tp.inteiro_para_real(total_poltronas)) * criancas, 2)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(30.0)
		g.desenhar_texto(1020 + ((460 - g.largura_texto("Poltronas Disponíveis")) / 2), 90, "Poltronas Disponíveis")
		g.desenhar_texto(1020 + ((460 - g.largura_texto("Poltronas Reservadas")) / 2), 240, "Poltronas Reservadas")
		g.desenhar_texto(1020 + ((460 - g.largura_texto("Passageiros Crianças")) / 2), 390, "Passageiros Crianças")
		g.desenhar_texto(1020 + ((460 - g.largura_texto("Passageiros Adolescentes")) / 2), 540, "Passageiros Adolescentes")
		g.desenhar_texto(1020 + ((460 - g.largura_texto("Passageiros Adultos")) / 2), 690, "Passageiros Adultos")
		g.desenhar_texto(1020 + ((460 - g.largura_texto("Passageiros Idosos")) / 2), 840, "Passageiros Idosos")
		g.desenhar_linha(1030, 130, 1460, 130)
		g.desenhar_linha(1030, 280, 1460, 280)
		g.desenhar_linha(1030, 430, 1460, 430)
		g.desenhar_linha(1030, 580, 1460, 580)
		g.desenhar_linha(1030, 730, 1460, 730)
		g.desenhar_linha(1030, 880, 1460, 880)
		
		g.definir_estilo_texto(verdadeiro, falso, falso)
		g.definir_tamanho_texto(26.0)
		g.desenhar_texto(1020 + ((460 - g.largura_texto(tp.inteiro_para_cadeia(total_poltronas, 10) + "   Poltronas")) / 2), 145, tp.inteiro_para_cadeia(total_poltronas, 10) + "  Poltronas")
		g.desenhar_texto(1020 + ((460 - g.largura_texto(tp.real_para_cadeia(porcentagem_disponiveis) + "% do total de Poltronas")) / 2), 185, tp.real_para_cadeia(porcentagem_disponiveis) + "% do total de Poltronas")
		
		g.desenhar_texto(1020 + ((460 - g.largura_texto(tp.inteiro_para_cadeia(quantidade_passageiros, 10) + "   Poltronas")) / 2), 295, tp.inteiro_para_cadeia(quantidade_passageiros, 10) + "  Poltronas")
		g.desenhar_texto(1020 + ((460 - g.largura_texto(tp.real_para_cadeia(porcentagem_reservados) + "% do total de Poltronas")) / 2), 335, tp.real_para_cadeia(porcentagem_reservados) + "% do total de Poltronas")

		g.desenhar_texto(1020 + ((460 - g.largura_texto(tp.inteiro_para_cadeia(criancas, 10) + "   Reservas")) / 2), 445, tp.inteiro_para_cadeia(criancas, 10) + "  Reservas")
		g.desenhar_texto(1020 + ((460 - g.largura_texto(tp.real_para_cadeia(mat.arredondar((100 / tp.inteiro_para_real(total_poltronas)) * criancas, 2)) + "% do total de Poltronas")) / 2), 485, tp.real_para_cadeia(mat.arredondar((100 / tp.inteiro_para_real(total_poltronas)) * criancas, 2)) + "% do total de Poltronas")
		
		g.desenhar_texto(1020 + ((460 - g.largura_texto(tp.inteiro_para_cadeia(adolescentes, 10) + "   Reservas")) / 2), 595, tp.inteiro_para_cadeia(adolescentes, 10) + "  Reservas")
		g.desenhar_texto(1020 + ((460 - g.largura_texto(tp.real_para_cadeia(mat.arredondar((100 / tp.inteiro_para_real(total_poltronas)) * adolescentes, 2)) + "% do total de Poltronas")) / 2), 635, tp.real_para_cadeia(mat.arredondar((100 / tp.inteiro_para_real(total_poltronas)) * adolescentes, 2)) + "% do total de Poltronas")
		
		g.desenhar_texto(1020 + ((460 - g.largura_texto(tp.inteiro_para_cadeia(adultos, 10) + "   Reservas")) / 2), 745, tp.inteiro_para_cadeia(adultos, 10) + "  Reservas")
		g.desenhar_texto(1020 + ((460 - g.largura_texto(tp.real_para_cadeia(mat.arredondar((100 / tp.inteiro_para_real(total_poltronas)) * adultos, 2)) + "% do total de Poltronas")) / 2), 785, tp.real_para_cadeia(mat.arredondar((100 / tp.inteiro_para_real(total_poltronas)) * adultos, 2)) + "% do total de Poltronas")

		g.desenhar_texto(1020 + ((460 - g.largura_texto(tp.inteiro_para_cadeia(idosos, 10) + "   Reservas")) / 2), 895, tp.inteiro_para_cadeia(idosos, 10) + "  Reservas")
		g.desenhar_texto(1020 + ((460 - g.largura_texto(tp.real_para_cadeia(mat.arredondar((100 / tp.inteiro_para_real(total_poltronas)) * idosos, 2)) + "% do total de Poltronas")) / 2), 935, tp.real_para_cadeia(mat.arredondar((100 / tp.inteiro_para_real(total_poltronas)) * idosos, 2)) + "% do total de Poltronas")
		
		se(atualizar == verdadeiro)
		{
			para(inteiro i = 0; i < linhas; i++)
			{
				para(inteiro n = 0; n < colunas; n++)
				{
					se(poltronas_disponiveis[i][n] == 0)
					{
						se(idade_passageiro[i][n] > 0)
						{
							se(idade_passageiro[i][n] >= 0 e idade_passageiro[i][n] <= 12)
							{
								criancas++
							} 
							senao se(idade_passageiro[i][n] > 12 e idade_passageiro[i][n] <= 17)
							{
								adolescentes++
							}
							senao se(idade_passageiro[i][n] > 18 e idade_passageiro[i][n] <= 59)
							{
								adultos++
							}
							senao se(idade_passageiro[i][n] > 60 )
							{
								idosos++
							}
						}
					}
					
				}
			}
			
			atualizar = falso
		}
		

		//quadro legenda
		g.definir_gradiente(g.GRADIENTE_ABAIXO, 0xdfdfdf , g.COR_BRANCO)
		g.desenhar_retangulo(20, 300, 450, 600, verdadeiro, verdadeiro)
		
		//quadro legenda
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(20, 300, 450, 600, verdadeiro, falso)
		
		//cores legenda
		g.definir_cor(g.COR_BRANCO)
		g.desenhar_retangulo(40, 400, 50, 50, verdadeiro, verdadeiro)
		g.definir_cor(0xF300D5)
		g.desenhar_retangulo(40, 500, 50, 50, verdadeiro, verdadeiro)
		g.definir_cor(0xFFBF00)
		g.desenhar_retangulo(40, 600, 50, 50, verdadeiro, verdadeiro)
		g.definir_cor(0x0D5EF2)
		g.desenhar_retangulo(40, 700, 50, 50, verdadeiro, verdadeiro)
		g.definir_cor(0x580C88)
		g.desenhar_retangulo(40, 800, 50, 50, verdadeiro, verdadeiro)
		
		//borda cores legenda	
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(40, 400, 50, 50, verdadeiro, falso)
		g.desenhar_retangulo(40, 500, 50, 50, verdadeiro, falso)
		g.desenhar_retangulo(40, 600, 50, 50, verdadeiro, falso)
		g.desenhar_retangulo(40, 700, 50, 50, verdadeiro, falso)
		g.desenhar_retangulo(40, 800, 50, 50, verdadeiro, falso)
		
		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(40.0)
		g.desenhar_texto(20 + ((450 - g.largura_texto("LEGENDAS")) / 2), 310, "LEGENDAS")
		
		g.desenhar_texto(100 , 410, "DISPONÍVEL")
		g.desenhar_texto(100 , 510, "CRIANÇAS")
		g.desenhar_texto(100 , 610, "ADOLESCENTES")
		g.desenhar_texto(100 , 710, "ADULTOS")
		g.desenhar_texto(100 , 810, "IDOSOS")

		//logo sweet flight
		g.definir_cor(g.COR_PRETO)
		g.desenhar_elipse(120, 25, 200, 200, verdadeiro)
		g.definir_cor(g.COR_BRANCO)
		g.desenhar_imagem(120, 25, fundo_logo_poltronas)
		g.desenhar_porcao_imagem(0, 85, 0, 85, 450, 80, poltronas_aviao)
		g.desenhar_imagem(180, 85, icone_aviao)
		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(40.0)
		g.desenhar_texto(0, 105, " SWEET")
		g.desenhar_texto(286, 105, "FLIGHT")

		desenhar_poltronas()

		se(t.alguma_tecla_pressionada())
		{
			temp_tecla = t.ler_tecla()

			se(temp_tecla == t.TECLA_ESC)
			{
				verificar_idade = falso
				atualizar = verdadeiro
				criancas = 0
				adolescentes = 0
				adultos = 0
				idosos = 0
				opcao = 0
			}
		}
	}

	funcao desenhar_poltronas()
	{
		para(inteiro i = 0; i < maximo_linhas; i++)
		{
			para(inteiro n = 0; n < maximo_colunas; n++)
			{
				
				se(i >= linhas ou n >= colunas)
				{
					g.definir_cor(0xFF1E00)
					se(n < 3)
					{	
						g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 40) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, verdadeiro)
						g.definir_cor(g.COR_PRETO)
						g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 40) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, falso)
					}
					se(n < 7 e n >= 3)
					{
						
						g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 85) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, verdadeiro)
						g.definir_cor(g.COR_PRETO)
						g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 85) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, falso)
					}
					se(n >= 7)
					{
						
						g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 130) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, verdadeiro)
						g.definir_cor(g.COR_PRETO)
						g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 130) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, falso)
					}
					
				}
				se(poltronas_disponiveis[i][n] == 0)
				{

					se(verificar_idade == verdadeiro)
					{
						se(idade_passageiro[i][n] >= 0 e idade_passageiro[i][n] <= 12)
						{
							g.definir_cor(0xF300D5)
						} 
						senao se(idade_passageiro[i][n] > 12 e idade_passageiro[i][n] <= 17)
						{
							g.definir_cor(0xFFBF00)
						}
						senao se(idade_passageiro[i][n] > 18 e idade_passageiro[i][n] <= 59)
						{
							g.definir_cor(0x0D5EF2)
						}
						senao se(idade_passageiro[i][n] > 60 )
						{
							g.definir_cor(0x580C88)
						}

						se(n < 3)
						{
							g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 40) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, verdadeiro)
								
						}
						se(n < 7 e n >= 3)
						{
							g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 85) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, verdadeiro)
							 
						}
						se(n >= 7)
						{
							g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 130) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, verdadeiro)
							
						}
					}
					senao
					{
						g.definir_cor(0x00ED00)
						se(n < 3)
						{
							g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 40) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, verdadeiro)
								
						}
						se(n < 7 e n >= 3)
						{
							g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 85) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, verdadeiro)
							
						}
						se(n >= 7)
						{
							g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 130) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, verdadeiro)
							
						}
					}	
				}
				//teste aqui
				se(poltronas_selecionada[i][n] == -2 e poltronas_disponiveis[i][n] == 0)
				{
					g.definir_cor(0xFFBA2F)
					se((u.tempo_decorrido()/1000) % 2 == 0)
					{
						se(n < 3)
						{
							g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 40) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, verdadeiro)
								
						}
						se(n < 7 e n >= 3)
						{
							g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 85) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, verdadeiro)
							
						}
						se(n >= 7)
						{
							g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 130) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, verdadeiro)
							
						}
					}
					senao
					{
						g.definir_cor(0x00ED00)
						se(n < 3)
						{
							g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 40) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, verdadeiro)
								
						}
						se(n < 7 e n >= 3)
						{
							g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 85) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, verdadeiro)
							
						}
						se(n >= 7)
						{
							g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 130) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, verdadeiro)
							
						}
					}
				}
				
			}
		}

		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(14.0)
		
		para(inteiro i = 0; i < maximo_linhas; i++)
		{
			se( i < 9)
			{
				g.desenhar_texto(((g.largura_janela()-500)/ 2) + 5, 50 + (10 * i) + (altura_poltrona + altura_poltrona * i) + ((altura_poltrona - g.altura_texto(tp.inteiro_para_cadeia(i, 10))) / 2), "0"+ tp.inteiro_para_cadeia(i+1, 10))
			}
			senao
			{
				g.desenhar_texto(((g.largura_janela()-500)/ 2) + 5, 50 + (10 * i) + (altura_poltrona + altura_poltrona * i) + ((altura_poltrona - g.altura_texto(tp.inteiro_para_cadeia(i, 10))) / 2), tp.inteiro_para_cadeia(i+1, 10))
			}
			
			para(inteiro n = 0; n < maximo_colunas; n++)
			{
				
				se(n < 3)
				{
					
					g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 40) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, falso)	
					g.desenhar_texto((((g.largura_janela()-500)/ 2) + 40) + (10 * n) + ( largura_poltrona * n) + ((largura_poltrona - g.largura_texto(tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))) / 2), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i) + ((altura_poltrona - g.altura_texto(tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))) / 2), tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))
					
				}
				se(n < 7 e n >= 3)
				{
					g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 85) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, falso)
					g.desenhar_texto((((g.largura_janela()-500)/ 2) + 85) + (10 * n) + ( largura_poltrona * n) + ((largura_poltrona - g.largura_texto(tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))) / 2), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i) + ((altura_poltrona - g.altura_texto(tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))) / 2), tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))
				}
				se(n >= 7)
				{
					g.desenhar_retangulo((((g.largura_janela()-500)/ 2) + 130) + (10 * n) + ( largura_poltrona * n), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i), largura_poltrona, altura_poltrona, verdadeiro, falso)
					g.desenhar_texto((((g.largura_janela()-500)/ 2) + 130) + (10 * n) + ( largura_poltrona * n) + ((largura_poltrona - g.largura_texto(tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))) / 2), 50 + (10 * i) + (altura_poltrona + altura_poltrona * i) + ((altura_poltrona - g.altura_texto(tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))) / 2), tp.caracter_para_cadeia(t.caracter_tecla(65 + n)))
				}
			}
		}
	}

	funcao tela_final()
	{
	
		se(transparencia <= 255)
		{

			g.definir_opacidade(0 + transparencia)
			g.definir_cor(g.COR_BRANCO)
			g.desenhar_elipse(500, 250, 500, 500, verdadeiro)
			g.definir_cor(g.COR_PRETO)
			g.desenhar_elipse(525, 275, 450, 450, verdadeiro)
			g.desenhar_retangulo(0, 400, 1200, 200, verdadeiro, verdadeiro)
			g.desenhar_imagem(650, 400, icone_aviao_grande)
			g.definir_cor(g.COR_BRANCO)
			g.definir_estilo_texto(falso, verdadeiro, falso)
			g.definir_tamanho_texto(100.0)
			g.desenhar_texto(190, 450, " SWEET")
			g.desenhar_texto(920, 450, "FLIGHT")

			
			g.definir_tamanho_texto(25.0)
			g.definir_estilo_texto(verdadeiro, verdadeiro, falso)
			g.desenhar_texto(750 - (g.largura_texto("AGRADECEMOS A PREFERENCIA") / 2), 930, "AGRADECEMOS A PREFERENCIA")
			g.desenhar_texto(750 - (g.largura_texto("VOLTE SEMPRE") / 2), 960, "VOLTE SEMPRE")
			
			g.definir_opacidade(255 - transparencia)
			g.desenhar_imagem(0, 0, fundo_menu)
			u.aguarde(5)
			transparencia++
			
		}
		se(transparencia == 255)
		{
			u.aguarde(5000)
			sair = verdadeiro
		}

	}

	funcao horario()
	{
		
		se(c.hora_atual(falso) < 10)
		{
			hora = "0" + tp.inteiro_para_cadeia(c.hora_atual(falso), 10)
		}
		senao
		{
			hora = tp.inteiro_para_cadeia(c.hora_atual(falso), 10)	
		}
		se(c.minuto_atual() < 10)
		{
			minuto = "0" + tp.inteiro_para_cadeia(c.minuto_atual(), 10)
		}
		senao
		{
			minuto = tp.inteiro_para_cadeia(c.minuto_atual(), 10)
		}
		se(c.segundo_atual() < 10)
		{
			segundo =  "0" + tp.inteiro_para_cadeia(c.segundo_atual(), 10)
		}
		senao
		{
			segundo = tp.inteiro_para_cadeia(c.segundo_atual(), 10)
		}
		
		hora_atual = hora + ":" + minuto + ":" + segundo

		g.definir_cor(g.COR_PRETO)
		g.definir_opacidade(255)
		g.definir_fonte_texto("alarm clock")
		g.definir_estilo_texto(falso, falso, falso)
		g.definir_tamanho_texto(50.0)
		
		g.desenhar_texto(1490 - g.largura_texto(hora_atual), 10 , hora_atual)

	}

	funcao inicializar()
	{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(largura_tela, altura_tela)
		g.definir_titulo_janela("COMPANHIA AÉREA SWEET FLIGHT -- RESERVAS DE PASSAGENS")
		
		carregar_imagens()
		carregar_fontes()
		
	}

	funcao carregar_imagens()
	{
		//A variavel temp_img vai receber temporariamente o valor do espaço de memória para carregar as imagens
		inteiro temp_img = 0

		temp_img = g.carregar_imagem("./imagens/fundo_menu.jpg")
		fundo_menu = g.redimensionar_imagem(temp_img, 1500, 1000, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("./imagens/icone_aviao.png")
		icone_aviao = g.redimensionar_imagem(temp_img, 80, 80, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("./imagens/icone_aviao_grande.png")
		icone_aviao_grande = g.redimensionar_imagem(temp_img, 200, 200, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("./imagens/fundo_logo.png")
		fundo_logo = g.redimensionar_imagem(temp_img, 200, 200, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("./imagens/poltronas_aviao.jpg")
		poltronas_aviao = g.redimensionar_imagem(temp_img, 1500, 1000, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("./imagens/fundo_logo_poltronas.png")
		fundo_logo_poltronas = g.redimensionar_imagem(temp_img, 200, 200, verdadeiro)
		g.liberar_imagem(temp_img)
	}

	funcao carregar_fontes()
	{
		g.carregar_fonte("./fontes/alarm_clock.ttf")
	}

	funcao carregar_sons()
	{
		
		som_aviao = s.carregar_som("./sons/som_aviao.mp3")
		
	}

	funcao inicializar_matriz_poltronas()
	{
		para(inteiro i = 0; i < maximo_linhas; i++)
		{
			para(inteiro n = 0; n < maximo_colunas; n++)
			{
				poltronas_disponiveis[i][n] = -1
				poltronas_selecionada[i][n] = -1
			
			}
		}
	}

	funcao desenhar_imput()
	{
		inteiro tecla_pressionada = 0

	
			se(t.alguma_tecla_pressionada())
			{
				tecla_pressionada = t.ler_tecla()
				
				se ((tecla_pressionada >= t.TECLA_A e tecla_pressionada <= t.TECLA_Z) ou tecla_pressionada == t.TECLA_ESPACO ou tecla_pressionada == t.TECLA_BACKSPACE)
				{
					se (tecla_pressionada == t.TECLA_BACKSPACE)
					{
						tamanho = txt.numero_caracteres(nome_digitado)
						
						se (tamanho >= 1)
						{			
							nome_digitado = txt.extrair_subtexto(nome_digitado, 0, tamanho - 1)
						}
					}
					senao
					{
						tamanho = txt.numero_caracteres(nome_digitado)
						
						se(tamanho < 29)
						{
							nome_digitado += t.caracter_tecla(tecla_pressionada)
						}
						
					}	
				}
			}
			se(digitando == verdadeiro)
			{
				g.definir_cor(g.COR_PRETO)
				g.definir_estilo_texto(falso, falso, falso)
				g.definir_tamanho_texto(20.0)
				g.desenhar_texto(1245 - (g.largura_texto(nome_digitado) / 2), 290, nome_digitado)
				
				se((u.tempo_decorrido()/500) % 2 == 0)
				{
					g.definir_estilo_texto(falso, falso, falso)
					g.desenhar_texto(1245 + (g.largura_texto(nome_digitado) / 2), 290, "|")
					
				}
			}
			
			se(tecla_pressionada == t.TECLA_ENTER)
			{
				digitando = falso
				digitado = verdadeiro
			}
	
	}

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 785; 
 * @DOBRAMENTO-CODIGO = [146, 178, 329, 719, 1160, 1786, 1690, 1865, 1904, 1944, 1955, 1985, 1990, 1997, 2010];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {quantidade_passageiros, 63, 9, 22};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */