{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "82c6240d-df10-420d-b21b-483ff0d0e9c4",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "START\n",
      "DONE\n"
     ]
    }
   ],
   "source": [
    "import pandas as pd\n",
    "\n",
    "print(\"START\")\n",
    "\n",
    "df1 = pd.read_csv(\"input/sample_metadata.csv\")\n",
    "df2 = pd.read_csv(\"input/mass_spec_results.csv\")\n",
    "\n",
    "pd.merge(df1, df2, on=\"sample_id\", how=\"inner\").to_csv(\"output/inner.csv\")\n",
    "pd.merge(df1, df2, on=\"sample_id\", how=\"left\").to_csv(\"output/left.csv\")\n",
    "pd.merge(df1, df2, on=\"sample_id\", how=\"right\").to_csv(\"output/right.csv\")\n",
    "pd.merge(df1, df2, on=\"sample_id\", how=\"outer\").to_csv(\"output/outer.csv\")\n",
    "\n",
    "print(\"DONE\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": None,
   "id": "7a6f5da9-60e2-4b05-8796-99aca396e2fb",
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3 (ipykernel)",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.10.10"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
