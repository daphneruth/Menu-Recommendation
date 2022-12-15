

/* start */
go :- 
      main,
      !.

greeting :-
      write('\tWelcome to menu recommendation for daphne restaurant.'), nl,
      native_help.


/*  questions */ 
ask(Question) :- 
        write(' > Do you love food with the this attribute: '), 
        write(Question), write('? \n'), 
        write(' > '),
         read(Response), nl, 
         ( (Response == yes ; Response == y) 
         -> assert(yes(Question)) ; 
         assert(no(Question)), fail). 
:- dynamic yes/1,no/1. 

/* verification */ 
verify(S) :- (yes(S) -> true ; (no(S) -> fail ; ask(S))). 

/* undo all yes/no assertions */ 
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail. 
undo.

/* menu */
main :-
    greeting,
    repeat,
    write(' > '),
    read(X),
    do(X),
    X == 4.
  

native_help :-
    write('\n\tPlease Choose What to Do: \n\t[1.] - Recommend\n\t[2.] - Help\n\t[3.] - Quit\n '), nl.
    % write('Type help.| recommend. | quit.'), nl,
    % write('at the prompt.'), nl.


/* start the recommender */
do(1) :-
    write('\n\t[y.] - yes | [n.] - no \n'), nl,
    hypothesize(Food), 
    write('  We guess you would love - '), 
    write(Food), nl.

do(2) :-
    native_help,
    !.

do(3) :-
    write('\n\t\t\tThank you for your time.'),
    halt.

/* not a correct command */
do(X) :-
    write('   '),
    write(X),
    write(' is not a  command.'), nl,
    fail.


    
/* hypotheses to be tested */ 

hypothesize(nasi_lemak) :- nasi_lemak, !. 
hypothesize(fried_rice) :- fried_rice, !. 
hypothesize(dandan_noodle) :- dandan_noodle, !. 
hypothesize(sichuan_noodle) :- sichuan_noodle, !. 
hypothesize(kebab) :- kebab, !. 
hypothesize(biryani) :- biryani, !. 
hypothesize(falafel) :- falafel, !. 
hypothesize(crossoint) :- crossoint, !. 
hypothesize(baguette) :- baguette, !. 
hypothesize(penne) :- penne, !. 
hypothesize(not_in_our_menu).

/* menu food identification rules */ 
nasi_lemak :- asian, rice, 
                verify(has_sambal), 
                verify(contain_coconutmilk). 
fried_rice :- asian, rice, 
            verify(has_varioustype), 
            verify(must_fried). 
dandan_noodle :- noodle, 
               verify(no_soup), 
               verify(china_origin). 
sichuan_noodle :- noodle, 
             verify(china_origin). 
kebab :- eastern,
               verify(use_wrap), 
               verify(contain_meat). 
biryani :- eastern, 
                 verify(contain_meat), 
                 verify(has_rice), 
                 verify(heavy_portion). 
falafel :- eastern, 
                   verify(meatballlike_shape), 
                   verify(has_veggies). 
crossoint :- western, 
                   verify(pastry), 
                   verify(french_origin). 
baguette :- western,
                    verify(bread),
                    verify(french_origin).
penne :- western,
                 verify(taste_spicy),
                 verify(italian_origin).

/* classification rules */ 

asian :- verify(taste_spicy), !. 
asian :- verify(use_rice). 
eastern :- verify(has_meat), !. 
eastern :- verify(use_spice), 
           verify(not_spicy). 
rice :- verify(contain_carbohydrate), !. 
rice :- verify(dry_texture), 
                    verify(heavy_portion), 
                    verify(need_to_be_cooked). 
noodle :- asian, verify(stringlike_shape), !. 
noodle :- asian, verify(heavy_portion). 
western :- verify(sweet_n_savoury). 
western :- verify(contain_sauce). 

   