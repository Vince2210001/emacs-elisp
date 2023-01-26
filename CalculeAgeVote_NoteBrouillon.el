;;;; COMMENTAIRES AU SOMMET DES PAGES
;;;;'/*******************************************************************************************
;;;;'********************************************************************************************
;;;;'**                                                                                        **
;;;;'** TITRE : E14_TP2_2210001 - PRÉSENTATION ELISP - NOTES ET BROUILLON                      **
;;;;'** DESCRIPTION : DÉBROUSSAILLAGE POUR RÉALISER UN                                         **
;;;;'**               PROGRAMME QUI ÉVALUE LA POSSIBILITÉ DE VOTER EN FONCTION DE L'ÂGE        **
;;;;'**               ET QUI CALCULE L'ÂGE DE L'UTILISATEURICE.                                **
;;;;'**              ( CODÉ EN ELISP AVEC L'ÉDITEUR EMACS)                                     **
;;;;'** FAIT PAR : VINCENT CÔTÉ ;~J                                                            **
;;;;'**       LE : 26 JANVIER 2023                                                             **
;;;;'** RÉVISÉ PAR :                                                                           **
;;;;'**         LE :                                                                           **
;;;;'**                                                                                        **
;;;;'********************************************************************************************        
;;;;'*******************************************************************************************/

;;; Commmentaires au début d'une ligne

(defun test (a &optional b)
  ;; Commentaires indentés dans le code
  (do-something a)                        ; Commentaires indentés à la colone 40 ou à la dernière
  (do-something-else b))                  ; colonne +1 espace si la ligne dépasse la 38e colonne.




;;;BASES


;;;Hello World!
(print "Hello World!")
(concat "Hello " "World!")

  ;;Opérations mathématiques
(+ 2 2)

(* (+ 2 3) (- 5 3))

(/ 5 4)

(/ 5 4.0)

;;;PROGRAMME PROGRAMME PROGRAMME PROGRAMME
;;;PROGRAMME PROGRAMME PROGRAMME PROGRAMME
;;;PROGRAMME PROGRAMME PROGRAMME PROGRAMME





;;;Définition de constantes
(defconst age-pour-voter 18 "Âge minumum pour voter au Canada") ; Une constante peut être modifiée dans Emacs,
					                        ; mais pas un mot-clé (ex : nil = faux t=true)
;;;Définition de variables globales
(defvar age-personne 0)                 ; Les * * ne sont pas obligatoires,
					; mais ils aident à identifier les variables globales
(list age-personne age-pour-voter)
(defvar date-naissance)
(defvar aujourdhui-secs (current-time))
(defvar date-naissance-secs)
(defvar age-secs)
(defvar age-jours)




;;;Question à l'utilisateurice
(print "Quel est votre age?")

;;;Changement de valeur de la variable globale
(setq age-personne 16)            ; Les * * ne sont pas obligatoires,
					; mais ils aident à identifier les variables globales

;;;Définition de function
(defun verif-droit-vote-age (age-personne age-pour-voter)
  (interactive
   (let(age-personne)
     (setq age-personne (read-number "Entrez votre age : "))
        (if (< age-personne 18)
 	    (message "Vous n'avez pas l'age minimum pour voter : %s ans < 18  ans." age-personne)
            (message "Vous pouvez voter : %s ans > 18 ans." age-personne)
        )
	)				; Mode Interactif
   )
  )


;;;TEST
;;;TEST1

(defun verif-droit-vote-age-1 (age-personne age-pour-voter)
  (interactive
   (let(age-personne)
     (setq age-personne (read-number "Entrez votre age : "))
        (if (< age-personne age-pour-voter)
 	    (message "Vous n'avez pas l'age minimum pour voter : %s ans < %s ans." age-personne age-pour-voter)
            (message "Vous pouvez voter : %s ans > %s ans." age-personne age-pour-voter)
        )
	)				; Mode Interactif
)
)

;;;TEST1
;;;TEST2 BON TEST EN COURS


(defun verif-droit-vote-age (age-personne)
  (interactive
   (let(age-personne)
     (unless (>= (string-to-number (substring (current-time-string) -13 -11)) 22)
     (setq age-personne (read-number "Entrez votre age : "))
     (if (< age-personne 18)
	 (message "Vous n'avez pas l'age minimum pour voter : %s ans < 18  ans." age-personne)
       (if (= age-personne 18)
	   (message "Vous pouvez voter : %s ans = 18 ans." age-personne)
         (message "Vous pouvez voter : %s ans > 18 ans." age-personne)
	 )
	 )
     )
     )                                  ; Mode Interactif
     )
     )




(if (= (string-to-number "1") 1)
    (print "1=1")
    (print "1=/=1")
    )

(string-to-number "256")

  (substring "abcdefg" -3 -1)
  (string ?a ?b ?c)

(string current-time-string)
(substring (current-time-string) -13 -11)

(current-time-string)

(concat
 (format-time-string "%Y-%m-%dT%T")
 ((lambda (x) (concat (substring x 0 3) ":" (substring x 3 5)))
  (format-time-string "%z")))


(format-time-string "%Y-%m-%dT%T")

(format-time-string "%Y-%m-%d")

;;;TEST2
;;;TEST3

(defun verif-droit-vote-naiss (date-naissance)
  (interactive
   ;(let(date-naissance))
      (setq date-naissance (read-string "Entrez votre date de naissance AAAA-MM-JJ : "))

      (setq date-naissance-secs (time-to-seconds(date-to-time date-naissance)))
      (setq age-secs (-(time-to-seconds aujourdhui-secs) date-naissance-secs))
      (setq age-jours (/ age-secs (time-to-seconds(days-to-time 1))))
      (setq age-personne (/ age-jours 365.25))
            
        (if (< (floor age-personne) age-pour-voter)
 	  (print "Vous n'avez pas l'age minimum pour voter")
          (print "Vous pouvez voter")
      )                                         ;interactif
    )
  )



(setf birth-date "1980-12-29")
(defun calculate-age (birth-date)
  (let* ((now (current-time))
         (then (time-to-seconds (date-to-time birth-date)))
         (diff (- (time-to-seconds now) then))
         (days (/ diff (time-to-seconds (days-to-time 1))))
         (years (/ days 365.25)))
    (floor years))
  (print birth-date))

;;;TEST3
;;;TEST4

(list )

(defun voter ()
  (make-list 3 'vote))

(defun verif-droit-vote ()
  (interactive
   (let(age-personne)
     (unless (>= (string-to-number (substring (current-time-string) -13 -11)) 22)
     (setq age-personne (read-number "Entrez votre age : "))
     (if (< age-personne 18)
	 (message "Vous n'avez pas l'age minimum pour voter : %s ans < 18  ans." age-personne)
         (funcall (voter))
       ;(if (= age-personne 18)
       ;	   (message "Vous pouvez voter : %s ans = 18 ans." age-personne)
       ;  (message "Vous pouvez voter : %s ans > 18 ans." age-personne)
	 )
	 )
     )
     )                                  ; Mode Interactif
     )
     )


(funcall (verif-droit-vote))

;;;TEST4
;;;TEST5

(defun verif-droit-vote-naiss (date-naissance)
  (interactive
   ;(let(date-naissance))
      (setq date-naissance (read-string "Entrez votre date de naissance AAAA-MM-JJ : "))

      (setq date-naissance-secs (time-to-seconds(date-to-time date-naissance)))
      (setq age-secs (-(time-to-seconds aujourdhui-secs) date-naissance-secs))
      (setq age-jours (/ age-secs (time-to-seconds(days-to-time 1))))
      (setq age-personne (/ age-jours 365.25))
            
        (if (< (floor age-personne) age-pour-voter)
 	  (print "Vous n'avez pas l'age minimum pour voter")
          (print "Vous pouvez voter")
      )                                         ;interactif
    )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun voter ()
  (make-list 3 'vote))

(defun verif-droit-vote ()
  (interactive
   (let(age-personne)
     (unless (>= (string-to-number (substring (current-time-string) -13 -11)) 22)
     (setq age-personne (read-number "Entrez votre age : "))
     (if (< age-personne 18)
	 (message "Vous n'avez pas l'age minimum pour voter : %s ans < 18  ans." age-personne)
         (funcall (voter))
       ;(if (= age-personne 18)
       ;	   (message "Vous pouvez voter : %s ans = 18 ans." age-personne)
       ;  (message "Vous pouvez voter : %s ans > 18 ans." age-personne)
	 )
	 )
     )
     )                                  ; Mode Interactif
     )
     )


(funcall (verif-droit-vote))

;;;TEST5
;;;TEST6

(defun verif-droit-vote-age (date-naissance)
  (interactive
   ;;DÉFINITION DE VARIABLES LOCALES
   (let(aaaa-naiss mm-naiss jj-naiss)
     (unless (>= (string-to-number (substring (current-time-string) -13 -11)) 23) ; SI HEURE FIN VOTE = OU DÉPASSÉE RETOURNE NIL.
       ;;MODIFICATION DE VALEUR D'UNE VARIABLE
       (setq aaaa-naiss (read-string "Entrez votre année de naissance AAAA : ")) ; QUESTION À L'UTILISATEUR
       (if (> (- (format-time-string "%Y") aaaa-naiss)  18) ; SI + DE 18 ANS PEUT VOTER
	                                                    ; SI NON TROP JEUNE POUR VOTER #1
	   ;;APPEL DE FONCTION
	   (funcall (voter))
	 (if (= (- (format-time-string "%Y") aaaa-naiss)  18) ; SI ÉGALE À 18 ANS DOIT VÉRIFIER LE MOIS.
	      (setq aaaa-naiss (read-string "Entrez votre mois de naissance MM : "))
	   (if (> (- (format-time-string "%m") mm-naiss)  0) ; SI MOIS DE NAISSANCE EST PASSÉ PEUT VOTER
	                                                     ; SI NON TROP JEUNE POUR VOTER.
	       (funcall (voter))
	     
	     (
	      )
	     )
	   )
	 (funcall (msg-trop-jeune)) ; PAS 18 ANS #1
	 )
       )
       )                                  ; Mode Interactif
     )
     )

;;;TEST6
;;;TEST7OK

(defun msg-trop-jeune ()
  (make-list 3 'tropJeune)
  )



(defun verif-droit-vote-age ()
  (interactive
   ;;DÉFINITION DE VARIABLES LOCALES
   (let(date-naiss)
     (unless (>= (string-to-number (substring (current-time-string) -13 -11)) 24) ; SI HEURE FIN VOTE = OU DÉPASSÉE RETOURNE NIL.
       ;;MODIFICATION DE VALEUR D'UNE VARIABLE
       (setq date-naiss (read-string "Entrez votre date de naissance AAAA-MM-JJ : ")) ; QUESTION À L'UTILISATEUR
       (if(or (> (- (string-to-number (format-time-string "%Y")) (string-to-number (substring date-naiss 0 4))) 18)
	      (and (= (- (string-to-number (format-time-string "%Y")) (string-to-number (substring date-naiss 0 4))) 18)
		   (> (- (string-to-number (format-time-string "%m")) (string-to-number (substring date-naiss 5 7))) 0))
	      (and (= (- (string-to-number (format-time-string "%Y")) (string-to-number (substring date-naiss 0 4))) 18)
		   (= (- (string-to-number (format-time-string "%m")) (string-to-number (substring date-naiss 5 7))) 0)
		   (>= (- (string-to-number (format-time-string "%d")) (string-to-number (substring date-naiss 8 10))) 0)))	   
	 (voter)
	 (msg-trop-jeune)
       )
      )
     )                              ; Mode Interactif
   )
  
;;;TEST7OK


