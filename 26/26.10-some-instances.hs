import           Control.Monad.IO.Class
import           Control.Monad.Trans.Class

-----------------------------------------------------------------------------
-- 1.
newtype MaybeT m a = MaybeT
  { runMaybeT :: m (Maybe a) }

instance Functor m => Functor (MaybeT m) where
  fmap f (MaybeT x) = MaybeT $ (fmap . fmap) f x

instance Applicative m => Applicative (MaybeT m) where
  pure x = MaybeT (pure (pure x))
  MaybeT f <*> MaybeT x = MaybeT $ (<*>) <$> f <*> x

instance Monad m => Monad (MaybeT m) where
  return = pure
  MaybeT m >>= f = MaybeT $ do
    v <- m
    case v of
      Nothing -> return Nothing
      Just x  -> runMaybeT (f x)

instance MonadTrans MaybeT where
  lift = MaybeT . fmap Just

instance (MonadIO m) => MonadIO (MaybeT m) where
  liftIO = lift . liftIO
