;;;; COMMENTAIRES AU SOMMET DES PAGES
;;;;'/*******************************************************************************************
;;;;'********************************************************************************************
;;;;'**                                                                                        **
;;;;'** TITRE : E14_TP2_2210001 - PRÉSENTATION ELISP - AVANT MACHINE POUR VOTER                **
;;;;'** DESCRIPTION : PROGRAMME QUI ÉVALUE LA POSSIBILITÉ DE VOTER EN FONCTION DE L'ÂGE        **
;;;;'**               ET QUI CALCULE L'ÂGE DE L'UTILISATEURICE.                                **
;;;;'**              ( CODÉ EN ELISP AVEC L'ÉDITEUR EMACS)                                     **
;;;;'** FAIT PAR : VINCENT CÔTÉ ;~J                                                            **
;;;;'**       LE : 26 JANVIER 2023                                                             **
;;;;'** RÉVISÉ PAR :                                                                           **
;;;;'**         LE :                                                                           **
;;;;'**                                                                                        **
;;;;'********************************************************************************************        
;;;;'*******************************************************************************************/


;;; COMMENTAIRES AU DÉBUT D'UNE LIGNE
;;; VARIABLES

;;; COMMENTAIRES INDENTÉS DANS LE CODE
;;; DÉFINITION DE CONSTANTES
(defconst age-pour-voter 18 "Âge minumum pour voter au Canada")
  ;; COMMENTAIRES INDENTÉS DANS LE CODE
  ;; UNE CONSTANTE PEUT ÊTRE MODIFIÉE DANS EMACS,
  ;; MAIS PAS UN MOT-CLÉ (EX : nil=FAUX t=TRUE)


;;;DÉFINITION DE VARIABLES GLOBALES
(defvar *date-naiss* )                  ; COMMENTAIRES INDENTÉS À LA COLONNE 40 OU À LA DERNIÈRE
                                        ; COLONNE +1 ESPACE SI LA LIGNE DÉPASSE LA 38E COLONNE.
					; LES * * NE SONT PAS OBLIGATOIRES,
					; MAIS ILS AIDENT À IDENTIFIER LES VARIABLES GLOBALES.

;;;DÉFINITION DE FONCTION
(defun voter ()
  ;; CRÉATION DE LISTES
                                        ; (make-list 3 voter))
(concat "Vous pouvez voter! Vous avez "
	  (number-to-string (- (string-to-number (format-time-string "%Y"))
				     (string-to-number (substring *date-naiss* 0 4))))
	  " ans.")
  )


(defun msg-trop-jeune ()
  (concat "Vous pourrez voter dans "
	  (number-to-string
	   (- 18 (- (string-to-number (format-time-string "%Y"))
				      (string-to-number (substring *date-naiss* 0 4)))))
	  " an(s).")
  )



(defun verif-droit-vote-age ()
  (interactive
   ;;DÉFINITION DE VARIABLES LOCALES
   ;(let(date-naiss)
     (unless (>= (string-to-number (substring (current-time-string) -13 -11)) 24) ; SI HEURE FIN VOTE = OU DÉPASSÉE RETOURNE NIL.
       ;;MODIFICATION DE VALEUR D'UNE VARIABLE
       (setq *date-naiss* (read-string "Entrez votre date de naissance AAAA-MM-JJ : ")) ; QUESTION À L'UTILISATEUR
       (if(or (> (- (string-to-number (format-time-string "%Y")) (string-to-number (substring *date-naiss* 0 4))) 18)
	      (and (= (- (string-to-number (format-time-string "%Y")) (string-to-number (substring *date-naiss* 0 4))) 18)
		   (> (- (string-to-number (format-time-string "%m")) (string-to-number (substring *date-naiss* 5 7))) 0))
	      (and (= (- (string-to-number (format-time-string "%Y")) (string-to-number (substring *date-naiss* 0 4))) 18)
		   (= (- (string-to-number (format-time-string "%m")) (string-to-number (substring *date-naiss* 5 7))) 0)
		   (>= (- (string-to-number (format-time-string "%d")) (string-to-number (substring *date-naiss* 8 10))) 0)))	   
	 (voter)
      (msg-trop-jeune)
	 )

       ;; Mode Interactif
       )                            ; *PLACEZ LE CURSEUR APRÈS LA PARENTHÈSE ")"
                                        ; POUR LANCER LE PROGRAMME EN FAISANT CTRL+X & CTRL+E 
     
     )
   )
