/*
                escreva("| 1 |- Adicionar livro à Pilha           |\n")
			escreva("+----------------------------------------+\n")
			escreva("| 2 |- Remover último livro da Pilha     |\n")
			escreva("+----------------------------------------+\n")
			escreva("| 3 |- Remover todos os livros da Pilha  |\n")
			escreva("+----------------------------------------+\n")
			escreva("| 4 |- Mostrar livros Empilhados         |\n")
			escreva("+----------------------------------------+\n")
			escreva("| 5 |- Verificar a Pilha está vazia      |\n")
			escreva("+----------------------------------------+\n")
			escreva("| 6 |- Sair do Programa                  |\n")
			escreva("+----------------------------------------+\n")
 */



programa
{
	inclua biblioteca Teclado --> t
	inclua biblioteca Mouse --> m
	inclua biblioteca Texto --> txt
	inclua biblioteca Util --> u
	inclua biblioteca Graficos --> g
	
	const inteiro total = 10

	//Definições de tamanhos para as janelas
	inteiro largura_janela = 400
	inteiro altura_janela = 720
	inteiro borda_esquerda = 100
	inteiro borda_direita = 30

	//Imagens que serão carregadas no algoritmo
	inteiro temp_img 
	inteiro senai_logo = 0
	inteiro tela_celular = 0
	inteiro botao_adicionar = 0
	inteiro remover_ultimo_livro = 0
	inteiro remover_tudo = 0
	inteiro pilha_livros = 0
	inteiro lista_vazia = 0
	inteiro sair_do_programa = 0
	inteiro icone_alerta = 0
	inteiro botao_voltar = 0
	inteiro logo_harry_potter = 0
	inteiro pedra_filosofal = 0
	inteiro prisioneiro_de_azkaban = 0
	inteiro camara_secreta = 0
	inteiro calice_de_fogo = 0
	inteiro enigma_do_principe = 0
	inteiro ordem_da_fenix = 0

	
	//Outras variaveis necessarias
	inteiro ponteiro = 0
	inteiro livros[total]
	inteiro opcao = 0
	real fonte_padrao = 20.0
	cadeia titulo
	cadeia mensagem1, mensagem2
	inteiro digitar = 0
	cadeia texto
	inteiro lista_colecoes = 0
	
	
	funcao inicio()
	{
		definir_tela()

          carregar_imagens()
	
		enquanto(opcao == 0)
		{
	          se(m.botao_pressionado(m.BOTAO_ESQUERDO))
			{	
		          se(m.posicao_x() >= 70 e m.posicao_x() <= (largura_janela - borda_direita) e m.posicao_y() >= 220 e m.posicao_y() <= 260)
				{
					opcao = 1
				}
			}
			 se(m.botao_pressionado(m.BOTAO_ESQUERDO))
			{	
		          se(m.posicao_x() >= 70 e m.posicao_x() <= (largura_janela - borda_direita) e m.posicao_y() >= 280 e m.posicao_y() <= 320)
				{
					opcao = 2
				}
			}
			
			menu()
            	g.renderizar()

			escolha(opcao)
			{
				caso 1:
				{	
					enquanto(opcao == 1)
					{
						
						empilhar()
					     g.renderizar()
					}
				}
				caso 2:
				{	
					enquanto(opcao == 2)
					{
						
						desempilhar()
					     g.renderizar()
					}
				}
				caso 6:
				{
					enquanto(opcao == 6)
					{
						
						colecao_harry_potter()
					     g.renderizar()
					}
				}
				
			}
		}
		
	}
	funcao menu()
	{
		
		carregar_tela_celular()

		topo()
		
		g.definir_tamanho_texto(27.0)
		
		titulo = "  BIBLIOTECA DE LIVROS"

		carregar_titulo()

		g.definir_estilo_texto(falso,verdadeiro, falso)
		g.definir_cor(g.COR_PRETO)
		g.definir_tamanho_texto(fonte_padrao)
		
		//Adicionando os ícones do menu principal
		g.desenhar_imagem(25, 220, botao_adicionar)
		g.desenhar_imagem(25, 280, remover_ultimo_livro)
		g.desenhar_imagem(25, 340, remover_tudo)
		g.desenhar_imagem(25, 400, pilha_livros)
		g.desenhar_imagem(25, 460, lista_vazia)
		g.desenhar_imagem(25, 520, sair_do_programa)

		//colocando contorno cinza em volta da opção quando o mouse passar sobre a area demarcada
		se(m.posicao_x() >= 70 e m.posicao_x() <= (largura_janela - borda_direita) e m.posicao_y() >= 220 e m.posicao_y() <= 260)
		{
			g.definir_cor(0xdfdfdf)
			g.desenhar_retangulo(70, 220, 300, 40, verdadeiro, verdadeiro)		
		}
		senao se(m.posicao_x() >= 70 e m.posicao_x() <= (largura_janela - borda_direita) e m.posicao_y() >= 280 e m.posicao_y() <= 320)
		{
			g.definir_cor(0xdfdfdf)
			g.desenhar_retangulo(70, 280, 300, 40, verdadeiro, verdadeiro)	
		}
		senao se(m.posicao_x() >= 70 e m.posicao_x() <= (largura_janela - borda_direita) e m.posicao_y() >= 340 e m.posicao_y() <= 380)
		{
			g.definir_cor(0xdfdfdf)
			g.desenhar_retangulo(70, 340, 300, 40, verdadeiro, verdadeiro)	
		}
		senao se(m.posicao_x() >= 70 e m.posicao_x() <= (largura_janela - borda_direita) e m.posicao_y() >= 400 e m.posicao_y() <= 440)
		{
			g.definir_cor(0xdfdfdf)
			g.desenhar_retangulo(70, 400, 300, 40, verdadeiro, verdadeiro)	
		}
		senao se(m.posicao_x() >= 70 e m.posicao_x() <= (largura_janela - borda_direita) e m.posicao_y() >= 460 e m.posicao_y() <= 500)
		{
			g.definir_cor(0xdfdfdf)
			g.desenhar_retangulo(70, 460, 300, 40, verdadeiro, verdadeiro)	
		}
		senao se(m.posicao_x() >= 70 e m.posicao_x() <= (largura_janela - borda_direita) e m.posicao_y() >= 520 e m.posicao_y() <= 560)
		{
			g.definir_cor(0xdfdfdf)
			g.desenhar_retangulo(70, 520, 300, 40, verdadeiro, verdadeiro)	
		}

		//Definindo estilo, tamanho e cor da fonte que será colocada na frente dos ícones do menu principal
		g.definir_estilo_texto(falso,verdadeiro, falso)
		g.definir_cor(g.COR_PRETO)
		g.definir_tamanho_texto(fonte_padrao)
		
		//Colocando o texto em frente aos ícones no menu principal
		g.desenhar_texto(75, 530, "Sair do Programa")
		g.desenhar_texto(75, 230, "Adicionar livro à Pilha")
		g.desenhar_texto(75, 290, "Remover último livro")
		g.desenhar_texto(75, 350, "Remover todos os livros")
		g.desenhar_texto(75, 410, "Mostrar livros Empilhados")
		g.desenhar_texto(75, 470, "Verificar se a Pilha está vazia")
		g.desenhar_texto(75, 530, "Sair do Programa")
		
		cabecalho()
		
	}
	funcao empilhar() //Função para fazer o cadastramentos dos elementos que serão empilhados.
	{	
		
		
			carregar_tela_celular()
	
			topo()

			g.definir_tamanho_texto(27.0)
			
			titulo = "   COLEÇÕES DE LIVROS"
	
			carregar_titulo()
	
			g.definir_cor(0xE09553)
			g.desenhar_retangulo(22, 210, 358, 50, verdadeiro, verdadeiro)
			
			g.definir_cor(g.COR_PRETO)
			g.desenhar_retangulo(22, 210, 358, 50, verdadeiro, falso)
			
			g.desenhar_imagem(121, 215, logo_harry_potter)
			
	
			se(m.posicao_x() >= 22 e m.posicao_x() <= 380 e m.posicao_y() >= 210 e m.posicao_y() <= 260)
			{
				g.definir_cor(0xC38248)
				g.desenhar_retangulo(22, 210, 358, 50, verdadeiro, verdadeiro)
			
				g.definir_cor(g.COR_PRETO)
				g.desenhar_retangulo(22, 210, 358, 50, verdadeiro, falso)
			
				g.desenhar_imagem(121, 215, logo_harry_potter)
		 
			}
			se(nao m.botao_pressionado(m.BOTAO_ESQUERDO))
			{
				se(m.posicao_x() >= 22 e m.posicao_x() <= 380 e m.posicao_y() >= 210 e m.posicao_y() <= 260)
				{
					se(m.ler_botao() == m.BOTAO_ESQUERDO)
					{
						opcao = 6
					}
				}
			}
			
	}

	funcao desempilhar()
	{
		
		carregar_tela_celular()

		topo()

		g.definir_tamanho_texto(27.0)
		
		titulo = " REMOVER ÚLTIMO LIVRO"

		carregar_titulo()


		
		se(ponteiro == 0)
		{
			mensagem1 = "Não foi encontrado nenhum"
			mensagem2 = "             livro na Pilha!"
			alerta()
			
		}
			
		
	}

	funcao definir_tela()
	{
		
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(largura_janela, altura_janela)
		g.definir_fonte_texto("Arial")
          g.definir_titulo_janela("BIBLIOTECA SENAI")
          
	}
	
	funcao carregar_imagens()
	{
		
		temp_img = g.carregar_imagem("imagem/tela_celular.png")
		tela_celular = g.redimensionar_imagem(temp_img, largura_janela, altura_janela, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/senai_logo.png")
		senai_logo = g.redimensionar_imagem(temp_img, 155 , 40, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/botao_adicionar.png")
		botao_adicionar = g.redimensionar_imagem(temp_img, 40, 40, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/remover_ultimo_livro.png")
		remover_ultimo_livro = g.redimensionar_imagem(temp_img, 40 , 40, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/remover_tudo.png")
		remover_tudo = g.redimensionar_imagem(temp_img, 40 , 40, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/pilha_livros.png")
		pilha_livros = g.redimensionar_imagem(temp_img, 40 , 40, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/lista_vazia.png")
		lista_vazia = g.redimensionar_imagem(temp_img, 40 , 40, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/sair_do_programa.png")
		sair_do_programa = g.redimensionar_imagem(temp_img, 40 , 40, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/icone_alerta.png")
		icone_alerta = g.redimensionar_imagem(temp_img, 60 , 60, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/botao_voltar.png")
		botao_voltar = g.redimensionar_imagem(temp_img, 50 , 40, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/harry_potter/logo_harry_potter.png")
		logo_harry_potter = g.redimensionar_imagem(temp_img, 160 , 40, verdadeiro)
		g.liberar_imagem(temp_img)
		
		temp_img = g.carregar_imagem("imagem/harry_potter/pedra_filosofal.png")
		pedra_filosofal = g.redimensionar_imagem(temp_img, 100 , 150, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/harry_potter/prisioneiro_de_azkaban.png")
		prisioneiro_de_azkaban = g.redimensionar_imagem(temp_img, 100 , 150, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/harry_potter/camara_secreta.png")
		camara_secreta = g.redimensionar_imagem(temp_img, 100 , 150, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/harry_potter/calice_de_fogo.png")
		calice_de_fogo = g.redimensionar_imagem(temp_img, 100 , 150, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/harry_potter/enigma_do_principe.png")
		enigma_do_principe = g.redimensionar_imagem(temp_img, 100 , 150, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/harry_potter/ordem_da_fenix.png")
		ordem_da_fenix = g.redimensionar_imagem(temp_img, 100 , 150, verdadeiro)
		g.liberar_imagem(temp_img)

	}

	funcao carregar_tela_celular()
	{

		//Colocar desenho da tela de celular
		g.desenhar_imagem(0, 0, tela_celular)

		//Definir tela branca da parte de dentro co celular
		g.definir_cor(g.COR_BRANCO)
		g.desenhar_retangulo(22, 98, (largura_janela - 42), 550, falso, verdadeiro)

		//Definir cor e retangulo azul para colocar a logo do SENAI em cima
		g.definir_cor(0x006BB7)
		g.desenhar_retangulo(22, 98, (largura_janela - 42), 60, falso, verdadeiro)

		
		
	}

	funcao topo()
	{
		
		//Colocar logo do SENAI
		g.desenhar_imagem(122, 108, senai_logo)
		
	}

	funcao cabecalho()
	{
		
		g.definir_cor(0x006BB7)
		g.desenhar_retangulo(22, 598, (largura_janela - 42), 50, falso, verdadeiro)

		g.definir_cor(g.COR_BRANCO)
		g.definir_estilo_texto(verdadeiro,falso, falso)
		g.definir_tamanho_texto(14.0)
		g.desenhar_texto(125, 605, "Criado e Desenvolvido por")
		
		g.definir_estilo_texto(verdadeiro,verdadeiro, falso)
		g.definir_tamanho_texto(16.0)
		g.desenhar_texto(85, 625, "Jonathan Reinaldo Eichenberger")
		
	}

	funcao carregar_titulo()
	{
		//Colocando uma borda preta em volta do titulo
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(22, 158, (largura_janela - 42), 52, falso, falso)
		
		//Preenchendo com cor de fundo cinza atrás do título
		g.definir_cor(0xdfdfdf)
		g.desenhar_retangulo(23, 159, (largura_janela - 44), 50, falso, verdadeiro)
		
		//Defininndo cor e tamanho do titulo- BIBLIOTECA DE LIVROS
		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)

		//Imprimindo na tela o título
		g.desenhar_texto(22, 171, titulo)

		
		
	}

	funcao alerta()
	{
	
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(100, 250, 200, 120, verdadeiro, falso)
		
		g.definir_cor(0xdfdfdf)
		g.desenhar_retangulo(101, 251, 198, 118, verdadeiro, verdadeiro)
		
		g.desenhar_imagem(170, 260, icone_alerta)

		g.definir_cor(g.COR_PRETO)
		
		g.desenhar_imagem(176, 588, botao_voltar)
		g.desenhar_retangulo(166, 578, 70, 60, verdadeiro, falso)

		g.definir_estilo_texto(falso,verdadeiro, falso)
		g.definir_tamanho_texto(22.0)
		
		g.desenhar_texto(150, 335, "ALERTA!!!")
		
		g.definir_tamanho_texto(26.0)
		
		g.desenhar_texto(30, 400, mensagem1)
		g.desenhar_texto(30, 425, mensagem2)

		se(m.posicao_x() >= 166 e m.posicao_x() <= 236 e m.posicao_y() >= 578 e m.posicao_y() <= 638)
		{
			g.definir_cor(0xdfdfdf)
			g.desenhar_retangulo(167, 579, 68, 58, verdadeiro, verdadeiro)
			g.desenhar_imagem(176, 588, botao_voltar)
			
			se(m.botao_pressionado(m.BOTAO_ESQUERDO))
			{
				opcao = 0
			}
		}
	
	}

	funcao colecao_harry_potter()
	{
		carregar_tela_celular()

		g.definir_cor(0xE1BF41)
		g.desenhar_retangulo(22, 210, (largura_janela - 42), 438, falso, verdadeiro)

		topo()

		g.definir_tamanho_texto(26.0)
		
		titulo = " COLEÇÃO HARRY POTTER"

		carregar_titulo()

		cabecalho()

		g.desenhar_imagem(34, 220, pedra_filosofal)
		g.desenhar_imagem(151, 220, prisioneiro_de_azkaban)
		g.desenhar_imagem(268, 220, camara_secreta)
		g.desenhar_imagem(34, 380, calice_de_fogo)
		g.desenhar_imagem(151, 380, enigma_do_principe)
		g.desenhar_imagem(268, 380, ordem_da_fenix)
		
		se(m.posicao_x() >= 34 e m.posicao_x() <= 134 e m.posicao_y() >= 220 e m.posicao_y() <= 370)
		{
			g.desenhar_imagem(31, 217, pedra_filosofal)
		}
		se(m.posicao_x() >= 151 e m.posicao_x() <= 251 e m.posicao_y() >= 220 e m.posicao_y() <= 370)
		{
			g.desenhar_imagem(148, 217, prisioneiro_de_azkaban)
		}
		se(m.posicao_x() >= 268 e m.posicao_x() <= 368 e m.posicao_y() >= 220 e m.posicao_y() <= 370)
		{
			g.desenhar_imagem(265, 217, camara_secreta)
		}
		
		se(m.posicao_x() >= 34 e m.posicao_x() <= 134 e m.posicao_y() >= 380 e m.posicao_y() <= 530)
		{
			g.desenhar_imagem(31, 377, calice_de_fogo)
		}
		se(m.posicao_x() >= 151 e m.posicao_x() <= 251 e m.posicao_y() >= 380 e m.posicao_y() <= 530)
		{
			g.desenhar_imagem(148, 377, enigma_do_principe)
		}
		se(m.posicao_x() >= 268 e m.posicao_x() <= 368 e m.posicao_y() >= 380 e m.posicao_y() <= 530)
		{
			g.desenhar_imagem(265, 377, ordem_da_fenix)
		}

		g.definir_cor(0xA48B30)
		g.desenhar_retangulo(166, 540, 70, 50, verdadeiro, falso)
		g.desenhar_imagem(176, 545, botao_voltar)

		se(m.posicao_x() >= 166 e m.posicao_x() <= 216 e m.posicao_y() >= 540 e m.posicao_y() <= 590)
		{
			g.definir_cor(0xC3A539)
			g.desenhar_retangulo(167, 541, 68, 48, verdadeiro, verdadeiro)
			g.desenhar_imagem(176, 545, botao_voltar)
			
			se(m.botao_pressionado(m.BOTAO_ESQUERDO))
			{
				opcao = 0
			}
		}
	}
	funcao redimensionar()
	{
		temp_img = g.carregar_imagem("imagem/harry_potter/pedra_filosofal.png")
		pedra_filosofal = g.redimensionar_imagem(temp_img, 110 , 160, verdadeiro)
		g.liberar_imagem(temp_img)
	}

}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 14231; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {lista_colecoes, 64, 9, 14};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */