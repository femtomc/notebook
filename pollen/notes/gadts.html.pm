#lang pollen

◊(define-meta template "template.html")

◊title{Generalized algebraic data types}

Key to Haskell's capability of providing the means to construct type-safe embedded domain-specific languages is a concept called ◊em{generalized algebraic data types} (GADTs). I'd like to discuss this briefly -- as understanding this concept turns out to be tremendously useful when experimenting with little languages (for research or otherwise).

In Haskell, users are allowed to specify data types which are parametrized by type parameters:

◊highlight{
data List a = Nil | Cons a (List a)
}

Now, when I construct an inhabitant of this type, the parameters are inferred automatically:

◊highlight{
-- Typed as List Int
my_list = Cons 12 (Cons 107 Nil)
}

A generalized algebraic data type can provide a type instantiation of the data type as the return type of a set of constructors. This gives the programmer explicit control over the type interpretation of inhabitants of the algebraic data type.

◊highlight{
-- Example from: https://en.wikipedia.org/wiki/Generalized_algebraic_data_type

-- A GADT
-- where `a` instantiates over the return type of each constructor.
data Expr a where
    EBool  :: Bool     -> Expr Bool
    EInt   :: Int      -> Expr Int
    EEqual :: Expr Int -> Expr Int  -> Expr Bool

eval :: Expr a -> a

eval e = case e of
    EBool a    -> a
    EInt a     -> a
    EEqual a b -> (eval a) == (eval b)

expr1 = EEqual (EInt 2) (EInt 3)        -- the type of expr1 is Expr Bool
ret = eval expr1                        -- ret is False
}

Imagine trying to encode this example using parametrized algebraic data types:

◊highlight{
Expr a b = EBool a | EInt a | EEqual a b
}

Any instantiation using ◊code{EEqual _ _} will be typed as ◊code{Expr Int Int}. In this example, this restriction prevents the user from controlling typelevel information about any assumed evaluation semantics (here, codified by ◊code{eval}). If we wanted to write ◊code{eval} on the parametrized type, it becomes much messier, even if we allowed multiparameter type classes.

◊highlight{
class Evaluation a b c where
    eval :: Expr a b -> c

instance Evaluation Bool () Bool where
    eval (EBool a) = a

instance Evaluation Int () Int where
    eval (EInt a) = a

instance Evaluation Int Int Bool where
    eval (EEqual a b) = (eval a) == (eval b)
}

Representable, but less terse (which is valued in idiomatic modern Haskell). Outside of small calculator languages, things can quickly become quite messy -- whereas usage of GADTs affords the programmer some level of control over the type interpretation of terms in their language.

An extended tutorial which discusses the same concepts in greater detail is ◊link["https://en.wikibooks.org/wiki/Haskell/GADT"]{available on the Haskell wikibooks}.
