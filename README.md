# Ten

A long/short portfolio tool. Upload a monthly sheet, rank the companies on a metric you choose (PEG, PE, ROE or any other column), go long the best ten and short the worst ten, and get the trades to make each month. It tracks brokerage, STT and a borrow fee on shorts, and shows portfolio statistics and a trade ledger.

The whole app is the single file `index.html`.

## Saving your data

By default the page saves to the browser you use. To save to an account instead (so it works across devices and survives clearing site data), connect a free Supabase project:

1. Create a project at supabase.com.
2. Open **SQL Editor**, paste the contents of `supabase-setup.sql`, and run it.
3. In **Authentication -> Providers -> Email**, keep email sign-in on. For the simplest sign-up, turn off "Confirm email".
4. In **Project Settings -> API**, copy the **Project URL** and the **anon public key**.
5. In `index.html`, find the line `var SUPABASE_URL = "", SUPABASE_ANON_KEY = "";` and put the two values between the quotes. The anon key is meant to be public: the database rules in step 2 make each user's data readable only by that user.
6. Commit. The page now asks you to sign in and saves your portfolio to your account.

Never put the `service_role` key in this file.
