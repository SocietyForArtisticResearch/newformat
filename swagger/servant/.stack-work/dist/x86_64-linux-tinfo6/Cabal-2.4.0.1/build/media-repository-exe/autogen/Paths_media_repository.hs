{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_media_repository (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/luc/Work/rc/newformat/swagger/servant2/.stack-work/install/x86_64-linux-tinfo6/445ae65d37e9383787ec6b9f6a18d670f9ca3d61353a4fe035cf33f1766fd10b/8.6.5/bin"
libdir     = "/home/luc/Work/rc/newformat/swagger/servant2/.stack-work/install/x86_64-linux-tinfo6/445ae65d37e9383787ec6b9f6a18d670f9ca3d61353a4fe035cf33f1766fd10b/8.6.5/lib/x86_64-linux-ghc-8.6.5/media-repository-0.1.0.0-H4a9cF821zTHUwf3gIjfEa-media-repository-exe"
dynlibdir  = "/home/luc/Work/rc/newformat/swagger/servant2/.stack-work/install/x86_64-linux-tinfo6/445ae65d37e9383787ec6b9f6a18d670f9ca3d61353a4fe035cf33f1766fd10b/8.6.5/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/home/luc/Work/rc/newformat/swagger/servant2/.stack-work/install/x86_64-linux-tinfo6/445ae65d37e9383787ec6b9f6a18d670f9ca3d61353a4fe035cf33f1766fd10b/8.6.5/share/x86_64-linux-ghc-8.6.5/media-repository-0.1.0.0"
libexecdir = "/home/luc/Work/rc/newformat/swagger/servant2/.stack-work/install/x86_64-linux-tinfo6/445ae65d37e9383787ec6b9f6a18d670f9ca3d61353a4fe035cf33f1766fd10b/8.6.5/libexec/x86_64-linux-ghc-8.6.5/media-repository-0.1.0.0"
sysconfdir = "/home/luc/Work/rc/newformat/swagger/servant2/.stack-work/install/x86_64-linux-tinfo6/445ae65d37e9383787ec6b9f6a18d670f9ca3d61353a4fe035cf33f1766fd10b/8.6.5/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "media_repository_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "media_repository_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "media_repository_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "media_repository_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "media_repository_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "media_repository_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
