{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_github_get (
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

bindir     = "/Users/suzukimiyuki/Desktop/software_engineering-github_api/.stack-work/install/x86_64-osx/430842418534c0c2e8add34d28a04a7146b4de1d825ea76feb3020076d80ec29/8.8.4/bin"
libdir     = "/Users/suzukimiyuki/Desktop/software_engineering-github_api/.stack-work/install/x86_64-osx/430842418534c0c2e8add34d28a04a7146b4de1d825ea76feb3020076d80ec29/8.8.4/lib/x86_64-osx-ghc-8.8.4/github-get-0.1.0.0-JD5zNHvgm374e0TcdPit6f"
dynlibdir  = "/Users/suzukimiyuki/Desktop/software_engineering-github_api/.stack-work/install/x86_64-osx/430842418534c0c2e8add34d28a04a7146b4de1d825ea76feb3020076d80ec29/8.8.4/lib/x86_64-osx-ghc-8.8.4"
datadir    = "/Users/suzukimiyuki/Desktop/software_engineering-github_api/.stack-work/install/x86_64-osx/430842418534c0c2e8add34d28a04a7146b4de1d825ea76feb3020076d80ec29/8.8.4/share/x86_64-osx-ghc-8.8.4/github-get-0.1.0.0"
libexecdir = "/Users/suzukimiyuki/Desktop/software_engineering-github_api/.stack-work/install/x86_64-osx/430842418534c0c2e8add34d28a04a7146b4de1d825ea76feb3020076d80ec29/8.8.4/libexec/x86_64-osx-ghc-8.8.4/github-get-0.1.0.0"
sysconfdir = "/Users/suzukimiyuki/Desktop/software_engineering-github_api/.stack-work/install/x86_64-osx/430842418534c0c2e8add34d28a04a7146b4de1d825ea76feb3020076d80ec29/8.8.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "github_get_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "github_get_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "github_get_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "github_get_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "github_get_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "github_get_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
